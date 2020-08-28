local NPC = script.Parent
local P = NPC.Position
local R = NPC.Rotation

local staticTime0 = 5 
local stayTime2 = 5


local to = {NPC.Right,NPC.Left}

local OldL = localPlayer.Avatar.LifeValue.Value
local P = NPC.Position
local R = NPC.Rotation
local V = NPC.NPCState.Value

function arrivalN(StartPoint,EndPoint)

	
	if (StartPoint-EndPoint).Magnitude < 2
	then
			--print("true")
			return true
	else
			NPC.GoPoint.Value = EndPoint
			--print("false")
			return false
	end
		
end

while wait() do

	if NPC.NPCState.Value == 0 then
		NPC.IsStatic = true
		print("0")
		wait(staticTime0)
		NPC.IsStatic = false
		NPC.NPCState.Value = 1
	
	end 
	

	if NPC.NPCState.Value == 1 then
		--NPC.IsStatic = false
		if arrivalN(NPC.Position,P)== true 
		then
			--wait(stayTime)
			NPC.NPCState.Value = 3
		end
	end
	

	

	if NPC.NPCState.Value == 2 then
		--NPC.IsStatic = false
		if arrivalN(NPC.Position,NPC.GoPoint.Value)== true 
		then
			wait(3)
			--NPC:MoveTowards(Vector2.Zero)
			local T = stayTime2
			while T>0 do
				NPC:FaceToDir(NPC.Right, 10)
				wait(1)
				T= T -1
			end
			NPC.NPCState.Value = 1
		end
	end
	
	if NPC.NPCState.Value == 3 then
		--NPC.IsStatic = true
		--NPC.Position = P
		--NPC.Forward = Dir 
		--NPC:FaceToDir(Dir, 5)
		NPC:FaceToDir(NPC.Right, 10)
		wait(1)
		NPC:FaceToDir(NPC.Right, 10)
		wait(1)
		NPC:FaceToDir(NPC.Right, 10)
		wait(1)
		NPC:FaceToDir(NPC.Right, 10)
		wait(1)
		--print (NPC.Forward)
	end
	
	if NPC.NPCState.Value == 4 then
		--NPC.IsStatic = true
		--NPC.Position = P
		--NPC.Forward = Dir 
		--NPC:FaceToDir(Dir, 5)
		NPC:FaceToDir(NPC.Back, 10)
		NPC:MoveTowards(Vector2(NPC.Forward.x,NPC.Forward.z))
		wait(2)
		math.randomseed(os.time())
		local Dir = to[math.random(1,3)]
		NPC:FaceToDir(Dir, 10)
		NPC:MoveTowards(Vector2(NPC.Forward.x,NPC.Forward.z))
		wait(4)
		NPC.NPCState.Value = 1
		--print (NPC.Forward)
	end
	
	--print(OldL)
	if	localPlayer.Avatar.LifeValue.Value < OldL then 
		print("----")
		NPC.Position = P
		NPC.Rotation = R
		NPC.NPCState.Value = V
		OldL = localPlayer.Avatar.LifeValue.Value
		--print("----")
	end 

end
