
game:service("RunService").Stepped:connect(function()
    if getgenv().Noclip == true then
        if game.Players.LocalPlayer.Character:FindFirstChild("BOOMBOXHANDLE") then
            game.Players.LocalPlayer.Character:FindFirstChild("BOOMBOXHANDLE"):Destroy()
            game.Players.LocalPlayer.Character:WaitForChild("UpperTorso").CanCollide = false
            game.Players.LocalPlayer.Character:WaitForChild("LowerTorso").CanCollide = false
            game.Players.LocalPlayer.Character:WaitForChild("Head").CanCollide = false
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CanCollide = false
        else
            if game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask") then
                game.Players.LocalPlayer.Character:FindFirstChild("In-gameMask"):FindFirstChildOfClass("Model"):FindFirstChild("Head").CanCollide = false 
            end
            game.Players.LocalPlayer.Character:WaitForChild("UpperTorso").CanCollide = false
            game.Players.LocalPlayer.Character:WaitForChild("LowerTorso").CanCollide = false
            game.Players.LocalPlayer.Character:WaitForChild("Head").CanCollide = false
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CanCollide = false
        end
    end
end)
