	game:GetService("RunService").Heartbeat:Connect(function()
		if getgenv().LettuceFarm == true then
			wait()
			if not game.Players.LocalPlayer.Character:FindFirstChild("[Lettuce]") then
				wait()
				local k = game.Workspace.Ignored.Shop["[Lettuce] - $5"]
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
				if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
					wait(.2)
					fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
				end
			end
			if not game.Players.LocalPlayer.Character:FindFirstChild("[Lettuce]") then
				tool = game.Players.LocalPlayer.Backpack:WaitForChild("[Lettuce]")
				tool.Parent = game.Players.LocalPlayer.Character
				wait()
				game.Players.LocalPlayer.Character:WaitForChild("[Lettuce]"):Activate()
			end
		end
	end)
