local Obj = script.Parent
local player = localPlayer
local isOnColl = false
local Ftime = 5
Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject== localPlayer and Obj.InSight.Value == false  --判断是否碰撞玩家
		--and  Obj.IsStatic == true
	then
		
		print("请摁3冰冻")
		--UI展示
		
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject== localPlayer then	--判断是否碰撞玩家
		isOnColl = false
		--print(isOnColl)
	end

end)


Input.OnKeyDown:Connect(function() --按键事件
	
	
	if Input.GetPressKeyData(Enum.KeyCode.Three) == 1 and isOnColl == true  and Obj.InSight.Value == false
	then			
		print("有3了")
		if world.AbilityValue3.Value - 30 >= 0 
		then 
			world.AbilityValue3.Value = world.AbilityValue3.Value - 30
			--Obj.IsStatic = false  --触发响应事件
			Obj.Deceleration = 10
			--Obj.NPCState.Value = 0
			wait(Ftime)
			Obj.Deceleration = 5000
		else
			print("3能量不足！！！！")
		end
	end
	
end)


