local Obj = script.Parent
Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
		localPlayer.Health = 0
	end
end)
