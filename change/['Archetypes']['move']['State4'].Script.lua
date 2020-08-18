local NPC = script.Parent
local wTime = 4

local P = NPC.Position
local to = {NPC.Right,NPC.Left}
while wait() do

	if NPC.NPCState.Value == 4 then
		--NPC.IsStatic = true
		
		NPC.Position = P
		--NPC.Forward = Dir 
		--NPC:FaceToDir(Dir, 5)
		print ("4")
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
	
end
