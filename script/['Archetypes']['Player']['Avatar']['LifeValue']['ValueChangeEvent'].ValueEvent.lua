--值对象改变事件. 父类为值对象，当值数据改变时会触发
--第一参数(OldValue): 旧值
--第二参数(NewValue): 新值
local t1_zero = localPlayer.Local.ScreenGUI.leftdown.lifevalue.zero
local t1_1 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.a
local t1_2 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.b
local t1_3 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.c
local t1_4 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.d
local t1_5 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.e
local t1_6 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.f
local t1_7 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.g
local t1_8 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.h
local t1_9 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.i

local t10_zero = localPlayer.Local.ScreenGUI.leftdown.lifevalue.zero1
local t10_1 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.a1
local t10_2 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.b1
local t10_3 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.c1
local t10_4 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.d1
local t10_5 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.e1
local t10_6 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.f1
local t10_7 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.g1
local t10_8 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.h1
local t10_9 = localPlayer.Local.ScreenGUI.leftdown.lifevalue.i1
a = NewValue
t10,t11 = math.modf(a/10)
print(t10)
a = a -(t10 * 10)
t1,t2 = math.modf(a/1)
print(t1)
local switch1 = {
    [0] = function()    
		t1_1:SetActive(false)
        t1_zero:SetActive(true)
		t1_9:SetActive(false)
    end,
    [1] = function()
		t1_zero:SetActive(false)
		t1_2:SetActive(false)
        t1_1:SetActive(true)
    end,
    [2] = function()    
		t1_1:SetActive(false)
        t1_2:SetActive(true)
		t1_3:SetActive(false)
    end,
    [3] = function()   
		t1_2:SetActive(false)
        t1_3:SetActive(true)
		t1_4:SetActive(false)
    end,
	[4] = function()   
		t1_3:SetActive(false)
        t1_4:SetActive(true)
		t1_5:SetActive(false)
    end,
    [5] = function()   
		t1_4:SetActive(false)
        t1_5:SetActive(true)
		t1_6:SetActive(false)
    end,
    [6] = function()   
		t1_5:SetActive(false)
        t1_6:SetActive(true)
		t1_7:SetActive(false)
    end,
	[7] = function()  
		t1_6:SetActive(false)
        t1_7:SetActive(true)
		t1_8:SetActive(false)
    end,
    [8] = function()  
		t1_7:SetActive(false)
        t1_8:SetActive(true)
		t1_9:SetActive(false)
    end,
    [9] = function()   
		t1_8:SetActive(false)
        t1_9:SetActive(true)
		t1_zero:SetActive(false)
    end
}

local switch10 = {
    [0] = function()    
		t10_1:SetActive(false)
        t10_zero:SetActive(true)
		t10_9:SetActive(false)
    end,
    [1] = function()
		t10_zero:SetActive(false)
		t10_2:SetActive(false)
        t10_1:SetActive(true)
    end,
    [2] = function()    
		t10_1:SetActive(false)
        t10_2:SetActive(true)
		t10_3:SetActive(false)
    end,
    [3] = function()   
		t10_2:SetActive(false)
        t10_3:SetActive(true)
		t10_4:SetActive(false)
    end,
	[4] = function()   
		t10_3:SetActive(false)
        t10_4:SetActive(true)
		t10_5:SetActive(false)
    end,
    [5] = function()   
		t10_4:SetActive(false)
        t10_5:SetActive(true)
		t10_6:SetActive(false)
    end,
    [6] = function()   
		t10_5:SetActive(false)
        t10_6:SetActive(true)
		t10_7:SetActive(false)
    end,
	[7] = function()  
		t10_6:SetActive(false)
        t10_7:SetActive(true)
		t10_8:SetActive(false)
    end,
    [8] = function()  
		t10_7:SetActive(false)
        t10_8:SetActive(true)
		t10_9:SetActive(false)
    end,
    [9] = function()   
		t10_8:SetActive(false)
        t10_9:SetActive(true)
		t10_zero:SetActive(false)
    end
}

local f1 = switch1[t1]
if(f1) then
    f1()
else                -- for case default
    print "你tm开挂了吧！"
end	


local f10 = switch10[t10]
if(f10) then
    f10()
else                -- for case default
    print "你tm开挂了吧！"
end	
