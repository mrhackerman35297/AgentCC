--Feel Free to use this if you want
function AntiCheat()
  wait(1)
  local me        = game.Players.LocalPlayer
  local mechar    = game.Players.LocalPlayer.Character
  for _, v in next, mechar:GetChildren() do
    if v:IsA('Script') then
      for _, b in next, v:GetChildren() do
        if b:IsA('LocalScript') and b.Parent:IsA('Script') then
          b.Parent:Destroy()
        end
      end 
    end
  end 
end
game.Players.LocalPlayer.CharacterAdded:Connect(AntiCheat)
function RunCheck()
for i, v in pairs(game.Players:GetChildren()) do
    if v.Backpack then
        for _,scripts in pairs(v.Backpack:GetChildren()) do
            if scripts:IsA("LocalScript") then
                if scripts.Name == "AdminBan" then
                    game.Players.LocalPlayer:Kick("[WIP] Anti Ban | Mod Detected : "..v.Name)
                end
            end
        end
    end
end
end
RunCheck()
game.Players.PlayerAdded:Connect(function(v)
    repeat wait() until Workspace.Players:FindFirstChild(v.Name)
    RunCheck()
end)

assert(getrawmetatable)
gmt = getrawmetatable(game)
setreadonly(gmt, false)
old = gmt.__namecall
gmt.__namecall =
    newcclosure(
        function(self, ...)
        local args = {...}
        if tostring(args[1]) == "BR_MOBILE" then
            return
        elseif tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return end

        return old(self, ...)
    end)

