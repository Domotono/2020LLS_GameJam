local Obj = script.Parent
local Start = { script.Parent.Position} 
--local RED = Color(255,0,0,255)
--local BLUE = Color(0,0,255,255)

--Y轴是 射线终点的在Y轴（竖直方向）的相对偏移量
--另外一个非零数值是标识检测射线的长度
local oriVec = {Vector3(-10,0,0)}				
local res1
local newVec,vec
local angle = 180


function Update()
	local ray= Ray(Obj.Position, Obj.Forward)
	local End = ray:GetPoint(5.5)

	--构造射线
	res1 = Physics:Raycast(Obj.Position , End, false)
	
	--条件判断
	if ( res1:HasHit() and res1:GetHitObj() == localPlayer ) 
	then
		redLight()
	end
end

world.OnRenderStepped:Connect(Update)

script.OnDestroyed:Connect(function()
	world.OnRenderStepped:Disconnect(Update)
end)


function getEndPosition(i)

	--print(i)
	--vec = oriVec[i]
	--print(vec)
	--向量绕Y轴旋转
	if angle ~= 0 then
		newVec = oriVec[i]:Rotate(Vector3(0,1,0),angle)
	else
		newVec = oriVec[i]
	end
	
	
	--newVec = oriVec[i]:Rotate(Vector3(0,1,0),angle)

	End = newVec + Start[i]
	
	return End
	
end

function redLight()

		localPlayer.Health = 0
		
end


