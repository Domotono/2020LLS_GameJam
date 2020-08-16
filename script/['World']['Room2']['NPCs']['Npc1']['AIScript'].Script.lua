local PathFindingModule = require(PathFindingModule)
local Obj = script.Parent
local WalkSpeed = Obj.WalkSpeed
local go = Obj.GoPoint
local originN = Obj.Position -----出生点
local Nodes = { Obj.Parent.Node1_1.Position,  ----巡逻点 从第一个点走依次走到最后一个点 然后从最后一个点回来
				Obj.Parent.Node1_2.Position,}

local NPCState = 1



-----------移动相关函数
function aiMove(StartPoint,EndPoint)
		invoke(function()
			local Path = PathFindingModule.New(StartPoint,EndPoint)
			local Level = 1
			local Route 
			local status,err = pcall(function() Route = Path:GetResult() end)
			if Route and status and #Route>0 then
				--print(table.unpack(Route))
				
				local Positions = {}
				for i=#Route,1,-1 do
					table.insert(Positions,Vector3(Route[i][1]/Level,0,Route[i][2]/Level))
				end
				--print(table.unpack(Positions))
				for i=2,#Positions do
					--print(Vector3(Positions[i].x,Positions[i].y,Positions[i].z))
					aiWalk(Vector3(Positions[i].x-Positions[i-1].x,0,Positions[i].z-Positions[i-1].z))
					local Dis = (Vector2(Positions[i].x,Positions[i].z)-Vector2(Positions[i-1].x,Positions[i-1].z)).Magnitude
					wait(Dis/WalkSpeed)	
				end
				aiStop()
			end
		end)
		
		if (StartPoint-EndPoint).Magnitude < 2
		then
			--print("true")
			return true
		else
			return false
		end
end

function aiWalk(Dir)
	Obj:FaceToDir(Dir,10)
	Obj:MoveTowards(Vector2(Dir.x,Dir.z))
	--NPCState = 1
end

function aiStop()
	Obj:MoveTowards(Vector2.Zero)
	--NPCState = 0
end
-----------移动相关函数

--------------临时变量以及其初始值-----------------------------

local flag = 1
local i = 2
-----------------------手写状态机-------------------------------
while wait() do


	---------------------------------------------------
	
	
	if NPCState == 1 then
		--print(i)
		local f = aiMove(Obj.Position , Nodes[i])
		if f == true then
			wait(5)
			
			if i == 1  then
				flag = 1
			elseif i == #Nodes then
				flag = -1	
			end
			print(i)
			i = i + flag
		end
	-----------------------------------------------------
	--else if 
	end
end



