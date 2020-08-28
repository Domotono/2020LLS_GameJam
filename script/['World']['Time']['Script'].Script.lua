while world.ScreenGUI.preview.ActiveSelf == true
do
	wait(1)
end
--时钟模块
t1= 0			
t2= 0
t3= 0
t4= 0
local t1_zero = localPlayer.Local.ScreenGUI.clock.clockk.first.zero
local t1_1 = localPlayer.Local.ScreenGUI.clock.clockk.first.a
local t1_2 = localPlayer.Local.ScreenGUI.clock.clockk.first.b
local t1_3 = localPlayer.Local.ScreenGUI.clock.clockk.first.c
local t1_4 = localPlayer.Local.ScreenGUI.clock.clockk.first.d
local t1_5 = localPlayer.Local.ScreenGUI.clock.clockk.first.e
local t1_6 = localPlayer.Local.ScreenGUI.clock.clockk.first.f
local t1_7 = localPlayer.Local.ScreenGUI.clock.clockk.first.g
local t1_8 = localPlayer.Local.ScreenGUI.clock.clockk.first.h
local t1_9 = localPlayer.Local.ScreenGUI.clock.clockk.first.i

local t2_zero = localPlayer.Local.ScreenGUI.clock.clockk.second.zero
local t2_1 = localPlayer.Local.ScreenGUI.clock.clockk.second.a
local t2_2 = localPlayer.Local.ScreenGUI.clock.clockk.second.b
local t2_3 = localPlayer.Local.ScreenGUI.clock.clockk.second.c
local t2_4 = localPlayer.Local.ScreenGUI.clock.clockk.second.d
local t2_5 = localPlayer.Local.ScreenGUI.clock.clockk.second.e
local t2_6 = localPlayer.Local.ScreenGUI.clock.clockk.second.f

local t3_zero = localPlayer.Local.ScreenGUI.clock.clockk.third.zero
local t3_1 = localPlayer.Local.ScreenGUI.clock.clockk.third.a
local t3_2 = localPlayer.Local.ScreenGUI.clock.clockk.third.b
local t3_3 = localPlayer.Local.ScreenGUI.clock.clockk.third.c
local t3_4 = localPlayer.Local.ScreenGUI.clock.clockk.third.d
local t3_5 = localPlayer.Local.ScreenGUI.clock.clockk.third.e
local t3_6 = localPlayer.Local.ScreenGUI.clock.clockk.third.f
local t3_7 = localPlayer.Local.ScreenGUI.clock.clockk.third.g
local t3_8 = localPlayer.Local.ScreenGUI.clock.clockk.third.h
local t3_9 = localPlayer.Local.ScreenGUI.clock.clockk.third.i

local t4_zero = localPlayer.Local.ScreenGUI.clock.clockk.forth.zero
local t4_1 = localPlayer.Local.ScreenGUI.clock.clockk.forth.a
local t4_2 = localPlayer.Local.ScreenGUI.clock.clockk.forth.b
local t4_3 = localPlayer.Local.ScreenGUI.clock.clockk.forth.c
local t4_4 = localPlayer.Local.ScreenGUI.clock.clockk.forth.d
local t4_5 = localPlayer.Local.ScreenGUI.clock.clockk.forth.e
local t4_6 = localPlayer.Local.ScreenGUI.clock.clockk.forth.f
local t4_7 = localPlayer.Local.ScreenGUI.clock.clockk.forth.g
local t4_8 = localPlayer.Local.ScreenGUI.clock.clockk.forth.h
local t4_9 = localPlayer.Local.ScreenGUI.clock.clockk.forth.i
--t1_5:SetActive(true)


local switch1 = {
    [0] = function()    
		t1_9:SetActive(false)
        t1_zero:SetActive(true)
    end,
    [1] = function()
		t1_zero:SetActive(false)
        t1_1:SetActive(true)
    end,
    [2] = function()    
		t1_1:SetActive(false)
        t1_2:SetActive(true)
    end,
    [3] = function()   
		t1_2:SetActive(false)
        t1_3:SetActive(true)
    end,
	[4] = function()   
		t1_3:SetActive(false)
        t1_4:SetActive(true)
    end,
    [5] = function()   
		t1_4:SetActive(false)
        t1_5:SetActive(true)
    end,
    [6] = function()   
		t1_5:SetActive(false)
        t1_6:SetActive(true)
    end,
	[7] = function()  
		t1_6:SetActive(false)
        t1_7:SetActive(true)
    end,
    [8] = function()  
		t1_7:SetActive(false)
        t1_8:SetActive(true)
    end,
    [9] = function()   
		t1_8:SetActive(false)
        t1_9:SetActive(true)
    end
}

local switch2 = {
    [0] = function()    
		t2_5:SetActive(false)
        t2_zero:SetActive(true)
    end,
    [1] = function()
		t2_zero:SetActive(false)
        t2_1:SetActive(true)
    end,
    [2] = function()    
		t2_1:SetActive(false)
        t2_2:SetActive(true)
    end,
    [3] = function()   
		t2_2:SetActive(false)
        t2_3:SetActive(true)
    end,
	[4] = function()   
		t2_3:SetActive(false)
        t2_4:SetActive(true)
    end,
    [5] = function()   
		t2_4:SetActive(false)
        t2_5:SetActive(true)
    end
}
local switch3 = {
    [0] = function()    
		t3_9:SetActive(false)
        t3_zero:SetActive(true)
    end,
    [1] = function()
		t3_zero:SetActive(false)
        t3_1:SetActive(true)
    end,
    [2] = function()    
		t3_1:SetActive(false)
        t3_2:SetActive(true)
    end,
    [3] = function()   
		t3_2:SetActive(false)
        t3_3:SetActive(true)
    end,
	[4] = function()   
		t3_3:SetActive(false)
        t3_4:SetActive(true)
    end,
    [5] = function()   
		t3_4:SetActive(false)
        t3_5:SetActive(true)
    end,
    [6] = function()   
		t3_5:SetActive(false)
        t3_6:SetActive(true)
    end,
	[7] = function()  
		t3_6:SetActive(false)
        t3_7:SetActive(true)
    end,
    [8] = function()  
		t3_7:SetActive(false)
        t3_8:SetActive(true)
    end,
    [9] = function()   
		t3_8:SetActive(false)
        t3_9:SetActive(true)
    end
}

local switch4 = {
    [0] = function()    
		t4_5:SetActive(false)
        t4_zero:SetActive(true)
    end,
    [1] = function()
		t4_zero:SetActive(false)
        t4_1:SetActive(true)
    end,
    [2] = function()    
		t4_1:SetActive(false)
        t4_2:SetActive(true)
    end,
    [3] = function()   
		t4_2:SetActive(false)
        t4_3:SetActive(true)
    end,
	[4] = function()   
		t4_3:SetActive(false)
        t4_4:SetActive(true)
    end,
    [5] = function()   
		t4_4:SetActive(false)
        t4_5:SetActive(true)
    end
}


function timechange()
	if t1 == 10 then
		t1 = 0
		t2 = t2 + 1
		if t2==6 then
			t2=0
			t3=t3+1
			if t3 == 10
				then t3 = 0
				t4 = t4 + 1
				if t4 == 6 then
					Game:Quit()
				end	
			end
		end
	end
end
function timedisplay()
local f1 = switch1[t1]
if(f1) then
    f1()
else                -- for case default
    print "Case default."
end	
local f2 = switch2[t2]
if(f2) then
    f2()
else                -- for case default
    print "Case default."
end	
local f3 = switch3[t3]
if(f3) then
    f3()
else                -- for case default
    print "Case default."
end	
local f4 = switch4[t4]
if(f4) then
    f4()
else                -- for case default
    print "Case default."
end	
	
end

while true do 
	world.Time.minute.Value = t3+t4*10 
	timedisplay()
	t1 = t1 + 1
	timechange()					 
	wait(1)
	
end