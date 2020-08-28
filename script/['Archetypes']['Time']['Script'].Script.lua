--时钟模块
a= 0			--a为总秒数
s= 0
d= 0
h= 0
function timechange()
	s = a%60				--s为秒
	t1,t2 = math.modf(a/60)
	d = t1%60					--d为分
	h,t2 = math.modf(a/3600)	--h为时
	
end
while true do 
	timechange()					--秒分时换算
	world.Time.ScreenGUI.Text.Text = h.." : "..d.." : "..s  	--将时间映射到UI
	world.Time.minute.Value = t1  --将总分钟数映射到值便于之后判断
	wait(1)
	a = a + 1
end