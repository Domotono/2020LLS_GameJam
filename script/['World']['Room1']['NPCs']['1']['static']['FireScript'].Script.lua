--print("Hello world!")
local Obj = script.Parent
local player = localPlayer
----可调节参数----
local BuffTime = 15 --持续时间
local mul = 0.5 --速度变化

local TimeLeft = 0 --初始化时间
local OnFire = false	--记录是否已经着火
local NPC = Obj.Parent.Parent.NPCs:GetChildren()

Obj.OnCollisionBegin:Connect(function(HitObject)--玩家触碰时

	
	
	if HitObject:IsA('PlayerInstance')	--判断是否碰撞玩家
		and  Obj.IsStatic == true
	then	
		--UI展示（发亮）
		print("请摁4放火")
		--UI展示
		
		isOnColl = true
		--print(isOnColl)
	end
	
	

end)
Obj.OnCollisionEnd:Connect(function(HitObject)	--玩家不再触碰时

	if HitObject:IsA('PlayerInstance')then	--判断是否碰撞玩家
		isOnColl = false
		--print(isOnColl)
	end

end)


Input.OnKeyDown:Connect(function() --按键事件
	
	
	if Input.GetPressKeyData(Enum.KeyCode.Four) == 1 and isOnColl == true  and OnFire == false
	then			
		print("有4了")
		if world.AbilityValue3.Value - 30 >= 0 
		then 
			world.AbilityValue3.Value = world.AbilityValue3.Value - 30
			--触发响应事件
			local Pos = Vector3(Obj.Position.x,Obj.Position.y + 1 ,Obj.Position.z) --特效生成的位置
			Effect = world:CreateInstance('smoke','smokeEffect',Obj,Pos,EulerDegree.Zero)	--创建特效
			TimeLeft = BuffTime
			OnFire = true
			
			setNpc(P)--被追击
			NPC.WalkSpeed = NPC.WalkSpeed * mul
			
		else
			print("3能量不足！！！！")
		end
	end
	
end)

function setNpc(P)
	
	for _,v in pairs(NPC) do
		v.NPCState.Value = 2
		v.GoPoint.Value = pos
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
	wait(1)
	Eff:Destroy()
	Obj:Destroy()
end
	
end

