

local Obj = script.Parent
local player = localPlayer



Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('PlayerInstance')	--判断是否碰撞玩家
		and  Obj.IsStatic == true
	then	
		--UI展示（发亮）
		print("请摁3冰冻")
		--UI展示
		
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		isOnColl = false
		--print(isOnColl)
	end

end)


Input.OnKeyDown:Connect(function() --按键事件
	
	
	if Input.GetPressKeyData(Enum.KeyCode.Three) == 1 and isOnColl == true  
	then			
		print("有3了")
		if world.AbilityValue3.Value - 30 >= 0 
		then 
			world.AbilityValue3.Value = world.AbilityValue3.Value - 30
			Obj.IsStatic = false  --触发响应事件
			
		else
			print("3能量不足！！！！")
		end
	end
	
end)


