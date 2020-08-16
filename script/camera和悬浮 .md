## 脚本说明

文件名里有脚本根目录

  





------

### Camera.Script

每帧执行，构造monitor射线检测

**oriVec**

```
local oriVec = {Vector3(5,-5,0), --Camera1
				Vector3(0,-5,5),--Camera2
				Vector3(-5,-5,0),--Camera3
				Vector3(5,-5,0)}--Camera4
```

+ Vector3(x,y,z) y值是射线终点和起点的相对高度
+ 另一个非零值是射线检测的长度（在水平面上的投影）

![图片](https://github.com/Domotono/2020LLS_GameJam/blob/master/code_learn/%24TB_7%5DXL_FRUH24WM%7B%604Y%400.png)







要增加**carema**

```
--Camera1234的检测射线起点（相机位置为起点）
local Start = { script.Parent.Camera1.Position,
				script.Parent.Camera2.Position,
				script.Parent.Camera3.Position,
				script.Parent.Camera4.Position } 
--构造射线
	res1 = Physics:Raycast(Start[1] , getEndPosition(1) , true)
	res2 = Physics:Raycast(Start[2] , getEndPosition(2) , true)
	res3 = Physics:Raycast(Start[3] , getEndPosition(3) , true)
	res4 = Physics:Raycast(Start[4] , getEndPosition(4) , true)

```











------

### Camera.Angle.Script

旋转角度控制

**wait(角速度)**

**角度上下限**

```
if i == 0 then  --0
	flag = 1 
end
		
if i == 180 then  --180
	flag = -1 
end
```











------

### IsOnAlert.ValueChangeEvent

灯控制

**wait(灯亮时间)**

**灯颜色**

```
local RED = Color(255,0,0,255)
local BLUE = Color(0,0,255,255)

script.Parent.Parent.SpotLight.SpotLight1.Color=
```

------

### SuspScript

复制目标（悬浮）：把这个脚本复制到这个Obj下面

悬浮高度  height

悬浮持续时间 suspendTime

```
local height = 1.5 
local suspendTime = 5 
```

上下过程 时间wait(每次变化的时间)
```
	for i = 0 , height , 0.1 do 
		--print("上"..i)
		Obj.Position = Obj.Position + Vector3.Up * 0.1
		wait(0.05)--改这边大小 越大越慢
	end
```

