local Obj = script.Parent.Cube
local door = script.Parent
local left = door.entranceleft
local right = door.entranceright
local up = door.entranceup
local player = localPlayer

local height = 1.5
local suspendTime = 5 --悬浮持续时间
local isOnColl = false
i = 0
j= 0.2 --开关门速度

Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		i = i + j	
		isOnColl = true
		while(i <= 0.5 and isOnColl == true) and wait(0.1)
		do
			left.LocalPosition = Vector3(0.6412+i,-2.9142,-0.3289)
			left.Stretch = Vector3(1.4629-2*i,1.4629,1.4629)
			right.LocalPosition = Vector3(-0.8219-i,-2.9577,-0.3479)
			right.Stretch = Vector3(1.4629-2*i,1.4629,1.4629) 
			i = i + j
		end
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		isOnColl = false
		i = i - j
		while( i >= 0 and isOnColl == false) and wait(0.1)
		do
			left.LocalPosition = Vector3(0.6412+i,-2.9142,-0.3289)
			left.Stretch = Vector3(1.4629-2*i,1.4629,1.4629)
			right.LocalPosition = Vector3(-0.8219-i,-2.9577,-0.3479)
			right.Stretch = Vector3(1.4629-2*i,1.4629,1.4629)
			i = i - j
		end
	end

end)


