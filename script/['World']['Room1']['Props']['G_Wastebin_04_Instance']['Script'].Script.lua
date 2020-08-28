local Obj = script.Parent
local player = localPlayer
local isOnColl 
local enable = 1


Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('PlayerInstance') and enable == 1 then	--判断是否碰撞玩家
		--localPlayer.Local.ControlGUI.CopyButton.Color=Color(255,0,0,255)--复制键变为红色
		--UI展示（发亮）
		world.AbilityValue1.Value = 100
		print("获得100点能量")
		--UI展示
		
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)