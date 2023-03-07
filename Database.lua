Database = {
  Version = "V2.00",
  Alerts = "[+] Revamp ",
  Discord = "wPQHasG3nX",
  Status = "",
  Website = "https://9kdestroyer.xyz", -- Indevelopement
  Blacklist = {},
 
}





function BlacklistUser(UserId)
table.insert(Database.Blacklist, UserId)
end
--[[
Exampe:
BlacklistUser(12345) -- Killing me
]]
if table.find(Database.Blacklist, game:GetService("Players").LocalPlayer.UserId) then
    game:GetService("Players").LocalPlayer:Kick("Agent | You are Blacklisted")
end


return Database
