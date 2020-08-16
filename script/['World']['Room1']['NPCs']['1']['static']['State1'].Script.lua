local NPC = script.Parent
NPC.GoPoint.Value = NPC.Position
local P = NPC.Position
local R = NPC.Rotation
local stayTime = 5

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

	if NPC.NPCState.Value == 1 then
		--NPC.IsStatic = false
		if arrivalN(NPC.Position,P)== true 
		then
			--wait(stayTime)
			NPC.NPCState.Value = 3
		end
	end
	
end

local OldL = world.Life.Value
while wait() do
	
	if	world.Life.Value < OldL then 
		NPC.Position = P
		NPC.Rotation = R
		world.Life.Value = 3
		print("----")
	end 
	
end
