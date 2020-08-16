local Rose = require(GarnetRose)
local Gun = require(BaseGun)
local Sword = require(BaseSword)
local Model = localPlayer.Avatar.Bone_R_Hand.Weapon
Rose:Initial(1,Model)


for i=-100,100,2 do
	for j=-100,100,2 do
		if math.random(1,10)>9 then
			world:CreateObject('Cube','Cube',world.Cubes,Vector3(i,0.3,j))
		end
	end
end
local AI = require(AIModule)
local Enemies = {}

--for i=1, do
	wait()
	local Npc = AI:Initial(Vector3(-46,0,-46),'Enemy')
	table.insert(Enemies,Npc)
--end

while true do
	for i,v in pairs(Enemies) do
		wait()
		if v.Npc.State~=Enum.CharacterState.Died then
			v:Follow(Enemies,localPlayer,1)
		end	
	end
end
