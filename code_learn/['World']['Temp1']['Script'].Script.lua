script.Parent.OnChildAdded:Connect(function(obj)
	wait(1)
	obj:Destroy()
end)
--销毁射出的子弹