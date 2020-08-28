local NPC = script.Parent
NPC.GoPoint.Value = NPC.Position
local Ns = NPC.Parent.Parent.Nodes:GetChild(NPC.Name)
local Nodes =  Ns:GetChildren()----巡逻点 从第一个点走依次走到最后一个点 然后从最后一个点回来
--print(table.unpack(Nodes))
local P = NPC.Position
local R = NPC.Rotation
local V = NPC.NPCState.Value				
-------------------参数
local staticTime = 6 --静止时间
local stayTime = 3
-------------------临时变量
local flag = 1
local i = 1
local to = {NPC.Right,NPC.Left}
local OldL = localPlayer.Avatar.LifeValue.Value

function arrivalN(StartPoint,EndPoint)
	

	
	if (StartPoint-EndPoint).Magnitude < 1
	then
			--print("true")
			return true
	else
			NPC.GoPoint.Value = EndPoint
			--print("false")
			return false
	end
	
	
		
end

function nextNode()
	if i == 1  then
		flag = 1
	elseif i == #Nodes then
		flag = -1	
	end
	--print(i)
	i = i + flag
end

while wait() do

	if NPC.NPCState.Value == 0 then
		if NPC.NPCState.Value == 0 then
		NPC.IsStatic = true
		--print("0")
		wait(staticTime)
		NPC.IsStatic = false
		NPC.NPCState.Value = 1
		end
	end 

	if NPC.NPCState.Value == 1 then
		--NPC.IsStatic = false
		if arrivalN(NPC.Position,Nodes[i].Position)== true 
		then
			local T = stayTime
			while T>0 do
				NPC:FaceToDir(NPC.Right, 10)
				wait(1)
				T = T -1
			end
			nextNode()
		end
	end
	
	if NPC.NPCState.Value == 2 then
		--NPC.IsStatic = false
		if arrivalN(NPC.Position,NPC.GoPoint.Value)== true 
		then
			local T = stayTime
			while T>0 do
				NPC:FaceToDir(NPC.Right, 10)
				wait(1)
				T = T -1
			end
			NPC.NPCState.Value = 1
		end
	end
	
	if NPC.NPCState.Value == 4 then
		--NPC.IsStatic = true
		
		--NPC.Position = P
		--NPC.Forward = Dir 
		--NPC:FaceToDir(Dir, 5)
		print ("4")
		NPC:FaceToDir(NPC.Back, 10)
		NPC:MoveTowards(Vector2(NPC.Forward.x,NPC.Forward.z))
		wait(2)
		math.randomseed(os.time())
		local Dir = to[math.random(1,3)]
		NPC:FaceToDir(Dir, 10)
		NPC:MoveTowards(Vector2(NPC.Forward.x,NPC.Forward.z))
		wait(4)
		NPC.NPCState.Value = 1
		--print (NPC.Forward)
	end
	
	--print(OldL)
	if	localPlayer.Avatar.LifeValue.Value < OldL then 
		NPC.Position = P
		NPC.Rotation = R
		NPC.NPCState.Value = V
		OldL = localPlayer.Avatar.LifeValue.Value
		print("----")
	end 
	
end





