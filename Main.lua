SLASH_CORRUPTEDWANNABE1, SLASH_CORRUPTEDWANNABE2 = '/corruptedwannabe', '/cwb';

function SlashCmdList.CORRUPTEDWANNABE(msg, editbox)
    local command, rest = msg:match("^(%S*)%s*(.-)$");
end

local frame = CreateFrame("FRAME");
frame:RegisterEvent("ADDON_LOADED");
frame:RegisterEvent("PLAYER_LOGOUT");

function frame:OnEvent(event, arg1)
    if (event == "ADDON_LOADED" and arg1 == "CorruptedWannabe") then
        -- Our saved variables are ready at this point. If there are none, both variables will set to nil.
        if CorruptedWannabeSettings == nil then
            HaveWeMetCount = 0; -- This is the first time this addon is loaded; initialize the count to 0.
            CorruptedWannabeSettings = {
                showWhispers = true,
                soundProbabilityPercent = 10,
                nextSound = 1,
            };
        end

        local Combat_EventFrame = CreateFrame("Frame");
        Combat_EventFrame:RegisterEvent("PLAYER_REGEN_DISABLED");
        Combat_EventFrame:SetScript("OnEvent", CorruptedWannabe.SoundService.playNextSound);
    end
end

frame:SetScript("OnEvent", frame.OnEvent);