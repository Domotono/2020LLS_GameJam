local EnergyCharge = script.Parent
EnergyCharge.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
		world.Voice.Charge:Play()
		world.AbilityValue.Value=100
	end
end)
