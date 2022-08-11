local chatXPFrame = CreateFrame("Frame", "ChatXPFrame")

chatXPFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
chatXPFrame:RegisterEvent("QUEST_TURNED_IN")
 
local function printXP()
	if (UnitLevel("player") < GetMaxPlayerLevel()) then
		local current = UnitXP("player")
		local max = UnitXPMax("player")
		local percentage = math.floor(current * 100 / max)
		print("|cFF00FFFFChatXP|r: " .. current .. " / " .. max .. " (|cFFFFFF00" .. percentage .. "%|r)")
	end
end

local function handleXP(self, event, ...)
	C_Timer.After(1, printXP)
end

chatXPFrame:SetScript("OnEvent", handleXP)

SLASH_CHATXP1 = "/cxp"
SlashCmdList["CHATXP"] = printXP
