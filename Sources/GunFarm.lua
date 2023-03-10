--// Created By Ruzzel
--// Modded By Agent Admins Due To Da Hood Patches 
local plr = game.Players.LocalPlayer
local gun = plr.Character:FindFirstChildOfClass("Tool")
local lastgun = gun.Name
getgenv().GunFarm = true
getgenv().FarmPart = nil
local buyingammo = false
repeat wait() until plr.Character:FindFirstChild("FULLY_LOADED_CHAR")
--SEAT DESTRUCTIONNNNN
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v:IsA("Seat") then
		v:Destroy()
	end
end
--anti tp anticheat
function DeleteAntiCheat()
    for i,v in pairs(plr.Character:GetChildren()) do
        if v.ClassName == "Script" and v.Name ~= "Health" then
            v:Destroy()
        end
    end
end

plr.CharacterAdded:Connect(function(character)
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("FULLY_LOADED_CHAR")
    DeleteAntiCheat()
	wait(1)
	reset = false
end)
DeleteAntiCheat()
--respawn
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
--antiafk
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
--network ownership
game:GetService('RunService').Stepped:connect(function()
	setsimulationradius(math.huge)
end)

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
    if tostring(method) == "FireServer" and tostring(args[1]) == "MainEvent" and tostring(args[2]) == 'UpdateMousePos'  and getgenv().GunFarm == true then
        args[3] = getgenv().FarmPart
        return backupnamecall(unpack(args))
    end

    return backupnamecall(...)
end)

while wait(0.5) do
    if getgenv().GunFarm == true then
        for i,v in pairs(game.Workspace.Cashiers:GetChildren()) do
            if v.Humanoid.Health > 0 then
                spawn(function()
                    while v.Humanoid.Health > 0 do
                        wait()
                        if buyingammo == false then
                            pcall(function()plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame * CFrame.new(0.3, 0, 5)end)
                        end
                    end
                end)
                repeat
                    wait(0.5)
                    if gun.Ammo.Value == 0 then 
                        if plr.DataFolder.Inventory[gun.Name].Value == "0" then
                            buyingammo = true
                            for i, v in pairs(game.Workspace.Ignored.Shop:GetChildren()) do
                                if string.find(v.Name, string.sub(string.gsub(gun.Name, "]", " Ammo"), 2, 15)) then
                                    plr.Character.Humanoid:UnequipTools()
                                    repeat wait()
                                        plr.Character.HumanoidRootPart.CFrame = v.Head.CFrame
                                        fireclickdetector(v.ClickDetector)
                                    until tonumber(plr.DataFolder.Inventory[gun.Name].Value) >= 400
                                    plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(lastgun))
                                end
                            end
                        else
                        game.ReplicatedStorage.MainEvent:FireServer("Reload", gun)
                            repeat wait() until gun.Ammo ~= 0
                        end
                    else
                        buyingammo = false
                        pcall(function()
                            getgenv().FarmPart = v.Head.Position
                            wait()
                            repeat wait()
                                gun:Activate()
                                wait()
                                gun:Deactivate()
                            until v.Humanoid.Health <= 0 or gun.Ammo.Value == 0
                        end)
                    end
                wait(0.1)
                until v.Humanoid.Health <= 0

                for ii,vv in pairs(game.Workspace.Ignored.Drop:GetChildren()) do
                    if vv.Name ~= "MoneyDrop" then 
                        continue 
                    end
                    if (plr.Character.HumanoidRootPart.Position - vv.Position).Magnitude > 12 then 
                        continue 
                    end
                    vv.Name = "Grabbing"
                    vv.Anchored = true
                    while 
                    game.Workspace.Ignored.Drop:FindFirstChild("Grabbing") do
                        wait(1)
                        wait()
                        pcall(function()
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

