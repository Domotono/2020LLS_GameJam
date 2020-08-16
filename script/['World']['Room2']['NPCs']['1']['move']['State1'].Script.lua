local NPC = script.Parent
NPC.GoPoint.Value = NPC.Position
local Ns = NPC.Parent.Parent.Nodes:GetChild(NPC.Name)
local Nodes =  Ns:GetChildren()----巡逻点 从第一个点走依次走到最后一个点 然后从最后一个点回来
--print(table.unpack(Nodes))
local P = NPC.Position
local R = NPC.Rotation
				
-------------------参数
local stayTime = 3
-------------------临时变量
local flag = 1
local i = 1


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
	
end

----------NOBUGNOLIFE-------------------
local OldP = script.Parent.Position
while wait(20) do --20秒检测一次是否原地打转
	local NewP = script.Parent.Position
	if (NewP-OldP).Magnitude < 1 then
		nextNode() --换点
	end
	OldP=NewP
end

local OldL = world.Life.Value
while wait() do
	
	if	world.Life.Value < OldL then 
		NPC.Position = P
		NPC.Rotation = R
		NPC.NPCState.Value = 1
		OldL = world.Life.Value
		print("----")
	end 
	
end
