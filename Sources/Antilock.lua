getgenv().Antilock = true 
getgenv().SkyAmount = 90
game:GetService("RunService").heartbeat:Connect(function()
    if getgenv().Antilock ~= false then 
      local vel = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
      game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,getgenv().SkyAmount,0) 
      game:GetService("RunService").RenderStepped:Wait()
      game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = vel
    end 
end)
