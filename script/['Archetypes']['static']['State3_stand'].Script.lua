local NPC = script.Parent
local Dir = NPC.Forward
local stayTime = 5
local P = NPC.Position
while wait() do

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
	
end
