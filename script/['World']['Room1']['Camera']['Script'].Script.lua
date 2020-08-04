print("Monitor is working")

local cameraArr = { script.Parent.Camera1,
					script.Parent.Camera2,
					script.Parent.Camera3,
					script.Parent.Camera4 }
					
--Camera1234的检测射线起点（相机位置为起点）
local Start = { cameraArr[0].Position,
				cameraArr[1].Position,
				cameraArr[2].Position,
				cameraArr[3].Position } 

print(unpack(Start))

--local RED = Color(255,0,0,255)
--local BLUE = Color(0,0,255,255)

--Y轴是 射线终点的在Y轴（竖直方向）的相对偏移量
--另外一个非零数值是标识检测射线的长度
local oriVec = {Vector3(5,-5,0), 
				Vector3(0,-5,5),
				Vector3(5,-5,0),
				Vector3(5,-5,0)}
				
local res1,res2,res3,res4
local newVec
local angle

function Update()

	--构造射线
	res1 = Physics:Raycast(Start[0] , getEndPosition(0) , true)
	res2 = Physics:Raycast(Start[1] , getEndPosition(1) , true)
	res3 = Physics:Raycast(Start[2] , getEndPosition(2) , true)
	res4 = Physics:Raycast(Start[3] , getEndPosition(3) , true)
	
	--条件判断
	if ( res1:HasHit() and res1:GetHitObj() == localPlayer ) or
	   ( res2:HasHit() and res2:GetHitObj() == localPlayer ) or
	   ( res3:HasHit() and res3:GetHitObj() == localPlayer ) or
	   ( res4:HasHit() and res4:GetHitObj() == localPlayer ) or
	then
		
		redLight()
		
	end
		
end

--world.OnRenderStepped:Connect(Update)

script.OnDestroyed:Connect(function()
	world.OnRenderStepped:Disconnect(Update)
end)


function getEndPosition(i)
	
	angle = script.Parent.Angle.Value
	--print(angle)
	
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

		--Light.Color = RED
		script.Parent.Parent.IsOnAlet.Value = true
		
end


