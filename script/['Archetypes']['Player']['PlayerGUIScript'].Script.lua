-- 获取本地玩家
local player = localPlayer

-- 姓名板
local nameGUI = player.NameGUI
nameGUI.NameBar.Text = player.Name
nameGUI.LocalPosition = Vector3(0, player.Avatar.Height + 1.1, 0)
local team = player:GetClosestTeam()
if team and team.ClassName == 'Team' then
	nameGUI.NameBar.Color = team.TeamColor
end

-- 血条
local healthGUI = player.HealthGUI
local background = healthGUI.Background
local healthBar = background.HealthBar
local RED_BAR = ResourceManager.GetTexture("Internal/Blood_Red")
local GREEN_BAR = ResourceManager.GetTexture("Internal/Blood_Green")
local ORANGE_BAR = ResourceManager.GetTexture("Internal/Blood_Orange")

-- 姓名板的显示逻辑
function NameBarLogic()
	nameGUI:SetActive(player.DisplayName)
end
player.OnDisplayNameChanged:Connect(NameBarLogic)

-- 血条随生命值颜色改变而改变
function healthChange(oldHealth, newHealth)
	local percent = player.Health / player.MaxHealth
	if player.HealthDisplayMode == Enum.HealthDisplayMode.OnHit then
		healthGUI:SetActive(percent < 1)
	end
	if percent >= 0.7 then
		healthBar.Texture = GREEN_BAR
	elseif percent >= 0.3 then
		healthBar.Texture = ORANGE_BAR
	else
		healthBar.Texture = RED_BAR
	end	
	healthBar.AnchorsX = Vector2(0.05, 0.9 * percent + 0.05)
end
player.OnHealthChange:Connect(healthChange)
player.OnMaxHealthChanged:Connect(healthChange)

-- 血条在各显示模式下的显示逻辑
function HealthBarLogic()
	if player.HealthDisplayMode == Enum.HealthDisplayMode.Always then
		healthGUI:SetActive(true)
	elseif player.HealthDisplayMode == Enum.HealthDisplayMode.Never then
		healthGUI:SetActive(false)
	elseif player.HealthDisplayMode == Enum.HealthDisplayMode.OnHit then
		healthGUI:SetActive(player.Health ~= player.MaxHealth)
	end
end
player.OnHealthDisplayModeChanged:Connect(HealthBarLogic)

--初始化姓名板和血条的显示
NameBarLogic()
HealthBarLogic()