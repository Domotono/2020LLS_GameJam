local NPC = script.Parent
local OldL = world.Life.Value
local P = NPC.Position
local R = NPC.Rotation
local V = NPC.NPCState.Value
while wait() do
	--print(OldL)
	if	world.Life.Value < OldL then 
		print("----")
		NPC.Position = P
		NPC.Rotation = R
		NPC.NPCState.Value = V
		OldL = world.Life.Value
		--print("----")
	end 
	
end
