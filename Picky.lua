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

-- Profession Information
local Herbalism = {
	nodes = {
		["Peacebloom"] = {
			skill = {
				orange = 1,
				yellow = 25,
				green  = 50,
				gray   = 100
			}
		},
		["Silverleaf"] = {
			skill = {
				orange = 1,
				yellow = 25,
				green  = 50,
				gray   = 100
			}
		},
		["Earthroot"] = {
			skill = {
				orange = 15,
				yellow = 40,
				green  = 65,
				gray   = 115
			}
		},
		["Mageroyal"] = {
			skill = {
				orange = 50,
				yellow = 75,
				green  = 100,
				gray   = 150
			}
		},
		["Briarthorn"] = {
			skill = {
				orange = 70,
				yellow = 95,
				green  = 120,
				gray   = 170
			}
		},
		["Stranglekelp"] = {
			skill = {
				orange = 85,
				yellow = 110,
				green  = 135,
				gray   = 185
			}
		},
		["Bruiseweed"] = {
			skill = {
				orange = 100,
				yellow = 125,
				green  = 150,
				gray   = 200
			}
		},
		["Wild Steelbloom"] = {
			skill = {
				orange = 115,
				yellow = 140,
				green  = 165,
				gray   = 215
			}
		},
		["Grave Moss"] = {
			skill = {
				orange = 120,
				yellow = 150,
				green  = 170,
				gray   = 220
			}
		},
		["Kingsblood"] = {
			skill = {
				orange = 125,
				yellow = 155,
				green  = 175,
				gray   = 225
			}
		},
		["Liferoot"] = {
			skill = {
				orange = 150,
				yellow = 175,
				green  = 200,
				gray   = 250
			}
		},
		["Fadeleaf"] = {
			skill = {
				orange = 160,
				yellow = 185,
				green  = 210,
				gray   = 260
			}
		},
		["Goldthorn"] = {
			skill = {
				orange = 160,
				yellow = 185,
				green  = 210,
				gray   = 260
			}
		},
		["Khadgar's Whisker"] = {
			skill = {
				orange = 185,
				yellow = 210,
				green  = 235,
				gray   = 285
			}
		},
		["Wintersbite"] = {
			skill = {
				orange = 195,
				yellow = 225,
				green  = 245,
				gray   = 295
			}
		},
		["Firebloom"] = {
			skill = {
				orange = 205,
				yellow = 235,
				green  = 255,
				gray   = 305
			}
		},
		["Purple Lotus"] = {
			skill = {
				orange = 210,
				yellow = 235,
				green  = 260,
				gray   = 310
			}
		},
		["Arthas' Tears"] = {
			skill = {
				orange = 220,
				yellow = 250,
				green  = 270,
				gray   = 320
			}
		},
		["Sungrass"] = {
			skill = {
				orange = 230,
				yellow = 255,
				green  = 280,
				gray   = 330
			}
		},
		["Blindweed"] = {
			skill = {
				orange = 235,
				yellow = 260,
				green  = 285,
				gray   = 335
			}
		},
		["Ghost Mushroom"] = {
			skill = {
				orange = 245,
				yellow = 270,
				green  = 295,
				gray   = 345
			}
		},
		["Gromsblood"] = {
			skill = {
				orange = 250,
				yellow = 275,
				green  = 300,
				gray   = 350
			}
		},
		["Golden Sansam"] = {
			skill = {
				orange = 260,
				yellow = 280,
				green  = 310,
				gray   = 360
			}
		},
		["Dreamfoil"] = {
			skill = {
				orange = 270,
				yellow = 295,
				green  = 320,
				gray   = 370
			}
		},
		["Mountain Silversage"] = {
			skill = {
				orange = 280,
				yellow = 305,
				green  = 330,
				gray   = 380
			}
		},
		["Plaguebloom"] = {
			skill = {
				orange = 285,
				yellow = 310,
				green  = 335,
				gray   = 385
			}
		},
		["Icecap"] = {
			skill = {
				orange = 290,
				yellow = 315,
				green  = 340,
				gray   = 390
			}
		},
		["Black Lotus"] = {
			skill = {
				orange = 300,
				yellow = 345,
				green  = 375,
				gray   = 400
			}
		}
	}
}

local Mining = {
	nodes = {
		["Copper Vein"] = {
			skill = {
				orange = 1,
				yellow = 25,
				green  = 50,
				gray   = 100
			}
		},
		["Tin Vein"] = {
			skill = {
				orange = 65,
				yellow = 90,
				green  = 115,
				gray   = 165
			}
		},
		["Silver Vein"] = {
			skill = {
				orange = 75,
				yellow = 100,
				green  = 125,
				gray   = 175
			}
		},
		["Iron Deposit"] = {
			skill = {
				orange = 125,
				yellow = 150,
				green  = 175,
				gray   = 225
			}
		},
		["Gold Vein"] = {
			skill = {
				orange = 155,
				yellow = 180,
				green  = 205,
				gray   = 255
			}
		},
		["Mithril Deposit"] = {
			skill = {
				orange = 175,
				yellow = 200,
				green  = 225,
				gray   = 275
			}
		},
		["Truesilver Deposit"] = {
			skill = {
				orange = 230,
				yellow = 255,
				green  = 280,
				gray   = 330
			}
		},
		["Ooze Covered Truesilver Deposit"] = {
			skill = {
				orange = 230,
				yellow = 255,
				green  = 280,
				gray   = 330
			}
		},
		["Dark Iron Deposit"] = {
			skill = {
				orange = 230,
				yellow = 255,
				green  = 280,
				gray   = 330
			}
		},
		["Small Thorium Vein"] = {
			skill = {
				orange = 245,
				yellow = 270,
				green  = 295,
				gray   = 345
			}
		},
		["Ooze Covered Thorium Vein"] = {
			skill = {
				orange = 245,
				yellow = 270,
				green  = 295,
				gray   = 345
			}
		},
		["Rich Thorium Vein"] = {
			skill = {
				orange = 275,
				yellow = 300,
				green  = 325,
				gray   = 375
			}
		},
		["Ooze Covered Rich Thorium Vein"] = {
			skill = {
				orange = 275,
				yellow = 300,
				green  = 325,
				gray   = 375
			}
		},
		["Hakkari Thorium Vein"] = {
			skill = {
				orange = 275,
				yellow = 300,
				green  = 325,
				gray   = 375
			}
		},
		["Small Obsidian Chunk"] = {
			skill = {
				orange = 305,
				yellow = 330,
				green  = 355,
				gray   = 405
			}
		},
		["Large Obsidian Chunk"] = {
			skill = {
				orange = 305,
				yellow = 330,
				green  = 355,
				gray   = 405
			}
		}
	}
}



-- TODO 
-- 0 why does the remouse on tooltip lose the added text. There is some time where the tooltip lingers, does it have the added text then violate the if conditionals on remouse?
-- 1 handle the case with 2 nodes shown on the minimap in a single tool tip
-- 2 minimalist mode, only show 'NOPE!' added to mini map tooltips when you cannot pick a node (means settings menu)
-- 3 add skinning?
-- 4 additional checks to ensure we don't add to unintended tooltips?

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

local function SetSkillColor(playerSkill, nodeData)
	-- Determine the color based on skill comparison with Node
	local color
	if playerSkill < nodeData.skill["orange"] then
		print(":yikrtd")
		color = "|cffff0000"  -- Red (Cannot gather)
	elseif playerSkill <= nodeData.skill["yellow"] then
		color = "|cffff8000"  -- Orange (Guaranteed skill-up)
	elseif playerSkill <= nodeData.skill["green"] then
		color = "|cffffff00"  -- Yellow (High chance of skill-up)
	elseif playerSkill <= nodeData.skill["gray"] then
		color = "|cff1eff00"  -- Green (Low chance of skill-up)
	else
		color = "|cff808080"  -- Gray (No skill-up)
	end
	return color
end

local function ModifyTooltip()
	local tooltipText = _G["GameTooltipTextLeft1"] and _G["GameTooltipTextLeft1"]:GetText()
	local requiredSkill
	local playerSkill
	local color

	-- Determine if the tooltip is for an herb or mining node
	if Mining.nodes[tooltipText] then
		requiredSkill = Mining.nodes[tooltipText].skill["orange"]
		playerSkill = GetProfessionSkillLevel("Mining")
		color = SetSkillColor(playerSkill, Mining.nodes[tooltipText])

	elseif Herbalism.nodes[tooltipText] then
		requiredSkill = Herbalism.nodes[tooltipText].skill["orange"]
		playerSkill = GetProfessionSkillLevel("Herbalism")
		color = SetSkillColor(playerSkill, Herbalism.nodes[tooltipText])

	end

	if color then
		-- light grey used for the player skill text
		local greyColor = "|cffc0c0c0"  -- Light Grey

		-- Add tooltip line with the colored skill reqs
		GameTooltip:AddLine("".. color  .. requiredSkill .. greyColor .." (" .. playerSkill .. ")|r")
		GameTooltip:Show()  -- Refresh tooltip display
	end
end

-- Hook to tooltip update events
GameTooltip:HookScript("OnTooltipSetUnit", ModifyTooltip)
GameTooltip:HookScript("OnShow", ModifyTooltip)

-- Debug Print
print("Picky addon loaded successfully!")
