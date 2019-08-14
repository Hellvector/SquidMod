--[[
	SquidMod2
	Author: SAM (recoded by Ganders) - (Grafic Patch by Imithat)
	Edited for testing by NewbieC4
	Version: 3.0
]]

local SquidMod = CreateFrame("Frame")

local textures = {
	"hide",
	"griffon",
	"lion",
	"murloc",
	"squid",
}

SquidModDB = 2

function SquidMod.SlashCommand(msg)
	local self = SquidMod
	if strlen(msg) > 0 then
		local command = string.lower(msg)
		local help = true
		if ( type(command) == "string" ) then
			for i,v in ipairs(textures) do
				if ( command == string.lower(v) ) then
					self:Update(i)
					DEFAULT_CHAT_FRAME:AddMessage("SquidMod: "..string.lower(v))
					help = false
				end
			end
		elseif ( type(command) == "number" ) then
			if textures[command] ~= nil then
				self:Update(command)
				DEFAULT_CHAT_FRAME:AddMessage("SquidMod: "..string.lower(textures[command]))
				help = false
			end
		end

		if ( help == true ) then
			for i,v in ipairs(textures) do
				DEFAULT_CHAT_FRAME:AddMessage("SquidMod: /squid "..v)
			end
		end
	else
		for i,v in ipairs(textures) do
			DEFAULT_CHAT_FRAME:AddMessage("SquidMod: /squid "..v)
		end
	end
end


function SquidMod:Update(toggle)
	if ( toggle == 1 ) then
		MainMenuBarArtFrame.LeftEndCap:Hide()
		MainMenuBarArtFrame.RightEndCap:Hide()
--[[	elseif ( toggle == 29 ) then
		MainMenuBarArtFrame.LeftEndCap:SetTexture("Interface\\AddOns\\SquidMod\\skin\\emblemLeft.tga")
		MainMenuBarArtFrame.RightEndCap:SetTexture("Interface\\AddOns\\SquidMod\\skin\\emblemRight.tga")
		MainMenuBarArtFrame.LeftEndCap:Show()
		MainMenuBarArtFrame.RightEndCap:Show()
		]]
	else
		MainMenuBarArtFrame.LeftEndCap:SetTexture("Interface\\AddOns\\SquidMod\\skin\\"..textures[toggle]..".tga")
		MainMenuBarArtFrame.RightEndCap:SetTexture("Interface\\AddOns\\SquidMod\\skin\\"..textures[toggle]..".tga")
		MainMenuBarArtFrame.LeftEndCap:SetSize(128, 128)
		MainMenuBarArtFrame.RightEndCap:SetSize(128, 128)
		MainMenuBarArtFrame.LeftEndCap:Show()
		MainMenuBarArtFrame.RightEndCap:Show()
	end
	SquidModDB = toggle
end

SquidMod:SetScript("OnEvent", function() SquidMod:Update(SquidModDB) end)
SquidMod:RegisterEvent("PLAYER_LOGIN")

SLASH_SQUID1 = "/squid"
SlashCmdList["SQUID"] = SquidMod.SlashCommand
