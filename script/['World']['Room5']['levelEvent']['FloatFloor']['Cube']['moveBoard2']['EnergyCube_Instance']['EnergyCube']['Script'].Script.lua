local sphere = script.Parent
sphere.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
		localPlayer.Avatar.LifeValue.Value=localPlayer.Avatar.LifeValue.Value+0.1
		sphere.ConfettiBlastRainbow:SetActive(true)
		wait(0.5)
		world.Voice.GetItem:Play()
		sphere:Destroy()
	end
end)


