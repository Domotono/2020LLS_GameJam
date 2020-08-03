--print("Hello world!")
local i = 0

while(true)
do 

	--print(script.Parent.Value)
	script.Parent.Value = i	
		if i == 180 then
			i = 0 
		end
		
	--角度变化速度
	wait(0.1)
	i = i + 1
end

