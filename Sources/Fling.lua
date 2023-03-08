game:GetService("RunService").RenderStepped:Connect(function()
    	--// [Fling]
	if getgenv().Fling == true then
		local FlingEnemy = game.Players[getgenv().FlingTarget].Character
		if FlingEnemy then
			FlingTorso = FlingEnemy.UpperTorso
			local dis = 3.85
			local increase = 6
			if FlingEnemy.Humanoid.MoveDirection.X < 0 then
				xchange = -increase
			elseif FlingEnemy.Humanoid.MoveDirection.X > 0  then
				xchange = increase
			else
				xchange = 0
			end
			if FlingEnemy.Humanoid.MoveDirection.Z < 0 then
				zchange = -increase
			elseif FlingEnemy.Humanoid.MoveDirection.Z > 0 then
				zchange = increase
			else
				zchange = 0
			end          
			if game.Players.LocalPlayer.Character then
				game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid'):ChangeState(11)
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(FlingTorso.Position.X + math.random(-dis,dis) + xchange, FlingTorso.Position.Y, FlingTorso.Position.Z + math.random(-dis,dis) + zchange) * CFrame.Angles(math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.X + 350),math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Y + 200),math.rad(game.Players.LocalPlayer.Character.HumanoidRootPart.Orientation.Z + 240))
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(900000,900000000),math.random(900000,900000000),math.random(900000,900000000))
			end
		end
	end

end)
