--该脚本放在想要监听的对象下面，当父类触发事件(进入、持续、离开)时都会触发
--第一参数(CollisionType): 事件类型 Enum.CollisionEventType.Enter | Enum.CollisionEventType.Leave
--第二参数(HitObject): 与父类对象碰撞的对象
--第三参数(HitPoint): 碰撞点 
--第四参数(HitNormal): 碰撞法线


if HitObject == localPlayer and  NPC.InSight.Value == true
then
		wait(1)
		if NPC.InSight.Value == true
		then
			print("玩家被抓")
			NPC.Position = P
			NPC.Rotation = R
			world.Life.Value = 3
			localPlayer.Health = 0
		end
end