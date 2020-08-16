local PathFinding = {}
PathFinding.__index = PathFinding
local Floor = world.BaseFloor
local Exist = 1
local NotExist = 0
local OpenListLength = 0
local Conter = 5000
local Level = 1
local IsFound = false
local IsExist = 1
local PosG = 2
local PosH = 3
local PosF = 4
local ParentDir = 5
local Dir_Null = 0
local Dir_Down = 1
local Dir_Up = 2
local Dir_Left = 3
local Dir_Right = 4
local Dir_UpLeft = 5
local Dir_UpRight = 6
local Dir_DownLeft = 7
local Dir_DownRight = 8
local NoPassPoints = {}

function PathFinding:Init()
	self.OpenList = {}
	self.CloseList = {}	
	self.MapData = {}
	self.StartX = 0
	self.StartY = 0
	self.EndX = 0
	self.EndY = 0
	local FloorStartX = math.ceil(Floor.Position.x-Floor.Size.x/2)
	local FloorEndX = math.ceil(Floor.Position.x+Floor.Size.x/2)
	local FloorStartY = math.ceil(Floor.Position.z-Floor.Size.z/2)
	local FloorEndY = math.ceil(Floor.Position.z+Floor.Size.z/2)
	local Width = math.floor(Floor.Size.x)*Level
	local Height = math.floor(Floor.Size.z)*Level
	self.Width = Width
	self.Height = Height
	for i=-100,100 do
		wait()
		for j=-100,100 do
			local Ray = Physics:RaycastAll(Vector3(i,30,j),Vector3(i,0.5,j),false)
			for _,v in pairs(Ray.HitObjectAll) do
				if v.Block and v~=Floor then
					table.insert(NoPassPoints,v)
					break
				end
			end
		end
	end
	local MapData = {}
	for i=FloorStartX,FloorEndX do
		MapData[i]={}
		for j=FloorStartY,FloorEndY do
			MapData[i][j] = InNoPass(i,j) and 1 or 0
		end
	end
	self.MapData = MapData
end


function PathFinding.New(StartPos,EndPos)
	local Instance = setmetatable({}, PathFinding)
	Instance:GetMapData(StartPos,EndPos)
	Instance:InitOpenList()
	Instance:InitCloseList()
	return Instance
end

function InNoPass(i,j)
	if NoPassPoints[Vector2(i,j)] then
		return true
	end
	return false
end

function PathFinding:GetMapData(StartPos,EndPos)
	local CStartPosX = math.ceil(StartPos.x)
	local CStartPosY = math.ceil(StartPos.z) 
	local CEndPosX = math.ceil(EndPos.x)
	local CEndPosY = math.ceil(EndPos.z) 
	self.Width = CEndPosX-CStartPosX
	self.Height = CEndPosY-CStartPosY
	self.StartX = CStartPosX--+(self.Width>0 and -50 or 50)
	self.StartY = CStartPosY--+(self.Height>0 and -50 or 50)
	self.EndX = CEndPosX--+(self.Width>0 and 50 or -50)
	self.EndY = CEndPosY--+(self.Height>0 and 50 or -50)
	self.OriStartX = CStartPosX
	self.OriStartY = CStartPosY
	self.OriEndX = CEndPosX
	self.OriEndY = CEndPosY
end

function PathFinding:InitOpenList()
	local OpenList = {}
	for i=self.StartX,self.EndX,(self.Width>0 and 1 or -1) do
		OpenList[i]={}	
		for j=self.StartY,self.EndY,(self.Height>0 and 1 or -1) do
			OpenList[i][j]={}
			OpenList[i][j][IsExist] = NotExist
			OpenList[i][j][PosG] =  GetMapExpense(Dir_Null)
			OpenList[i][j][PosH] =  GetDistance(i,j,self.EndX,self.EndY)
			OpenList[i][j][PosF] = OpenList[i][j][PosG] + OpenList[i][j][PosH]
			OpenList[i][j][ParentDir] = Dir_Null
		end
	end	
	self.OpenList = OpenList
	OpenListLength = 0	
end

function PathFinding:InitCloseList()
	local CloseList = {}
	for i=self.StartX,self.EndX,(self.Width>0 and 1 or -1) do
		CloseList[i]={}
		for j=self.StartY,self.EndY,(self.Height>0 and 1 or -1) do
			CloseList[i][j] = false
		end
	end	
	self.CloseList = CloseList
end

function PathFinding:AddOpenList(X,Y)
	if self.OpenList[X][Y][IsExist] == NotExist then
		self.OpenList[X][Y][IsExist] = Exist
		OpenListLength = OpenListLength + 1
	end
end

function PathFinding:RemoveOpenList(X,Y)
	if self.OpenList[X][Y][IsExist] == Exist then
		self.OpenList[X][Y][IsExist] = NotExist
		OpenListLength = OpenListLength - 1
	end
end

function PathFinding:AddCloseList(X,Y)
	self.CloseList[X][Y] = true
end

function PathFinding:IsInCloseList(X,Y)
	return(self.CloseList[X] and self.CloseList[X][Y])
end	

function PathFinding:CanPass(X,Y)
	local a = (X-self.StartX)*(X-self.EndX)>0 or (Y-self.StartY)*(Y-self.EndY)>0
	if (X-self.StartX)*(X-self.EndX)>0 or (Y-self.StartY)*(Y-self.EndY)>0 then
		return false	
	elseif self.MapData[X][Y]~=0 then
		return false
	elseif self:IsInCloseList(X,Y) then
		return false
	end
	return true
end

function PathFinding:SetParentDir(X,Y,Dir)
	self.OpenList[X][Y][ParentDir] = Dir
end

function PathFinding:SetCost(X,Y,EndX,EndY,Dir)
	self.OpenList[X][Y][PosG] = self.OpenList[EndX][EndY][PosG] + GetMapExpense(Dir)
	self.OpenList[X][Y][PosH] = GetDistance(X,Y,EndX,EndY)
	self.OpenList[X][Y][PosF] = self.OpenList[X][Y][PosG]+ self.OpenList[X][Y][PosH]
end

function PathFinding:AddNewOpenList(X,Y,NewX,NewY,Dir)
	if self:CanPass(NewX,NewY) then
		if self.OpenList[NewX][NewY][IsExist] == Exist then
			if self.OpenList[X][Y][PosG]+GetMapExpense(Dir)<self.OpenList[NewX][NewY][PosG] then
				self:SetCost(X,Y,NewX,NewY)
			end
		else
			self:AddOpenList(NewX,NewY)
			self:SetCost(X,Y,NewX,NewY,Dir)
			self:SetParentDir(NewX,NewY,Dir)
		end
	end
end

function PathFinding:Search()
	self:AddOpenList(self.OriStartX,self.OriStartY)
	self:Finding(self.OriStartX,self.OriStartY)
end

function PathFinding:Finding(X,Y)
	local x = X
	local y = Y
	IsFound = false
	for i = 1,Conter do
		if math.fmod(i,10)==0 then
			wait()
		end
		if x==self.OriEndX and y==self.OriEndY then
			IsFound = true
			break
		elseif OpenListLength == 0 then
			IsFound = false
			break				
		end		
		self:RemoveOpenList(x,y)
		self:AddCloseList(x,y)	
		self:AddNewOpenList(x, y, x, y + 1, Dir_Up)
		self:AddNewOpenList(x, y, x, y - 1, Dir_Down)
		self:AddNewOpenList(x, y, x - 1, y, Dir_Right)
		self:AddNewOpenList(x, y, x + 1, y, Dir_Left)
		self:AddNewOpenList(x, y, x + 1, y + 1, Dir_UpLeft)
		self:AddNewOpenList(x, y, x - 1, y + 1, Dir_UpRight)
		self:AddNewOpenList(x, y, x + 1, y - 1, Dir_DownLeft)
		self:AddNewOpenList(x, y, x - 1, y - 1, Dir_DownRight)
		local CurCost = 99999999
		for i=self.StartX,self.EndX,(self.Width>0 and 1 or -1) do
			for j=self.StartY,self.EndY,(self.Height>0 and 1 or -1) do
				if self.OpenList[i][j][IsExist] == Exist then
					if CurCost>self.OpenList[i][j][PosF] then
						CurCost = self.OpenList[i][j][PosF]
						x=i
						y=j
					end
				end
			end
		end
	end
end

function GetMapExpense(Dir)
	return(Dir<5 and 10 or 14)
end

function GetDistance(X,Y,EndX,EndY)
	return 10*(math.abs(X-EndX)+math.abs(Y-EndY))
end

function PathFinding:GetResult()
	self:Search()
	if IsFound then
		local Route = {}
		local EndX = self.OriEndX
		local EndY = self.OriEndY
		table.insert(Route,{EndX,EndY})
		local Dir = self.OpenList[EndX][EndY][ParentDir]
		while (EndX~=self.OriStartX or EndY~=self.OriStartY) do
			if Dir == Dir_Down then EndY = EndY+1 
			elseif Dir == Dir_Up then EndY = EndY-1
			elseif Dir == Dir_Left then EndX = EndX-1
			elseif Dir == Dir_Right then EndX = EndX+1
			elseif Dir == Dir_UpLeft then EndX = EndX-1 EndY = EndY-1
			elseif Dir == Dir_UpRight then EndX = EndX+1 EndY = EndY-1
			elseif Dir == Dir_DownLeft then EndX = EndX-1 EndY = EndY+1
			elseif Dir == Dir_DownRight then EndX = EndX+1 EndY = EndY+1
			end
			Dir = self.OpenList[EndX][EndY][ParentDir]
			table.insert(Route,{EndX,EndY})
		end
		return Route
	end
end

PathFinding:Init()
return PathFinding