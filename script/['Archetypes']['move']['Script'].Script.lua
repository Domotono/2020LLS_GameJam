--print("Hello world!")
local Obj = script.Parent
local player = localPlayer

---------悬浮
local height = 3
local suspendTime = 5 --悬浮持续时间
---------冰冻时间
local Ftime = 6
--------火烧
local BuffTime = 5 --持续时间
local mul = 0.5 --速度变化



local TimeLeft = 0 --初始化时间
local OnFire = false	--记录是否已经着火
local NPC = Obj.Parent:GetChildren()
local isOnColl = false
local i 

Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject== localPlayer and Obj.InSight.Value == false then	--判断是否碰撞玩家
		
		--UI展示（发亮）
		print("请摁1悬浮摁3冰冻摁4放火")
		--UI展示
		
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject== localPlayer then	--判断是否碰撞玩家
		isOnColl = false
		--print(isOnColl)
	end

end)


Input.OnKeyDown:Connect(function() --按键事件
	--print("有了")
	--print(Input.GetPressKeyData(Enum.KeyCode.One))
	if Input.GetPressKeyData(Enum.KeyCode.One) == 1 and isOnColl == true and Obj.InSight.Value == false
	then
				
		print("有1了")
		
		--判断能量
		if world.AbilityValue.Value - 20 >= 0 
		then 
			world.AbilityValue.Value = world.AbilityValue.Value - 20
			suspend()  --触发响应事件
		else
			print("能量不足！！！！")
		end
		
				
	end
	
	if Input.GetPressKeyData(Enum.KeyCode.Three) == 1 and isOnColl == true  and Obj.InSight.Value == false
	then			
		print("有3了")
		if world.AbilityValue.Value - 30 >= 0 
		then 
			world.AbilityValue.Value = world.AbilityValue.Value - 30
			--Obj.IsStatic = false  --触发响应事件
			Obj.Deceleration = 10
			local Pos = Vector3(Obj.Position.x,Obj.Position.y-1 ,Obj.Position.z) --特效生成的位置
			local Eff = world:CreateInstance('Frozen','FrozenEffect',Obj,Pos,EulerDegree.Zero)	--创建特效
			
			Obj.NPCState.Value = 0
			Eff.Scale = 2
			wait(Ftime)
			Obj.Deceleration = 5000
			Eff:Destroy()
		else
			print("能量不足！！！！")
		end
	end
	
	if Input.GetPressKeyData(Enum.KeyCode.Four) == 1 and isOnColl == true  and OnFire == false
	then			
		print("有4了")
		if world.AbilityValue.Value - 30 >= 0 
		then 
			world.AbilityValue.Value = world.AbilityValue.Value - 30
			--触发响应事件
			local Pos = Vector3(Obj.Position.x,Obj.Position.y  ,Obj.Position.z) --特效生成的位置
			Effect = world:CreateInstance('smoke','smokeEffect',Obj,Pos,EulerDegree.Zero)	--创建特效
			TimeLeft = BuffTime
			OnFire = true
			
			setNpc(Obj.Position)--被追击
			Obj.WalkSpeed = Obj.WalkSpeed * mul
			
		else
			print("能量不足！！！！")
		end
	end
	
end)

function suspend() --响应事件
	local flag = Obj.IsStatic
	
	Obj.IsStatic = true
	
	for i = 0 , height , 0.1 do 
		--print("上"..i)
		Obj.Position = Obj.Position + Vector3.Up * 0.1
		wait(0.05)
	end

	wait(suspendTime)

	for i =  0 , height , 0.1 do 
		--print("下"..i)
		Obj.Position = Obj.Position - Vector3.Up * 0.1
		wait(0.05)
	end
	Obj.IsStatic = flag
end


function setNpc(P)
	
	for _,v in pairs(NPC) do
		v.NPCState.Value = 2
		v.GoPoint.Value = P
		--print("2")
	end

end

while wait(0.1) do 

if TimeLeft > 0 then
	TimeLeft = TimeLeft - 0.1 --控制Buff时间
elseif TimeLeft <= 0 and Effect~= nil then	--Buff时间到且正在着火
	Effect:Destroy()	--删除特效
	OnFire = false
	local Eff = world:CreateInstance('blast','blastEffect',Obj,Obj.Position,EulerDegree.Zero)	--创建特效
	local Collis = world:CreateInstance('Torus','TorusCollis',Obj,Obj.Position,EulerDegree.Zero)
	wait(0.3)
	--Eff:Destroy()
	Obj:Destroy()
end
	
end
