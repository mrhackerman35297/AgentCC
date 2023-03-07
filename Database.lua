Database = {
  Version = "V2.00",
  Alerts = "[+] Revamp ",
  Discord = "wPQHasG3nX",
  Status = "",
  Website = "https://9kdestroyer.xyz", -- Indevelopement
  Blacklist = {},
  Ranks = {
    Superheros = {},
    AbusePerms = {},
    Premium = {},  
  },
}



function Whitelist(Direction, id)
    table.insert(Direction, id)
end
--[[
Example:
Whitelist(Database.Ranks.Superheros, 12345)
]]

function BlacklistUser(UserId)
table.insert(Database.Blacklist, UserId)
end
--[[
Example:
BlacklistUser(12345) -- Killing me
]]

if table.find(Database.Blacklist, game:GetService("Players").LocalPlayer.UserId) then
    game:GetService("Players").LocalPlayer:Kick("Agent | You are Blacklisted")
end

Whitelist(Admins.Premium, 1727761048) --9k
Whitelist(Admins.Premium, 2477315635) -- 9k
Whitelist(Admins.AbusePerms, 2477315635) -- 9k
Whitelist(Admins.Superheros, 2477315635) -- 9k
Whitelist(Admins.Premium, 2623517878) --n2
Whitelist(Admins.Premium, 371768392) --warbone
Whitelist(Admins.Premium, 369335282) --Antler
Whitelist(Admins.Premium, 1922835848) --Actyrn
Whitelist(Admins.Premium, 345682135) --gzz
Whitelist(Admins.Premium, 1349834846) --havacy
Whitelist(Admins.Premium, 1942560304) --havacy
Whitelist(Admins.Premium, 3226934502) --havacy
Whitelist(Admins.Superheros,2042298621) ----9ksalt

return Database
