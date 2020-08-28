local fire1 = script.Parent.Flame1.Flamethrower1
local fire2 = script.Parent.Flame2.Flamethrower2
local fire3 = script.Parent.Flame3.Flamethrower3
local fire4 = script.Parent.Flame4.Flamethrower4
local Cube1 = script.Parent.Flame1.Cube1
local Cube2 = script.Parent.Flame2.Cube2
local Cube3 = script.Parent.Flame3.Cube3
local Cube4 = script.Parent.Flame4.Cube4

function jianbian(Cube)  --碰撞体由短变长
	a = 0
	while a < 6 do
		wait(0.06)
		Cube.LocalPosition = Vector3(0,0,a)
		a=a+1
	end	
end
function open(fire,Cube)	--打开火焰
	fire:SetActive(true)
	jianbian(Cube)
end
function close(fire,Cube)	--关闭火焰
	fire:SetActive(false)
	Cube.LocalPosition = Vector3(0,0,0.1)
end

--四个火焰分别交替出现，交替时间可在wait（）里面自由设定，以下函数可自由更改
while true do
	close(fire3,Cube3)
	open(fire1,Cube1)
	close(fire2,Cube2)
	open(fire4,Cube4)
	wait(2)
	close(fire4,Cube4)
	open(fire2,Cube2)
	close(fire1,Cube1)
	open(fire3,Cube3)
	wait(2)
end
--相应的火焰开关函数已封装好，可以改变各个火焰开关的顺序以及可以通过wait里的值改变间隔时间


