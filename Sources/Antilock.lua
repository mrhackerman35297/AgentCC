getgenv().Antilock = true 
game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().Antilock == true then 
      local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
      game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,90,0) 
      game:GetService("RunService").RenderStepped:Wait()
      game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)
