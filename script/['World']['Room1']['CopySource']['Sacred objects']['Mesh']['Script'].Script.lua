local Obj = script.Parent
local player = localPlayer
local isOnColl 
local enable = 1


Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('PlayerInstance') and enable == 1 then	--判断是否碰撞玩家
		--localPlayer.Local.ControlGUI.CopyButton.Color=Color(255,0,0,255)--复制键变为红色
		--UI展示（发亮）
		print("摁C获得复制能力")
		--UI展示
		
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		--localPlayer.Local.ControlGUI.CopyButton.Color=Color(0,170,255,255)--复制键变回浅绿色
		isOnColl = false
		--print(isOnColl)
	end

end)


Input.OnKeyDown:Connect(function() --如果按了复制键L 按键事件

	if Input.GetPressKeyData(Enum.KeyCode.C) == 1 and isOnColl == true and enable == 1
	then
		--localPlayer.Local.ControlGUI.s4:SetActive(true)	--技能槽s4出现
		--print(localPlayer.Local.ControlGUI.s4.ActiveSelf)
		Obj.PointLight:SetActive(false)  --复制源亮光消失
		--localPlayer.Local.ControlGUI.CopyButton.Color=Color(0,170,255,255)--复制键变回浅绿色
		enable = 0	--此物体失去复制源功能
		world.AbilityValue2.Value = 100  --触发响应事件	
	end
	
end)


