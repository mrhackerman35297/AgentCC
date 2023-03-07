assert(getrawmetatable)
gmt = getrawmetatable(game)
setreadonly(gmt, false)
old = gmt.__namecall
gmt.__namecall =
    newcclosure(
        function(self, ...)
        local args = {...}
        if tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
               elseif tostring(args[1]) == "KICKREMOTE" then
            return
      elseif tostring(args[1]) == "GUI_CHECK" then
            return
            end
        return old(self, ...)
    end
    )
--//BatMan Glide
function Glide()
    function sandbox(var,func)
        local env = getfenv(func)
        local newenv = setmetatable({},{
            __index = function(self,k)
                if k=="script" then
                    return var
                else
                    return env[k]
                end
            end,
        })
        setfenv(func,newenv)
        return func
    end
    cors = {}
    mas = Instance.new("Model",game:GetService("Lighting"))
    Tool0 = Instance.new("Tool")
    LocalScript1 = Instance.new("LocalScript")
    Sound2 = Instance.new("Sound")
    Sound3 = Instance.new("Sound")
    Animation4 = Instance.new("Animation")
    RemoteEvent5 = Instance.new("RemoteEvent")
    Animation6 = Instance.new("Animation")
    Tool0.Name = "Glide"
    Tool0.Parent = mas
    Tool0.CanBeDropped = false
    Tool0.RequiresHandle = false
    LocalScript1.Name = "local"
    LocalScript1.Parent = Tool0
    table.insert(cors,sandbox(LocalScript1,function()
        wait();
        local LocalPlayer = game.Players.LocalPlayer;
        while true do
            wait();
            if LocalPlayer.Character then
                break;
            end;
        end;
        local Character = LocalPlayer.Character;
        local Humanoid = Character:WaitForChild("Humanoid");
        local Parent = script.Parent;
        local u1 = false;
        local MainModule = require(game.ReplicatedStorage.MainModule);
        local u3 = false;
        local u4 = Humanoid:LoadAnimation(script.Glide);
        Parent.Equipped:connect(function(mouse)
            mouse.Button1Down:connect(function()
                if u1 or Humanoid.FloorMaterial ~= Enum.Material.Air and MainModule.Activate(Character.BodyEffects) ~= true then
                    return;
                end;
                u1 = true;
                u3 = true;
                u4:Play();
                local BodyVelocity = Instance.new("BodyVelocity", Character.HumanoidRootPart);
                BodyVelocity.MaxForce = Vector3.new(50000, 50000, 50000);
                BodyVelocity.Velocity = (Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-18), 0, 0)).lookVector * 40;
                while u3 and Humanoid.FloorMaterial == Enum.Material.Air do
                    BodyVelocity.Velocity = (Character.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(-18), 0, 0)).lookVector * 40;
                    game:GetService("RunService").Heartbeat:wait();        
                end;
                BodyVelocity:Destroy();
                u3 = false;
                u4:Stop();
                wait(0.3);
                u1 = false;
            end);
            mouse.Button1Up:connect(function()
                u3 = false;
            end);
        end);
        Parent.Unequipped:connect(function()
            u3 = false;
        end);
    end))
    Sound2.Name = "Flapping"
    Sound2.Parent = LocalScript1
    Sound2.Looped = true
    Sound2.MaxDistance = 100
    Sound2.Pitch = 1.5
    Sound2.PlaybackSpeed = 1.5
    Sound2.SoundId = "rbxassetid://1462718291"
    Sound3.Name = "Activation"
    Sound3.Parent = LocalScript1
    Sound3.MaxDistance = 100
    Sound3.SoundId = "rbxassetid://2952274135"
    Sound3.Volume = 0.69999998807907
    RemoteEvent5.Name = "re"
    RemoteEvent5.Parent = LocalScript1
    Animation6.Name = "Glide"
    Animation6.Parent = LocalScript1
    Animation6.AnimationId = "rbxassetid://3084858603"
    for i,v in pairs(mas:GetChildren()) do
        v.Parent = game.Players.LocalPlayer.Backpack
        pcall(function() v:MakeJoints() end)
    end
    mas:Destroy()
    for i,v in pairs(cors) do
        spawn(function()
            pcall(v)
        end)
    end
end
Glide()
game.Players.LocalPlayer.CharacterAdded:connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
    wait(1)
    Glide()
end)
