## 脚本说明

文件名里有脚本根目录



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

![$TB_7]XL_FRUH24WM{`4Y@0](F:\lls\MyProject\LEARN\2020lls_gamejam\code_learn\$TB_7]XL_FRUH24WM{`4Y@0.png)



### Camera.Angle.Script

旋转角度控制

**wait(角速度)**



### IsOnAlert.ValueChangeEvent

灯控制

wait(灯亮时间)