xpcall(function()
                    local old
                    old = hookmetamethod(game, "__namecall" ,newcclosure(function(self,...)
                        if not checkcaller() then return old(self,...) end
                        local args = {...}
            
                        if self == PhysicsService then
                            if getnamecallmethod() == "RenameCollisionGroup" then
                                return	RenameCollisionGroup(args[1],args[2])
                            elseif getnamecallmethod() == "RemoveCollisionGroup"  then
                                return	RemoveCollisionGroup(args[1])
                            elseif getnamecallmethod() == "CreateCollisionGroup" then
                                return	CreateCollisionGroup(args[1])
                            elseif getnamecallmethod() == "CollisionGroupSetCollidable" then
                                return CollisionGroupSetCollidable(args[1],args[2],args[3])
                            end
                        end 
            
                        return old(self,...)
                    end))
                end, function()
                    local mt = getrawmetatable(game)
                    local old = mt.__namecall
                    
                    setreadonly(mt,false)
                    
                    mt.__namecall = newcclosure(function(self, ...)
                        if not checkcaller() then return old(self,...) end
                        local args = {...}
            
                        if self == PhysicsService then
                            if getnamecallmethod() == "RenameCollisionGroup" then
                                return	RenameCollisionGroup(args[1],args[2])
                            elseif getnamecallmethod() == "RemoveCollisionGroup"  then
                                return	RemoveCollisionGroup(args[1])
                            elseif getnamecallmethod() == "CreateCollisionGroup" then
                                return	CreateCollisionGroup(args[1])
                            elseif getnamecallmethod() == "CollisionGroupSetCollidable" then
                                return CollisionGroupSetCollidable(args[1],args[2],args[3])
                            end
                        end 
            
                        return old(self,...)
                    end)
            
                    setreadonly(mt,true)
        end)
        setfflag("HumanoidParallelRemoveNoPhysics", "False")
        setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")      
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
				game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(500000,500000,500000)
			end
		end
	end

end)
