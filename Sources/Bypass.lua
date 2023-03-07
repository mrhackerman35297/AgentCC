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
