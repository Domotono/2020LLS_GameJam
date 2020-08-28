--值对象改变事件. 父类为值对象，当值数据改变时会触发
--第一参数(OldValue): 旧值
--第二参数(NewValue): 新值
local RED = Color(255,0,0,255)
local BLUE = Color(0,0,255,255)

if NewValue == true then

	script.Parent.Parent.SpotLight.SpotLight1.Color=RED
	print("红灯亮")
	--ValueChangeEvent:wait(10)
	wait(10)
	--ValueChangeEvent.Parent = false
	world.Room1.IsOnAlert.Value = false
else
	script.Parent.Parent.SpotLight.SpotLight1.Color=BLUE
	print("蓝灯亮")
end