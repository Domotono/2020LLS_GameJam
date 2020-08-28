local Obj = script.Parent
local isOnColl = false
local enable = true

Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家

		print("请摁c打开宝物")
		isOnColl = true
	end
end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时
	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		isOnColl = false
	end
end)

function opengift()
	if world.Time.minute.Value <= 10 then		-- 一等奖十分钟以内
		Obj.gift1:SetActive(true)
	elseif 10 < world.Time.minute.Value and world.Time.minute.Value<= 15 then --二等奖10到15分钟
		if math.random(0,1)==0 then				--产生随机数在二等奖中随机生成一个礼物
			Obj.gift2:SetActive(true)
		else 
			Obj.gift3:SetActive(true)
		end
	else 										--三等奖15分钟以上
		if math.random(0,1)==0 then				
			Obj.gift4:SetActive(true)
		else 
			Obj.gift5:SetActive(true)
		end
	end
end

Input.OnKeyDown:Connect(function() --按键事件
	if Input.GetPressKeyData(Enum.KeyCode.C) == 1 and isOnColl == true and enable == true
	then
		enable = false			--只可打开一次
		opengift()				--打开宝物函数
		print("ok")
		--开宝物动画以及ui文字等等可以放在这里
	end
end)

