local Camera = script.Parent
             -------------水平长         竖直高           
local oriVec = Camera.Left*10 + Vector3(0,-10,0)
local canSee = true
local r = 1  --哪个房间


local newVec
local angle = 0 
local inSight = false
local pos

local Room = world:GetChild("Room"..r)
local NPC = Room.NPCs:GetChildren()
--print(table.unpack(NPC))

function Update()
	
	
	
	res1 = Physics:Raycast(Camera.Position +  Camera.Forward , getEndPosition(angle) , canSee)
	res2 = Physics:Raycast(Camera.Position +  Camera.Forward , getEndPosition(20+angle) , canSee)
	res3 = Physics:Raycast(Camera.Position +  Camera.Forward , getEndPosition(40+angle) , canSee)
	res4 = Physics:Raycast(Camera.Position +  Camera.Forward , getEndPosition(60+angle) , canSee)
	
	
	-----人的条件判断
	if ( res1:HasHit() and res1:GetHitObj() == localPlayer ) 
	then
		pos = res1:GetHitPos()
		setNpc(pos)
		inSight = true
		--print("嗨，老兄弟，你被观察到了（翻译腔）")
	end
	
	if ( res2:HasHit() and res2:GetHitObj() == localPlayer ) 
	then
		pos = res2:GetHitPos()
		setNpc(pos)
		inSight = true
		--print("嗨，老兄弟，你被观察到了（翻译腔）")
	end
	
	if ( res3:HasHit() and res3:GetHitObj() == localPlayer ) 
	then
		pos = res3:GetHitPos()
		setNpc(pos)
		inSight = true
		--print("嗨，老兄弟，你被观察到了（翻译腔）")
	end
	
	if ( res4:HasHit() and res4:GetHitObj() == localPlayer ) 
	then
		pos = res4:GetHitPos()
		setNpc(pos)
		inSight = true
		--print("嗨，老兄弟，你被观察到了（翻译腔）")
	end
	
	inSight = false
end

world.OnRenderStepped:Connect(Update)

script.OnDestroyed:Connect(function()
	world.OnRenderStepped:Disconnect(Update)
end)


function getEndPosition(a)
	
	--angle = script.Parent.Angle.Value
	---print(angle)
	--vec = oriVec[i]
	--print(vec)
	--向量绕Y轴旋转
	if a ~= 0 then
		newVec = oriVec:Rotate(Vector3(0,1,0),a)
	else
		newVec = oriVec
	end
	
	
	--newVec = oriVec[i]:Rotate(Vector3(0,1,0),angle)

	End = newVec +  Camera.Position
	
	return End
	
end
function setNpc(P)
	
	for _,v in pairs(NPC) do
		v.NPCState.Value = 2
		v.GoPoint.Value = P
		--print("2")
	end

end

local i = 0
local flag = 1
while(true)
do 

	--print(script.Parent.Value)
	angle = i	
	--print(i)
		if i == 0 then
			flag = 1 
		end
		
		if i == 120 then
			flag = -1 
		end
		
	--角度变化速度
	wait(0.1)
	i = i + flag
end
--[[
while wait()
do
	 if inSight == true then
		NPC.NPCState.Value = 2
		NPC.GoPoint.Value = pos
		print("1")
	 end
	 
end
]]
