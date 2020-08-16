local PathFindingModule = require(PathFindingModule)
local Obj = script.Parent
local WalkSpeed = 5
local Dir = Vector3.Zero
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
					aiWalk(Vector3(Positions[i].x-Positions[i-1].x,0,Positions[i].z-Positions[i-1].z))
					local Dis = (Vector2(Positions[i].x,Positions[i].z)-Vector2(Positions[i-1].x,Positions[i-1].z)).Magnitude
					wait(Dis/WalkSpeed)	
				end
				aiStop()
			end
		end)
end

function aiWalk(d)
	Dir = d.UnsafeNormalized
	--Obj.Position =  Obj.Position + Dir * (1/WalkSpeed) --每帧向前
	--print(Dir)
end

function aiStop()
	Dir = Vector3.Zero
	--print(Dir)
end

world.OnRenderStepped:Connect(function()

	if Dir ~= Vector3.Zero
	then
		Obj.Position =  Obj.Position + Dir * (1 * 0.016/WalkSpeed ) 
		
	end
	
end)
while true do
	wait()
	aiMove(Obj.Position , Obj.Parent.Node.Position)
end