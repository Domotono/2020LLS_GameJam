local Obj = script.Parent
local player = localPlayer
local size = 1 --冰块的size
local isFrozen = false

Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject== localPlayer	--判断是否碰撞玩家
		and  Obj.IsStatic == true and isFrozen == false
	then	
		--UI展示（发亮）
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
	
	
	if Input.GetPressKeyData(Enum.KeyCode.Three) == 1 and isOnColl == true and world.S3.Value == 50
	then			
		print("有3了")
		if world.AbilityValue.Value - 30 >= 0 
		then 
			world.AbilityValue.Value = world.AbilityValue.Value - 30
			Obj.IsStatic = false  --触发响应事件
			isFrozen = true
			world.Voice.Frozen:Play()
			local Pos = Vector3(Obj.Position.x,Obj.Position.y-size ,Obj.Position.z) --特效生成的位置
			local Eff = world:CreateInstance('Frozen','FrozenEffect',Obj,Pos,EulerDegree.Zero)	--创建特效
			Eff.Scale = size
		else
			print("能量不足！！！！")
		end
	end
	
end)


