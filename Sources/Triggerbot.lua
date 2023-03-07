local HoldClick = true
                local Hotkey = '' -- Leave blank for always on
                local HotkeyToggle = true -- True if you want it to toggle on and off with a click
        
                local Players = game:GetService('Players')
                local RunService = game:GetService('RunService')
        
                local LocalPlayer = Players.LocalPlayer
                local Mouse = LocalPlayer:GetMouse()
        
                getgenv().TriggerToggle = (Hotkey ~= '')
                local CurrentlyPressed = false
                getgenv().TriggerToggle = false
        
                RunService.RenderStepped:Connect(function()
                    if getgenv().TriggerToggle then
                        if Mouse.Target then
                            if Mouse.Target.Parent:FindFirstChild('Humanoid') then
                                if HoldClick then
                                    if not CurrentlyPressed then
                                        CurrentlyPressed = true
                                        if (not game.Players.LocalPlayer.Character:FindFirstChild('Combat')) then
                                            mouse1press()
                                        end
                                    end
                                else
                                    if (not game.Players.LocalPlayer.Character:FindFirstChild('Combat')) then
                                    mouse1click()
                                    end
                                end
                            else
                                if HoldClick then
                                    CurrentlyPressed = false
                                    mouse1release()
                                end
                            end
                        end
                    end
                end)
