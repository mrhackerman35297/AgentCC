--// Ruzzell's OP Da Hood Autofarm
--// I DID NOT MAKE THIS CREDITS TO RUZZEL (I ONLY UPDATED IT TO DA HOODS NEW ANTICHEAT)
--// CUSTOMIZATION \-- 
getgenv().CashFarm = true --make true if you wanna atm farm, else make false 
local plr = game.Players.LocalPlayer
repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")

for i,v in pairs(game.Workspace:GetDescendants()) do 
    if v:IsA("Seat") then 
        v:Destroy() 
    end 
end

function DeleteAntiCheat() 
    for i,v in pairs(plr.Character:GetChildren()) do 
        if v.ClassName == "Script" and v.Name ~= "Health" then 
            v:Destroy() 
        end 
    end 
end

plr.CharacterAdded:Connect(function(character) 
    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR") DeleteAntiCheat() wait(1) reset = false end) DeleteAntiCheat()

local reset = false 
spawn(function() 
    while wait() do 
        pcall(function()
            if plr.Character.Humanoid.Health <= 0 then 
                reset = true 
            end 
        end) 
    end 
end)

game:GetService("Players").LocalPlayer.Idled:connect(function() 
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) 
    wait(1) 
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) 
end)

game:GetService('RunService').Stepped:connect(function() 
    setsimulationradius(math.huge) 
end)

local function CompleteHospitalJob(Colour,Patient) 
    repeat 
        fireclickdetector(game.Workspace.Ignored.HospitalJob[Colour].ClickDetector) 
        wait(0.1) if Patient:FindFirstChild("ClickDetector") then 
            fireclickdetector(Patient.ClickDetector) 
        end 
    until Patient.Name == "Thank you!" or Patient.Name == "Wrong bottle!" 
end

while wait(0.5) do 
    if getgenv().CashFarm == true then 
        for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do 
            if v.Humanoid.Health > 0 then 
                wait(5) 
                spawn(function() 
                    while v.Humanoid.Health > 0 do 
                        wait() 
                        pcall(function()
                    if getgenv().CashFarm == true then 
                            plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0, -2, 1.5)
                    end
                        end) 
                    end 
                end) 
                repeat 
                    pcall(function()
                        plr.Character.Humanoid:EquipTool(plr.Backpack.Combat)
                    end) 
                    wait(0.1) 
                    pcall(function() 
                        plr.Character.Combat:Activate() 
                        wait(2) 
                        plr.Character.Combat:Deactivate() 
                        wait(1) 
                    end) 
                until v.Humanoid.Health <= 0  or getgenv().CashFarm == false
                wait(0.1)
                for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do 
                    if vv.Name ~= "MoneyDrop" then 
                        continue 
                    end 
                    if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 25 then 
                        continue 
                    end 
                    vv.Name = "Grabbing" 
                    vv.Anchored = true 
                    while game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do 
                        wait() pcall(function() 
                            plr.character.HumanoidRootPart.CFrame = vv.CFrame 
                            if not reset then 
                                fireclickdetector(vv.ClickDetector) 
                            end 
                        end) 
                    end 
                end 
            end 
        end 
    end 
end
