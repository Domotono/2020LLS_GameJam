-------------非常暴力的追踪卡墙应对策略
local NPC = script.Parent
local OldP = script.Parent.Position
local flag = false
while wait(10) do --每20秒检测一次是否原地打转
	--print(OldP)
	local NewP = script.Parent.Position
	
	if (NewP-OldP).Magnitude < 2 and NPC.NPCState.Value ~= 0 and NPC.NPCState.Value ~= 3
		and flag
	then
		NPC.NPCState.Value = 4 --回去
		flag = false
	end
	
	OldP=NewP
end

NPC.OnCollisionBegin:Connect(function(HitObject)
	if CollisionType == Enum.CollisionEventType.Enter and
	HitObject:IsA('PlayerInstance') == false and--不是玩家或者Npc
	HitObject~=world.BaseFloor and--不是地板
	HitObject.Name ~= ("BaseFloor")
	then
		flag = true
	end
	
end)



	
