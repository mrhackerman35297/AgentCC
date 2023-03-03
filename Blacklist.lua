repeat wait() until game:IsLoaded()
BlackList = {
  2596885924,
}

if table.find(BlackList, game:GetService("Players").LocalPlayer.UserId) then
    game:GetService("Players").LocalPlayer:Kick("Agent | You are Blacklisted")
end
