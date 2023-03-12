getgenv().OldAimPart = "HumanoidRootPart"
getgenv().AimPart = "Head"
getgenv().AimRadius =  25
getgenv().ThirdPerson = true
getgenv().FirstPerson = true
getgenv().TeamCheck = false
getgenv().line = false
getgenv().keybind ="q"
getgenv().PredictMovement = true
getgenv().PredictionVelocity =16
getgenv().CheckIfJumped = true
getgenv().Smoothness = false
getgenv().SmoothnessAmount = 0.06
getgenv().Aimlock = true
----------------settings















getgenv().CurrentCamera = game:GetService "Workspace".CurrentCamera








--[[
shit made by din <3

love kendylll


-----shit for taffy
]]

local services = setmetatable({ }, {
    __index = function(t,k)
        return game:GetService(k)
    end
})
local Players = services.Players
local Uisf = services.UserInputService
local Workgalaxy = services.Workspace
local RService = services.RunService
local SGui = services.StarterGui
local Inset2 = game:GetService("GuiService"):GetGuiInset().Y


local mousef = game.Players.LocalPlayer:GetMouse()
local Clientuser = Players.LocalPlayer
local runshit = game:GetService("RunService")
local localnigger = game.Players.LocalPlayer
local Line = Drawing.new("Line")


local camgay = Workspace.CurrentCamera

local CF = CFrame.new
local RNew = Ray.new
local Vec3 = Vector3.new
local Vec2 = Vector2.new
local MousePressed, CanNotify =false, false
local AimlockTarget, OldPre

local CiazwareUniversalAimbotLoaded = true

local Target, PartMode, Partz, NotifMode, Prediction
local SpinBotSpeed

local GetNearestTarget = function()
    local plr1g2 = nil;
    local distance = 99999;
    
    for i, v in next, Players:GetPlayers() do
        if v.Name ~= Clientuser.Name then
            --if v.Character and v.Team ~= Clientuser.Team then
            if v.Character then
                local pos,aaaa = camgay:WorldToViewportPoint(v.Character.Head.Position);
                local mouse = Uisf:GetMouseLocation()
                local magnitude = (Vec2(pos.X, pos.Y) - Vec2(mousef.X, mousef.Y)).magnitude;

                if aaaa and (magnitude < distance) then
                    plr1g2 = v;
                    distance = magnitude;
                end
            end
        end
    end
    
    return plr1g2;
end


mousef.KeyDown:Connect(function(k)
    if k ~= keybind then return end
    if Aimlock and AimlockTarget == nil then
        if MousePressed ~= true then MousePressed = true end 
        local Target;Target = GetNearestTarget()
        if Target ~= nil then
            AimlockTarget = Target
        end
    else
        if AimlockTarget ~= nil then AimlockTarget = nil end
        if MousePressed ~= false then 
            MousePressed = false 
            Line.Visible = false
        end
    end
end)

runshit.Stepped:connect(function()
    if line == true then
        local Vector = CurrentCamera:WorldToViewportPoint(AimlockTarget.Character[AimPart].Position)
        Line.Color = Color3.fromRGB(255,255,255)                                                              
        Line.Thickness = 2.5
        Line.Transparency = 1
 

        Line.From = Vector2.new(mousef.X, mousef.Y + Inset2)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        Line.Visible = true
    else
        Line.Visible = false

    end
end)




RService.RenderStepped:Connect(function()
    if ThirdPerson == true and FirstPerson == true then 
        if (camgay.Focus.p - camgay.CoordinateFrame.p).Magnitude > 1 or (camgay.Focus.p - camgay.CoordinateFrame.p).Magnitude <= 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    elseif ThirdPerson == true and FirstPerson == false then 
        if (camgay.Focus.p - camgay.CoordinateFrame.p).Magnitude > 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    elseif ThirdPerson == false and FirstPerson == true then 
        if (camgay.Focus.p - camgay.CoordinateFrame.p).Magnitude <= 1 then 
            CanNotify = true 
        else 
            CanNotify = false 
        end
    end
    if Aimlock == true and MousePressed == true then 
        if AimlockTarget and AimlockTarget.Character and AimlockTarget.Character:FindFirstChild(AimPart) then 
            if FirstPerson == true then
                if CanNotify == true then
                    if PredictMovement == true then
                        if Smoothness == true then
                            --// The part we're going to lerp/smoothen \\--
                            local Main = CF(camgay.CFrame.p, AimlockTarget.Character[AimPart].Position + AimlockTarget.Character[AimPart].Velocity/PredictionVelocity)
                            
                            --// Making it work \\--
                            camgay.CFrame = camgay.CFrame:Lerp(Main, SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                        else
                            camgay.CFrame = CF(camgay.CFrame.p, AimlockTarget.Character[AimPart].Position + AimlockTarget.Character[AimPart].Velocity/PredictionVelocity)
                        end
                    elseif PredictMovement == false then 
                        if Smoothness == true then
                            --// The part we're going to lerp/smoothen \\--
                            local Main = CF(camgay.CFrame.p, AimlockTarget.Character[AimPart].Position)

                            --// Making it work \\--
                            camgay.CFrame = camgay.CFrame:Lerp(Main, SmoothnessAmount, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut)
                        else
                            camgay.CFrame = CF(camgay.CFrame.p, AimlockTarget.Character[AimPart].Position)
                        end
                    end
                end
            end
        end
    end
end)
