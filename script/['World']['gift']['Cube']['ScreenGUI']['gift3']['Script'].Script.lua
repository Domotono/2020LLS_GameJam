local obj = script.Parent
if obj.ActiveSelf == true then
	a = 1.13
	while a > 1
	do
		wait(0.01)
		obj.Size = obj.Size*a
		a= a * 0.99
	end
	a = 1.04
	while a > 1
	do
		wait(0.01)
		obj.Size = obj.Size/a
		a= a * 0.99
	end
	wait(5)
	a=1.4
	while a > 1
	do
		wait(0.01)
		obj.Size = obj.Size/a
		a= a * 0.99
	end
	obj:SetActive(false)
end