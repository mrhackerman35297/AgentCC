        getgenv().SilentAimBool = true
        getgenv().SilentAimFOV = 55
        getgenv().SilentAimTarget = nil
getgenv().SilentAimVisible = true
        getgenv().Minus = 60
                _G.PART = "HumanoidRootPart"
                _G.PRED = 0.048
                _G.Frame = Vector3.new(0, 0.53, 0)
                local players = game.GetService(game, "Players")
                local guiservice = game.GetService(game, "GuiService")
                local runservice = game.GetService(game, "RunService")
                local renderstepped = runservice.RenderStepped
                local localPlayer = players.LocalPlayer
                local currentCamera = game.GetService(game, "Workspace").CurrentCamera
                local mouse = localPlayer.GetMouse(localPlayer)
                local mt = getrawmetatable(game)
                local backupnamecall = mt.__namecall
                local backupnewindex = mt.__newindex
                local backupindex = mt.__index
                local setreadonly = setreadonly or make_writeable
                local getnamecallmethod = getnamecallmethod or get_namecall_method
                local newcclosure = newcclosure or function(f) return f end
        
                setreadonly(mt, false)
        
                local circle = Drawing.new("Circle")
                function updateCircle()
                    if circle.__OBJECT_EXISTS then
                        circle.Transparency = 1
                        if getgenv().SilentAimVisible == true then
                            circle.Visible = (function()
                                if getgenv().SilentAimBool == true then
                                    return true
                                else
                                    return false
                                end
                            end)()
                        else
                            circle.Visible = false
                        end
                        circle.Thickness = 2
                        circle.Color = getgenv().Color
                        circle.NumSides = 90
                        circle.Radius = (getgenv().SilentAimFOV * 6) / 2
                        circle.Filled = false
                        circle.Position = Vector2.new(mouse.X, mouse.Y + (guiservice.GetGuiInset(guiservice).Y))
                    end
                end
                
                renderstepped.Connect(renderstepped, updateCircle)
        
                function isPartVisible(Part, PartDescendant)
                    local CurrentCamera = game.GetService(game, "Workspace").CurrentCamera
                    local LocalPlayer = game.Players.LocalPlayer
                    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded.Wait(LocalPlayer.CharacterAdded)
                    local Origin = CurrentCamera.CFrame.p
                    local _, OnScreen = CurrentCamera.WorldToViewportPoint(CurrentCamera, Part.Position)
                    if OnScreen then
                        local newRay = Ray.new(Origin, Part.Position - Origin)
                        local PartHit, _ = Workspace.FindPartOnRayWithIgnoreList(Workspace, newRay, {Character, CurrentCamera})
                        local Visible = (not PartHit or PartHit.IsDescendantOf(PartHit, PartDescendant))
                        return Visible
                    end
                    return false
                end
        
                setreadonly(math, false); math.chance = function(percentage) local percentage = math.floor(percentage); local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100)/100; return chance <= percentage/100 end; setreadonly(math, true);
        
                function getclosestplrtomouse()
                    local Mouse = game.Players.LocalPlayer:GetMouse()
                    local mhit = Mouse.Hit.p
                    local TargetDistance = math.huge
                    local target = "/none/"
                    for _,plr in pairs(game.Players:GetChildren()) do
                        pcall(function()
                            if plr.Name ~= game.Players.LocalPlayer.Name then
                                local chara = plr.Character or nil
                                if chara ~= nil and chara:FindFirstChild("Head") then
                                    if (chara.Head.Position - mhit).magnitude < TargetDistance then
                                        local CurrentCamera = game.GetService(game, "Workspace").CurrentCamera
                                        local Camera = workspace.CurrentCamera
                                        local _, withinScreenBounds = Camera:WorldToScreenPoint(plr.Character:FindFirstChild("Head").Position)
                                        if withinScreenBounds and isPartVisible(plr.Character:FindFirstChild("Head"), plr.Character) == true then
                                            local PartPos, OnScreen = CurrentCamera.WorldToViewportPoint(CurrentCamera, plr.Character.Head.Position)
                                            local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude  
                                            if (Magnitude < (getgenv().SilentAimFOV * 6 - getgenv().Minus)) and chara.BodyEffects:FindFirstChild("K.O").Value ~= true then
                                                TargetDistance = (chara.Head.Position - mhit).magnitude
                                                target = plr
                                            end
                                        end
                                    end
                                end
                            end
                        end)
                    end
                    getgenv().SilentAimTarget = target
                end
        
                delay(0,function()
                    while true do wait()
                        getclosestplrtomouse()
                    end
                end)
        
                wait(0.1)
        
                mt.__namecall = newcclosure(function(...)
                    local method = getnamecallmethod()
                    local args = {...}
                    if tostring(method) == "FireServer" and tostring(args[1]) == "MainEvent" and tostring(args[2]) == 'UpdateMousePos' and getgenv().SilentAimBool == true and getgenv().SilentAimTarget ~= "/none/" then
                        args[3] = getgenv().SilentAimTarget.Character.HumanoidRootPart.Position + _G.Frame + getgenv().SilentAimTarget.Character[_G.PART].Velocity * L_79_
                        return backupnamecall(unpack(args))
                    end
        
                    return backupnamecall(...)
                end)
  game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().SilentAimPingPrediction == true then
                        local L_117_ = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                        local L_118_ = tostring(L_117_)
                        local L_119_ = L_118_:split(" ")
                        local L_120_ = L_119_[1]
                        L_79_ = L_120_ / 1000 + _G.PRED
                        _G.Frame = Vector3.new(0, 0.53, 0)
      end
                end)
       
