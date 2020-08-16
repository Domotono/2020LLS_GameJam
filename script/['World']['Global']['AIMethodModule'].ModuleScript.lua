local AIMethod = {}
	AIMethod.__index = AIMethod
	local PathFindingModule = require(PathFindingModule)
	
	function AIMethod:Initial(NPC)
		local self = setmetatable({},AIMethod)
		self.AI = NPC
		self.NPCState = 0
		return self
	end
	
	function AIMethod:aiMove(StartPoint,EndPoint)
		
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
					print(Vector3(Positions[i].x,Positions[i].y,Positions[i].z))
					self:aiWalk(Vector3(Positions[i].x-Positions[i-1].x,0,Positions[i].z-Positions[i-1].z))
					local Dis = (Vector2(Positions[i].x,Positions[i].z)-Vector2(Positions[i-1].x,Positions[i-1].z)).Magnitude
					wait(Dis/self.AI.WalkSpeed)	
				end
				self:aiStop()
			end
		end)
		
		if (StartPoint-EndPoint).Magnitude<1 and  self.NPCState == 0
		then
			return true
		else
			return false
		end
		
	end

	function AIMethod:aiWalk(Dir)
		self.AI:FaceToDir(Dir,10)
		self.AI:MoveTowards(Vector2(Dir.x,Dir.z))
		NPCState = 1
		
	end

	function AIMethod:aiStop()
		
		self.AI:MoveTowards(Vector2.Zero)
		self.NPCState = 0
	
	end

return AIMethod