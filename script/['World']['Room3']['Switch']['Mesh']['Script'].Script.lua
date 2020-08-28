local Obj = script.Parent
--board1
--控制对象
local Box = script.Parent.Switch
--终点位置
local End= script.Parent.Switch.EndRef.Value
--起点位置
local Begin = script.Parent.Switch.BeginRef.Value
--------------目标参数
--目标当前移动方向
local Target = Box.Target
--local Final = Box.Final
--碰撞艺术术品的名字

t1 = Tween:TweenProperty(Box, {Position = Target.Value.Position}, 5, Enum.EaseCurve.SinInOut)
--p1 = Tween:TweenProperty(Box, {Position = Final.Value.Position}, 1, Enum.EaseCurve.SinInOut)
--注册动画结束事件
t1.OnComplete:Connect(function()
	wait(3)
	t1:Reverse()
end)
Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
		print("碰撞")
		t1:Play()
		world.Voice.Switch:Play()
		script.Parent.pengzhuangt:Destroy()
	end
end)
