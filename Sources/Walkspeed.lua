mouse = game.Players.LocalPlayer:GetMouse()
mouse.KeyDown:Connect(function(key)
    if key == "c" then
safedie = true
end
end)

mouse.KeyUp:Connect(function(key)
    if key == "c" then
safedie = false
end
end)



	delay(0, function()
	pcall(function()
	game:GetService("RunService").stepped:connect(function()
			if safedie == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-1.6)

		end
		end)
		end)
end)
