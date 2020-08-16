local PathFindingModule = require(PathFindingModule)
local Obj = script.Parent.Parent
script.Parent.Value = Obj.Position
local WalkSpeed = Obj.WalkSpeed

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
		
		if (StartPoint-EndPoint).Magnitude < 1
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



while wait() do
	if Obj.NPCState.Value ~= 0 then
	
		local go = script.Parent.Value
		aiMove(Obj.Position , go)
	
	end
end



