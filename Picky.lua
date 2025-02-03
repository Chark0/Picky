------------------------------------------------
--                   Picky                    --
--                                            --
-- Simple gathering tooltip enhancement that  --
-- displays the level required to harvest.    --
--                                            --
-- Please do not modify or otherwise          --
-- redistribute this without the consent of   --
-- the Picky Team. Thank you.                 --
------------------------------------------------

------------------------------------------------
-- Picky.lua (Main File)

-- Mining skill level requirements
local MiningNodes = {
		["Copper Vein"] = 1,
		["Tin Vein"] = 65,
		["Silver Vein"] = 75,
		["Iron Deposit"] = 125,
		["Gold Vein"] = 155,
		["Mithril Deposit"] = 175,
		["Truesilver Deposit"] = 230,
		["Small Thorium Vein"] = 250,
		["Rich Thorium Vein"] = 275,
		["Ooze Covered Thorium Vein"] = 245
	}

-- Herbalism skill level requirements
local HerbNodes = {
		["Peacebloom"] = 1,
		["Silverleaf"] = 1,
		["Earthroot"] = 15,
		["Mageroyal"] = 50,
		["Briarthorn"] = 70,
		["Stranglekelp"] = 85,
		["Bruiseweed"] = 100,
		["Wild Steelbloom"] = 115,
		["Grave Moss"] = 120,
		["Kingsblood"] = 125,
		["Liferoot"] = 150,
		["Fadeleaf"] = 160,
		["Goldthorn"] = 170,
		["Khadgar's Whisker"] = 185,
		["Wintersbite"] = 195,
		["Firebloom"] = 205,
		["Purple Lotus"] = 210,
		["Wildvine"] = 210,
		["Sungrass"] = 230,
		["Blindweed"] = 235,
		["Ghost Mushroom"] = 245,
		["Gromsblood"] = 250,
		["Golden Sansam"] = 260,
		["Dreamfoil"] = 270,
		["Mountain Silversage"] = 280,
		["Plaguebloom"] = 285,
		["Icecap"] = 290,
		["Black Lotus"] = 300
	}


-- Add check to make sure this isn't a unit,item or spell.
-- since we determined the nodes didnt react to these checks.

-- TODO 
-- 0 why does the remouse on tooltip lose the added text. There is some time where the tooltip lingers, does it have the added text then violate the if conditionals on remouse?
-- 1 handle the case with 2 nodes shown on the minimap in a single tool tip
-- 2 for default nodes, peacebloom, silverleaf, copper
-- the values added for skill up range need -1 since we start at skill 1 not 0
-- 3 minimalist mode, only show 'NOPE!' added to mini map tooltips when you cannot pick a node (means settings menu)
-- 4 onaddon load check the professions to determing which are valid? what are odds someone picks up a profession and we miss it?
-- 6 add skinning?

local function GetProfessionSkillLevel(professionName)
    -- Loop through both primary profession slots
    for i = 1, GetNumSkillLines() do
        local skillName, _, _, skillLevel = GetSkillLineInfo(i)
        if skillName == professionName then
            return skillLevel
        end
    end
    return 0  -- Return 0 if the profession is not found
end

local function SetSkillColor(playerSkill, requiredSkill)
	-- Determine the color based on skill comparison
	local color
	if playerSkill < requiredSkill then
		color = "|cffff0000"  -- Red (Cannot gather)
	elseif playerSkill < requiredSkill + 25 then
		color = "|cffff8000"  -- Orange (Guaranteed skill-up)
	elseif playerSkill < requiredSkill + 50 then
		color = "|cffffff00"  -- Yellow (High chance of skill-up)
	elseif playerSkill < requiredSkill + 100 then
		color = "|cff1eff00"  -- Green (Low chance of skill-up)
	else
		color = "|cff808080"  -- Grey (No skill-up)
	end
	return color
end

local function ModifyTooltip()
    local tooltipText = _G["GameTooltipTextLeft1"] and _G["GameTooltipTextLeft1"]:GetText()
    local requiredSkill
	local playerSkill 

	-- Determine if the tooltip is for an herb or mining node
    if MiningNodes[tooltipText] then
        requiredSkill = MiningNodes[tooltipText]
        playerSkill = GetProfessionSkillLevel("Mining")
	
	elseif HerbNodes[tooltipText] then
        requiredSkill = HerbNodes[tooltipText]
        playerSkill = GetHerbSkillLevel("Herbalism")

    end

	if requiredSkill then
		-- determine color of the required skill level
		local color = SetSkillColor(playerSkill, requiredSkill)
		-- light grey used for the player skill text
		local greyColor = "|cffc0c0c0"  -- Light Grey

		-- Add tooltip line with the colored skill reqs
		GameTooltip:AddLine("".. color  .. requiredSkill .. greyColor .." (" .. playerSkill .. ")|r")
		GameTooltip:Show()  -- Refresh tooltip display
	end
end

-- Hook to tooltip update events
-- GameTooltip:HookScript("OnTooltipSetUnit", ModifyTooltip)
GameTooltip:HookScript("OnShow", ModifyTooltip)

-- Debug Print
print("Picky addon loaded successfully!")
