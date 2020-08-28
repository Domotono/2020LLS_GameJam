--值对象改变事件. 父类为值对象，当值数据改变时会触发
--第一参数(OldValue): 旧值
--第二参数(NewValue): 新值
local Obj = script.Parent			

if OldValue - NewValue > 0
then 
	localPlayer.Local.ScreenGUI.leftdown.blue.Size = Vector2(20*Obj.Value,1500)--将能量值映射到能量条
	wait(5)
	Obj.Value = Obj.Value + 0.2
	localPlayer.Local.ScreenGUI.leftdown.blue.Size = Vector2(20*Obj.Value,1500)--将能量值映射到能量条
elseif OldValue - NewValue < 0 and NewValue < 100
then

	wait(1)
	Obj.Value = Obj.Value + 0.2
   localPlayer.Local.ScreenGUI.leftdown.blue.Size = Vector2(20*Obj.Value,1500)--将能量值映射到能量条
else
	print("4满了")
end