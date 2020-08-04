--值对象改变事件. 父类为值对象，当值数据改变时会触发
--第一参数(OldValue): 旧值
--第二参数(NewValue): 新值
local RED = Color(255,0,0,255)
local BLUE = Color(0,0,255,255)

if NewValue == true then
	world.Room1.Spotlight.Spotlight.Color=RED
	--ValueChangeEvent:wait(10)
	wait(10)
	--ValueChangeEvent.Parent = false
	world.Room1.IsOnAlert.Value = false
else
	world.Room1.Spotlight.Spotlight.Color=blue
end