local Obj = script.Parent
local player = localPlayer


Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('Sphere')	--判断是否碰撞玩家
		
	then	
		--UI展示（发亮）
		print("zhuangji")
		print(HitObject.name)
        script.Parent.light4.Color = Color(255,255,255,255)
		world.Light4.Value = 1
		--UI展示
		world.Voice.Switch2:Play()
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)