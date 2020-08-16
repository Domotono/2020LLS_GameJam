local Ai = {}
	Ai.__index = Ai
	local PathFindingModule = require(AIModule.PathFindingModule)
	local FlockingModule = require(AIModule.FlockingModule)
	function Ai:Initial(Pos,NpcName)
		local self = setmetatable({},Ai)
		self.Npc = world:CreateInstance(NpcName,NpcName,world.Npcs,Pos)
		return self
	end
	
	function Ai:Walk(Dir)
		self.Npc:FaceToDir(Dir,10)
		self.Npc:MoveTowards(Vector2(Dir.x,Dir.z))
	end

	function Ai:Stop()
		self.Npc:MoveTowards(Vector2.Zero)
	end

	function Ai:AiMove(StartPoint,EndPoint)
		invoke(function()
			local Path = PathFindingModule.New(StartPoint,EndPoint)
			local Level = 1
			local Route 
			local status,err = pcall(function() Route = Path:GetResult() end)
			if Route and status and #Route>0 then
				print(table.unpack(Route))
				
				local Positions = {}
				for i=#Route,1,-1 do
					table.insert(Positions,Vector3(Route[i][1]/Level,0,Route[i][2]/Level))
				end
				print(table.unpack(Positions))
				for i=2,#Positions do
					self:Walk(Vector3(Positions[i].x-Positions[i-1].x,0,Positions[i].z-Positions[i-1].z))
					local Dis = (Vector2(Positions[i].x,Positions[i].z)-Vector2(Positions[i-1].x,Positions[i-1].z)).Magnitude
					wait(Dis/self.Npc.WalkSpeed)	
				end
				self:Stop()
			end
		end)
	end
	
	function Ai:Follow(Group,Leader,NeighborDist)
		local Follower = self.Npc
		self:AiMove(Follower.Position,localPlayer.Position)
		
	--[[	print((Follower.Position-Leader.Position).Magnitude>NeighborDist)
		if (Follower.Position-Leader.Position).Magnitude>NeighborDist then
			local Vel= FlockingModule:GetAverage(self,Group,Leader,NeighborDist)
			self:Walk(Vel)
		else
			self:Stop()
		end]]
	end

return Ai