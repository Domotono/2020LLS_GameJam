local Image0 = script.Parent.Image0
local Image1 = script.Parent.Image1
local Imageend = script.Parent.Imageend
a = 0
while a < 250 do
	wait(0.01)
	Image0.Color = Color(255,255,255,a)
	a = a +10
end
b = 0
C= 1
wait(30)
Image0:SetActive(false)
Imageend.Alpha = 1
--Input.OnKeyDown:Connect(function()
--	if b == 0 then
--		b=1
--		a = 0
--		while a < 0.5 do
--			wait(0.01)
--			Imageend.Alpha = a
--			a = a +0.05
--		end
--		wait(10)
--		--Game:Quit()
--	end
--end)
Input.OnKeyDown:Connect(function()
	if C== 1 then
	wait(40)
		Game:Quit()
	end
end)





