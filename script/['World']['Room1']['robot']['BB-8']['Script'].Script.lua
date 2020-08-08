print("Hello world!")

local Obj = script.Parent
local player = localPlayer

local height = 1.5
local suspendTime = 5 --悬浮持续时间
local isOnColl = false
local i 

Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		
		--UI展示（发亮）
		print("请摁1")
		--UI展示
		
		isOnColl = true
		print(isOnColl)
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		isOnColl = false
		print(isOnColl)
	end

end)


Input.OnKeyDown:Connect(function() --按键事件
	--print("有了")
	--print(Input.GetPressKeyData(Enum.KeyCode.One))
	if Input.GetPressKeyData(Enum.KeyCode.One) == 1 and isOnColl == true
	then
				
		print("有1了")
		suspend()  --触发响应事件
				
	end
	
end)

function suspend() --响应事件
	
	
	for i = 0 , height , 0.1 do 
		--print("上"..i)
		Obj.Position = Obj.Position + Vector3.Up * 0.1
		wait(0.05)
	end

	wait(suspendTime)

	for i =  0 , height , 0.1 do 
		--print("下"..i)
		Obj.Position = Obj.Position - Vector3.Up * 0.1
		wait(0.05)
	end
end