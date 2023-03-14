--// CREDITS TO WHO EVER MADE THIS (I DID NOT MAKE THIS)
getgenv().targeted = game.Players.LocalPlayer.Name
                local function GetGun(targetcharacter)
                local gun = targetcharacter:FindFirstChildOfClass("Tool")
                if not gun or gun == nil then return nil end
                    if gun:FindFirstChild("ShootBBGUI", true) then
                        return gun
                    else
                        return nil
                    end
                end
                local function setrainbow(part)
                    task.spawn(function()
                        if RainbowMode == true then
                            while true do
                                part.Color = Color3.fromRGB(168, 255, 29)
                                task.wait()
                            end
                        end
                    end)
                end
                local function getpart()
                    if not (workspace.Ignored:FindFirstChild("MOUSEBEAM")) then
                        local Part = Instance.new("Part", workspace.Ignored)
                        Part.Name = "MOUSEBEAM"
                        Part.Material = "Neon"
                        delay(.1, function() while wait() do 
                        Part.Color = getgenv().Color 
          end  
        end)
                        Part.Transparency = 1
                        Part.CanCollide = false
                        Part.Anchored = true
                        setrainbow(part)
                    end
                    return workspace.Ignored.MOUSEBEAM
                end
                local function UpdateAimed(user)
                    getgenv().targeted = user
                end
                local function SetBEAM(org, pos)
                    local mag = (org - pos).magnitude
                    getpart().Size = Vector3.new(.11, .11, mag * 2)
                    getpart().CFrame = CFrame.new(org, pos) * CFrame.new(0, 0, -mag)
                end
                local aa = getgenv().targeted
                UpdateAimed(aa)
                game:GetService("RunService").Heartbeat:Connect(function()
                    if game.Workspace.Players:FindFirstChild(tostring(getgenv().targeted)) then
                    local char = game.Players[tostring(getgenv().targeted)].Character
                    local bodyeffects = char.BodyEffects
                    local mousePos = bodyeffects.MousePos
                    SetBEAM(char.UpperTorso.Position, mousePos.Value) 
                    else
                    game.Workspace.Ignored.MOUSEBEAM.Transparency =1
                    end
                end)
