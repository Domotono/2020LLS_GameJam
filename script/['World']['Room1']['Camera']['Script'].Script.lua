--print("Hello world!")
local Light = script.Parent.Camera2
local Start = Light.Position 
print(Start)

local End = Light.Position 
			+ Vector3.Forward*5
			- Vector3.Up*5  -- 这个是射线终点和摄像头的Y轴上的相对位置（5）

local RED = Color(255,0,0,255)
local BLUE = Color(0,0,255,255)

local res
local oriVec = End - Start
local newVec
local angle

function Update()
	res = Physics:Raycast(Start , getEndPosition() , true)
	if res:HasHit() and res:GetHitObj() == localPlayer then
		redLight()
	else
		blueLight()
	end
end

world.OnRenderStepped:Connect(Update)

script.OnDestroyed:Connect(function()
	world.OnRenderStepped:Disconnect(Update)
end)


function getEndPosition()
	
	angle = script.Parent.Angle.Value
	print(angle)
	
	if angle == 0 then
		return End
	end
	
	newVec = oriVec:Rotate(Vector3(0,1,0),angle)

	End = newVec + Start
	
	return End
	
end

function redLight()

		Light.Color = RED
		
end

function blueLight()

		Light.Color = BLUE

end
