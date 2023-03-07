 function Hearing()
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
            BillboardGui2 = Instance.new("BillboardGui")
            ImageLabel3 = Instance.new("ImageLabel")
            ScreenGui4 = Instance.new("ScreenGui")
            TextLabel5 = Instance.new("TextLabel")
            ScreenGui6 = Instance.new("ScreenGui")
            ImageLabel7 = Instance.new("ImageLabel")
            Tool0.Name = "Hearing"
            Tool0.Parent = mas
            Tool0.CanBeDropped = false
            Tool0.RequiresHandle = false
            LocalScript1.Parent = Tool0
            table.insert(cors,sandbox(LocalScript1,function()
                wait();
                local l__LocalPlayer__1 = game.Players.LocalPlayer;
                while true do
                    wait();
                    if l__LocalPlayer__1.Character then
                        break;
                    end;
                end;
                local l__Character__2 = l__LocalPlayer__1.Character;
                local u1 = false;
                local l__PlayerGui__2 = game.CoreGui;
                function ChatFunc(p1)
                    local v3 = p1.Chatted:connect(function(p2)
                        if u1 then
                            local v4 = BrickColor.Random();
                            local v5 = script.MsgGui:Clone();
                            if string.find(string.lower(p2), "super") then
                                v5.Msg.TextSize = 29;
                            end;
                            v5.Msg.Text = p1.Name .. ": " .. p2;
                            v5.Msg.TextColor3 = v4.Color;
                            v5.Msg.Position = UDim2.new(0.5, math.random(-350, 350), 0.5, math.random(-210, 250));
                            v5.Parent = l__PlayerGui__2;
                            local v6 = script.DotGui:Clone();
                            v6.Dot.ImageColor3 = v4.Color;
                            v6.Enabled = true;
                            if p1.Character then
                                if p1.Character:findFirstChild("Head") then
                                    v6.Parent = p1.Character.Head;
                                end;
                            end;
                            spawn(function()
                                local v7 = 1 - 1;
                                while true do
                                    v6.Size = v6.Size - UDim2.new(0, 1, 0, 1);
                                    game:GetService("RunService").RenderStepped:wait();
                                    if 0 <= 1 then
                                        if v7 < 70 then
        
                                        else
                                            break;
                                        end;
                                    elseif 70 < v7 then
        
                                    else
                                        break;
                                    end;
                                    v7 = v7 + 1;				
                                end;
                            end);
                            game.Debris:AddItem(v5, 3);
                            game.Debris:AddItem(v6, 6);
                        end;
                    end);
                end;
                for v8, v9 in pairs(game.Players:GetChildren()) do
                    ChatFunc(v9);
                end;
                game.Players.PlayerAdded:connect(function(p3)
                    ChatFunc(p3);
                end);
                local u3 = false;
                local u4 = nil;
                script.Parent.Equipped:connect(function(p4)
                    p4.Button1Down:connect(function()
                        if u3 then
                            return;
                        end;
                        u3 = true;
                        if not u1 then
                            u4 = script.Frame:Clone();
                            u4.Parent = l__PlayerGui__2;
                            u1 = true;
                        else
                            u4:Destroy();
                            u1 = false;
                        end;
                        wait(1);
                        u3 = false;
                    end);
                end);
            end))
            BillboardGui2.Name = "DotGui"
            BillboardGui2.Parent = LocalScript1
            BillboardGui2.Enabled = false
            BillboardGui2.Size = UDim2.new(0, 90, 0, 90)
            BillboardGui2.Active = true
            BillboardGui2.ClipsDescendants = true
            BillboardGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BillboardGui2.AlwaysOnTop = true
            ImageLabel3.Name = "Dot"
            ImageLabel3.Parent = BillboardGui2
            ImageLabel3.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel3.BackgroundColor = BrickColor.new("Institutional white")
            ImageLabel3.BackgroundColor3 = Color3.new(1, 1, 1)
            ImageLabel3.BackgroundTransparency = 1
            ImageLabel3.Image = "rbxassetid://130424513"
            ImageLabel3.ImageColor3 = Color3.new(1, 0, 0)
            ScreenGui4.Name = "MsgGui"
            ScreenGui4.Parent = LocalScript1
            ScreenGui4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            TextLabel5.Name = "Msg"
            TextLabel5.Parent = ScreenGui4
            TextLabel5.Position = UDim2.new(0, 300, 0, 25)
            TextLabel5.Size = UDim2.new(0, 1, 0, 1)
            TextLabel5.BackgroundColor = BrickColor.new("Institutional white")
            TextLabel5.BackgroundColor3 = Color3.new(1, 1, 1)
            TextLabel5.BackgroundTransparency = 1
            TextLabel5.Font = Enum.Font.SourceSansBold
            TextLabel5.FontSize = Enum.FontSize.Size28
            TextLabel5.Text = ""
            TextLabel5.TextColor = BrickColor.new("Really black")
            TextLabel5.TextColor3 = Color3.new(0, 0, 0)
            TextLabel5.TextSize = 25
            TextLabel5.TextStrokeTransparency = 0.60000002384186
            ScreenGui6.Name = "Frame"
            ScreenGui6.Parent = LocalScript1
            ScreenGui6.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            ImageLabel7.Name = "Image"
            ImageLabel7.Parent = ScreenGui6
            ImageLabel7.Size = UDim2.new(1, 0, 1, 0)
            ImageLabel7.BackgroundColor = BrickColor.new("Institutional white")
            ImageLabel7.BackgroundColor3 = Color3.new(1, 1, 1)
            ImageLabel7.BackgroundTransparency = 1
            ImageLabel7.Image = "rbxassetid://36869195"
            ImageLabel7.ImageColor3 = Color3.new(0.290196, 1, 0.917647)
            ImageLabel7.ImageTransparency = 0.80000001192093
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
        game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
        Hearing()
game.Players.LocalPlayer.CharacterAdded:connect(function()
    game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
    wait(1)
    Hearing()
end)
