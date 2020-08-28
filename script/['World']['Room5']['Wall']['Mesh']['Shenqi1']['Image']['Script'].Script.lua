local obj = script.Parent
if obj.ActiveSelf == true then
 a = 0
 while a < 5
 do
  wait(0.01)
  obj.Size = obj.Size*1.65
  obj.Figure.Size = obj.Figure.Size*1.65
  --obj.Text1.FontSize = obj.Text1.FontSize+2a
  --obj.Text2.FontSize = obj.Text2.FontSize+2a
  a= a+1
 end
 obj.Text1:SetActive(true)
 obj.Text2:SetActive(true)
 a = 0
 while a < 3
 do
  wait(0.02)
  obj.Size = obj.Size/1.02
  obj.Figure.Size = obj.Figure.Size/1.02
  --obj.Text1.FontSize = obj.Text1.FontSize-1
  --obj.Text2.FontSize = obj.Text2.FontSize-1
  a= a+1
 end
 wait(5)
 obj.Text1:SetActive(false)
 obj.Text2:SetActive(false)
 a = 0
 while a < 10
 do
  wait(0.01)
  obj.Size = obj.Size/1.45
  obj.Figure.Size = obj.Figure.Size/1.45
  --obj.Text1.FontSize = obj.Text1.FontSize-9
  --obj.Text2.FontSize = obj.Text2.FontSize-9
  a= a+1
 end 
 obj:SetActive(false)
end