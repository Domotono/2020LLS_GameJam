local NPC = script.Parent
local stayTime = 6
function arrivalN(StartPoint,EndPoint)

	--NPC.GoPoint.Value = EndPoint
	if (StartPoint-EndPoint).Magnitude < 2
	then
			--print("true")
			return true
	else
			--print("false")
			return false
	end
		
end

while wait() do

	if NPC.NPCState.Value == 2 then
		--NPC.IsStatic = false
		if arrivalN(NPC.Position,NPC.GoPoint.Value)== true 
		then
			wait(3)
			--NPC:MoveTowards(Vector2.Zero)
			local T = stayTime
			while T>0 do
				NPC:FaceToDir(NPC.Right, 10)
				wait(1)
				T= T -1
			end
			NPC.NPCState.Value = 1
		end
	end
	
end



