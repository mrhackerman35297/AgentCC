--// Go ahead and take this its very laggy so ahve fun
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
function FindTool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            if v:FindFirstChild('Ammo') then
                v.Parent = game.Players.LocalPlayer.Character
                wait()
            else
                AGENTUI:Noti("Please Buy a gun in QuickBuy")
            end
        end
    end
game:GetService("RunService").Heartbeat:Connect(function()
        if game.Players[getgenv().Beam].Character:FindFirstChildWhichIsA('Humanoid') then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[getgenv().Beam].Character.HumanoidRootPart.CFrame * CFrame.new(0,9,9)
            FindTool()
        else
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
					if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
						if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
							game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
							wait(1)
						end
					end
				end
        end
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)
setfflag("HumanoidParallelRemoveNoPhysics", "False")
setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False") 
                --------------------- REV BEAM ---------------------------
                _G.PART = "HumanoidRootPart"
                _G.PRED = 0.048
                _G.Frame = Vector3.new(0, 0.53, 0)
                    local mt = getrawmetatable(game)
                    local backupnamecall = mt.__namecall
                    local backupnewindex = mt.__newindex
                    local backupindex = mt.__index
                    local setreadonly = setreadonly or make_writeable
                    local getnamecallmethod = getnamecallmethod or get_namecall_method
                    local newcclosure = newcclosure or function(f) return f end
                setreadonly(mt, false)
                    mt.__namecall = newcclosure(function(...)
                        local method = getnamecallmethod()
                        local args = {...}
                        if tostring(method) == "FireServer" and tostring(args[1]) == "MainEvent" and tostring(args[2]) == 'UpdateMousePos'  and getgenv().GunBeamLock == true then
                            args[3] = game.Players[getgenv().Beam].Character.HumanoidRootPart.Position + _G.Frame + game.Players[getgenv().Beam].Character[_G.PART].Velocity * L_79_
                            return backupnamecall(unpack(args))
                        end
                
                        return backupnamecall(...)
                   end)
                delay(.1, function()
                    while wait() do 
                        local L_117_ = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                        local L_118_ = tostring(L_117_)
                        local L_119_ = L_118_:split(" ")
                        local L_120_ = L_119_[1]
                        L_79_ = L_120_ / 1000 + _G.PRED
                        _G.Frame = Vector3.new(0, 0.53, 0)
                    end
                end)
