--print("Hello world!")

local i = 0

local flag = 1

while(true)
do 

	--print(script.Parent.Value)
	script.Parent.Value = i	
	--print(i)
		if i == 0 then
			flag = 1 
		end
		
		if i == 180 then
			flag = -1 
		end
		
	--角度变化速度
	wait(0.1)
	i = i + flag
end

