local begin = script.Parent.start
local preview = script.Parent.preview
b = 0
Input.OnKeyDown:Connect(function()
 if b == 0 then
  print("sdaja;dja")
  b = 1
  a = 0
  while a<1
  do
   wait(0.05)
   preview.Offset=Vector2 (0,700-1445*a*a)
   a = a+0.1
  end
  begin:SetActive(false)
  a = 0
  while a>0
  do
   wait(0.2)
   preview.Offset=Vector2 (0,-750+100*a*a)
   a = a+0.1
  end
  a=0
  while a<1
  do
   wait(0.05)
   preview.Offset=Vector2 (0,-650-100*a*a)
   a = a+0.1
  end
   a = 0
  while a>0
  do
   wait(0.2)
   preview.Offset=Vector2 (0,-750+20*a*a)
   a = a+0.1
  end
  a=0
  while a<1
  do
   wait(0.05)
   preview.Offset=Vector2 (0,-730-20*a*a)
   a = a+0.1
  end
  wait(3)
  b = 2
 end
end)

Input.OnKeyDown:Connect(function()
 if begin.ActiveSelf == false and preview.ActiveSelf == true and b==2 then
  preview:SetActive(false)
 end
end)