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
                local RunService = game:GetService('RunService')
                RunService.Heartbeat:Connect(function(step)
                    if getgenv().Noclip == true then
                        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
                    end
                end)
            end)();
        end)
        setfflag("HumanoidParallelRemoveNoPhysics", "False")
        setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")      
