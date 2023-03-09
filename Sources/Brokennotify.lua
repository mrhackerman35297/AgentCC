
AGENTUI:Noti("Detecting Users...")
	for _,v in pairs(game:GetService('Players'):GetChildren()) do
		if table.find(Database.Blacklist, v.UserId) then
			AGENTUI:Noti("Blacklisted User Found : "..v.DisplayName)
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('🤬[KILL ME IM BLACKLISTED!!!]')
				end
			end
		elseif table.find(Database.Ranks.Superheros, v.UserId) then
			AGENTUI:Noti("AgentMod Found : "..v.DisplayName)
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('🦸[AgentMod] '..v.DisplayName)
				end
			end
		elseif table.find(Database.Ranks.AbusePerms, v.UserId) then
			AGENTUI:Noti("AgentMod Found : "..v.DisplayName)
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('🦸[AgentMod] '..v.DisplayName)
				end
			end
		elseif table.find(Database.Ranks.Premium, v.UserId) then
			AGENTUI:Noti("Agent Premium User Found : "..v.DisplayName)
			if v.Character then
				if v.Character.Parent.Name == 'Players' then
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('🕵️[Premium] '..v.DisplayName)
				end
			end
		elseif v.Character then --Should be patched due to the new update
			if v.Character.Parent.Name == 'Players' then
				if not v.Character.UpperTorso:FindFirstChild('UpperTorso') then
					AGENTUI:Noti("Pluto User Found : "..v.DisplayName)
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[Pluto] '..v.DisplayName)
				end
				if not v.Character.UpperTorso:FindFirstChild('BodyBackAttachment') then
					AGENTUI:Noti("RayX User Found : "..v.DisplayName)
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[RayX] '..v.DisplayName)
				end
				if not v.Character.UpperTorso:FindFirstChild('OriginalSize') then
					AGENTUI:Noti("Swagmode User Found : "..v.DisplayName)
					v.Character:FindFirstChildWhichIsA('Humanoid').DisplayName = ('[SwagMode V2] ' ..v.DisplayName)
				end
			end
		end
	end
