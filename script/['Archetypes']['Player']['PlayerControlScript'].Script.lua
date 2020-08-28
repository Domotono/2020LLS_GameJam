-- 获取本地玩家
local player = localPlayer
local Camera = localPlayer.Local.Independent.GameCamera

--声明变量
local isDead = false
local forwardDir = Vector3.Forward
local rightDir = Vector3.Right
local finalDir = Vector3.Zero
local horizontal = 0
local vertical = 0

--local energy = player.Local.ControlGUI.energytank.energyvalue.Value
--local tanksize = player.Local.ControlGUI.energytank.energy


-- 摄像机看向自己
world.CurrentCamera = player.Local.Independent.GameCamera
local camera = world.CurrentCamera
local mode = Camera.CameraMode
camera.LookAt = player

-- 手机端交互UI
local gui = player.Local.ControlGUI
local joystick = gui.Joystick
local touchScreen = gui.TouchFigure
local jumpButton = gui.JumpButton

-- PC端交互按键
local FORWARD_KEY = Enum.KeyCode.W
local BACK_KEY = Enum.KeyCode.S
local LEFT_KEY = Enum.KeyCode.A
local RIGHT_KEY = Enum.KeyCode.D
local JUMP_KEY = Enum.KeyCode.Space
local Crouch_KEY = Enum.KeyCode.LeftControl--下蹲按键
local Small_KEY = Enum.KeyCode.X	--变小按键
local face_KEY = Enum.KeyCode.Two	--转换形象按键
local faster_KEY = Enum.KeyCode.LeftShift --加速按键

-- 键盘的输入值
local moveForwardAxis = 0
local moveBackAxis = 0
local moveLeftAxis = 0
local moveRightAxis = 0

-- 移动方向是否遵循摄像机方向
function IsFreeMode()
	return (mode == Enum.CameraMode.Social and camera.Distance >= 0) or mode == Enum.CameraMode.Orbital 
		or mode == Enum.CameraMode.Custom
end

--获取按键盘时的移动方向最终取值
function GetKeyValue()
	moveForwardAxis = Input.GetPressKeyData(FORWARD_KEY) > 0 and 1 or 0
	moveBackAxis = Input.GetPressKeyData(BACK_KEY) > 0 and -1 or 0
	moveLeftAxis = Input.GetPressKeyData(LEFT_KEY) > 0 and 1 or 0
	moveRightAxis = Input.GetPressKeyData(RIGHT_KEY) > 0 and -1 or 0
	if player.State == Enum.CharacterState.Died then
		moveForwardAxis, moveBackAxis, moveLeftAxis, moveRightAxis = 0, 0, 0, 0
	end
end

-- 获取移动方向
function GetMoveDir()
	forwardDir = IsFreeMode() and camera.Forward or player.Forward 
	forwardDir.y = 0
	rightDir = Vector3(0, 1, 0):Cross(forwardDir)
	horizontal = joystick.Horizontal
	vertical = joystick.Vertical
	if horizontal ~= 0 or vertical ~= 0 then
		finalDir = rightDir * horizontal + forwardDir * vertical
	else
		GetKeyValue()
		finalDir = forwardDir * (moveForwardAxis + moveBackAxis) - rightDir * (moveLeftAxis + moveRightAxis)
	end
end

-- 移动逻辑
function PlayerMove(dir)
	dir.y = 0
	if player.State == Enum.CharacterState.Died then
		dir = Vector3.Zero
	end
	if dir.Magnitude > 0 then
		if IsFreeMode() then
			player:FaceToDir(dir, 4 * math.pi)
		end
		player:MoveTowards(Vector2(dir.x, dir.z).Normalized)
	else
		player:MoveTowards(Vector2.Zero)
	end
end

-- 跳跃逻辑
function PlayerJump()
	if (player.IsOnGround or player.State == Enum.CharacterState.Seated) and not isDead then
		player:Jump()
		return
	end	
end
jumpButton.OnDown:Connect(PlayerJump)
Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(JUMP_KEY) == 1 then
		PlayerJump()
	end
end)
--存档逻辑
local StartPortal
local StartPortal0 = Vector3(18.713,0.1762,-37.9075)
--local StartPortal1 = world.Room2.SaveMachine.SavePoint1.Position
local StartPortal1 = Vector3(-18.3508, 1.1813, -15.1176)
local StartPortal2 = world.Room4.SaveMachine.SavePoint2.Position - Vector3(0,0,4)
local StartPortal3 = world.Room4.SaveMachine.SavePoint3.Position - Vector3(0,0,4)
local StartPortal4 = world.Room5.SaveMachine.SavePoint4.Position - Vector3(0,0,4)
local StartPortal5 = world.Room5.SaveMachine1.SavePoint5.Position - Vector3(0,0,4)

local Onfile1 = world.Room2.SaveMachine.SavePoint1
local Onfile2 = world.Room4.SaveMachine.SavePoint2
local Onfile3 = world.Room4.SaveMachine.SavePoint3
local Onfile4 = world.Room5.SaveMachine.SavePoint4
local Onfile5 = world.Room5.SaveMachine1.SavePoint5
StartPortal=StartPortal0
Onfile1.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
		StartPortal=StartPortal1
		world.Voice.SavePoint:Play()
		print("保存了")
	end
end)
Onfile2.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
	    world.Voice.SavePoint:Play()
		StartPortal=StartPortal2
		print("保存了")
	end
end)
Onfile3.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
		world.Voice.SavePoint:Play()
		StartPortal=StartPortal3
		print("保存了")
	end
end)
Onfile4.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
	    world.Voice.SavePoint:Play()
		StartPortal=StartPortal4
		print("保存了")
	end
end)
Onfile5.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时
	if HitObject:IsA('PlayerInstance')  then	--判断是否碰撞玩家
	    world.Voice.SavePoint:Play()
		StartPortal=StartPortal5
		print("保存了")
	end
end)
local life=player.Avatar.LifeValue
local small_face = 0   --用此参数控制变小和变脸不能同时进行
--变小逻辑
function besamll()
	print("jinlaile")
  small_face = 1
  localPlayer.CharacterWidth = 0.1
  localPlayer.CharacterHeight = 0.15
  localPlayer.Avatar.HeadSize = 0.15
  localPlayer.Avatar.Width = 1.2
  localPlayer.Avatar.Height = 0.1
  localPlayer.WalkSpeed = 1.4
  localPlayer.JumpUpVelocity = 20
  Camera.Offset=Vector3(0,0.15,0)
  Camera.Distance = 1
 -- localPlayer.NameGUI:SetActive(false)
  print("chulaile")
end

function recover()
	print("huifule")
  small_face = 0
  localPlayer.CharacterWidth = 1
  localPlayer.CharacterHeight = 1.7
  localPlayer.JumpUpVelocity = 9.8
  localPlayer.Avatar.HeadSize = 1
  localPlayer.Avatar.Width = 1
  localPlayer.Avatar.Height = 1
  localPlayer.WalkSpeed = 6
  localPlayer.JumpUpVelocity = 9.8
  Camera.Offset=Vector3(0,1.5,0)
  Camera.Distance = 3
--  localPlayer.NameGUI:SetActive(true)
end
Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(Small_KEY) == 1 and not isDead  and small_face == 0 and world.S5.Value == 50
	then
		if world.AbilityValue.Value >= 40
		then 
		
			world.AbilityValue.Value = world.AbilityValue.Value - 40
			--print(energy)
			--tanksize.Size = Vector2(energy*4,80)
			besamll()	--变小
			world.Voice.Transform:Play()
			wait(15)
			print("zhunbeihuifule")
			recover()	--恢复原状
			
		else
			print("4能量不足！！！")  --主要是为了打印这个
		end
	end
end)
function resetdie()       --手写死亡后重置函数，死亡后需要更新的参数写在此处
	player.Position = StartPortal
	life.Value=life.Value-1
	recover()
	localPlayer.Avatar.robot:SetActive(false)
	localPlayer:EndCrouch()
	world.AbilityValue.Value = 100

end
-- 死亡逻辑
function PlayerDie()
	isDead = true

	if life.Value<2 then
	    world.Voice.Death:Play()
		world.ScreenGUIdie.Imagedie:SetActive(true)
		wait(2)
		Game:Quit()
	else
		wait(player.RespawnTime)
		player:Reset()
		resetdie()
		isDead = false
	end
end
player.OnDead:Connect(PlayerDie)
--摁shift加速逻辑(需要与下蹲与变小综合考虑)
Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(faster_KEY) == Enum.KeyState.KeyStatePress then
		player.WalkSpeed = 10
	end
end)
Input.OnKeyUp:Connect(function()
	if Input.GetPressKeyData(faster_KEY) == Enum.KeyState.KeyStateRelease then
		player.WalkSpeed = 6
	end
end)

-- 生命值检测
function HealthCheck(oldHealth, newHealth)
	if newHealth <= 0 then
		player:Die()
	end
end
player.OnHealthChange:Connect(HealthCheck)

-- 每个渲染帧处理操控逻辑
function MainControl()
	camera = world.CurrentCamera
	mode = camera.CameraMode
	GetMoveDir()
	PlayerMove(finalDir)
end
world.OnRenderStepped:Connect(MainControl)

-- 检测触屏的手指数
local touchNumber = 0
function countTouch(container)
	touchNumber = #container
end
touchScreen.OnTouched:Connect(countTouch)

-- 滑屏转向
function cameraMove(pos, dis, deltapos, speed)
	if touchNumber == 1 then
		if IsFreeMode() then
			camera:CameraMove(mode == Enum.CameraMode.Orbital and Vector2(deltapos.x, 0) or deltapos)
		else 
			player:RotateAround(player.Position, Vector3.Up, deltapos.x)
			camera:CameraMove(Vector2(0, deltapos.y))
		end
	end
end
touchScreen.OnPanStay:Connect(cameraMove)

-- 双指缩放摄像机距离
function cameraZoom(pos1, pos2, dis, speed)
	if mode == Enum.CameraMode.Social then
		camera.Distance = camera.Distance - dis / 50
	end
end
touchScreen.OnPinchStay:Connect(cameraZoom)
-- 下蹲
function PlayerCrouch()
	if localPlayer:IsCrouch() then
	     localPlayer:EndCrouch()
		 localPlayer.WalkSpeed = 6
	else
	    localPlayer:StartCrouch()
		localPlayer.WalkSpeed = 3
	return
	end
end
--crouchButton.OnDown:Connect(PlayerCrouch)
Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(Crouch_KEY) == 1 then
		PlayerCrouch()
	end
end)




	--复制敌人外表逻辑
function facechange()
  small_face = 1
  localPlayer.CharacterWidth = 1.4
  localPlayer.CharacterHeight = 1.8
  localPlayer.Avatar.HeadSize = 0.15
  localPlayer.Avatar.Width = 1.2
  localPlayer.Avatar.Height = 0.1
--  localPlayer.Avatar.CollisionGroup = 3
--  localPlayer.WalkSpeed = 6
--  localPlayer.JumpUpVelocity = 9.8
--  Camera.Offset=Vector3(0,0.15,0)
--  Camera.Distance = 1
--  localPlayer.NameGUI:SetActive(false)
  localPlayer.Avatar.robot:SetActive(true)	--机器人外表出现
end
function recoverface()
  small_face = 0
  localPlayer.CharacterWidth = 1
  localPlayer.CharacterHeight = 1.7
  localPlayer.Avatar.HeadSize = 1
  localPlayer.Avatar.Width = 1
  localPlayer.Avatar.Height = 1
--localPlayer.Avatar.CollisionGroup = 1

--  localPlayer.WalkSpeed = 6
--  localPlayer.JumpUpVelocity = 9.8
--  Camera.Offset=Vector3(0,1.5,0)
--  Camera.Distance = 3
--  localPlayer.NameGUI:SetActive(true)
  localPlayer.Avatar.robot:SetActive(false)
end
Input.OnKeyDown:Connect(function()
	if Input.GetPressKeyData(face_KEY) == 1 and not isDead  and small_face == 0 and world.S2.Value ==50
	then
		if world.AbilityValue.Value >= 20
		then 
		
			world.AbilityValue.Value = world.AbilityValue.Value - 20
			world.Voice.Transform2:Play()
			--print(energy)
			--tanksize.Size = Vector2(energy*4,80)
			facechange()	--形象改变
			wait(10)
			recoverface()	--恢复原状
			
		else
			print("4能量不足！！！")  --主要是为了打印这个
		end
	end
end)

-- 外挂满能量
Input.OnKeyDown:Connect(function()
     if Input.GetPressKeyData(Enum.KeyCode.M) == 1 and not isDead
	then
        world.AbilityValue.Value = 100
		world.S1.Value = 50
		world.S2.Value = 50
		world.S3.Value = 50
		world.S4.Value = 50
		world.S5.Value = 50
		print("获得能量一1000点")	

	end
end)
--复制的能量相关逻辑