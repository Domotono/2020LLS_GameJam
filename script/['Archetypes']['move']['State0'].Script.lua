local Obj = script.Parent
local P = Obj.Position
local R = Obj.Rotation
local staticTime = 6 --静止时间
while wait() do
	if Obj.NPCState.Value == 0 then
		if Obj.NPCState.Value == 0 then
		Obj.IsStatic = true
		--print("0")
		wait(staticTime)
		Obj.IsStatic = false
		Obj.NPCState.Value = 1
	end 
end