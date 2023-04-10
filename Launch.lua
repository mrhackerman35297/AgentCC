if FLUXUS_LOADED then
    	local invite = 'wPQHasG3nX'
		local http = game:GetService('HttpService')
		local req = (syn and syn.request) or (http and http.request) or http_request
		if req then
			req({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = http:JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = http:GenerateGUID(false),
					args = {code = invite} 
				})
			})
		end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Versions/BadSploits"))()
elseif KRNL_LOADED then
    	local invite = 'wPQHasG3nX'
		local http = game:GetService('HttpService')
		local req = (syn and syn.request) or (http and http.request) or http_request
		if req then
			req({
				Url = 'http://127.0.0.1:6463/rpc?v=1',
				Method = 'POST',
				Headers = {
					['Content-Type'] = 'application/json',
					Origin = 'https://discord.com'
				},
				Body = http:JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = http:GenerateGUID(false),
					args = {code = invite} 
				})
			})
		end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Versions/BadSploits"))()
else
    local Inviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Sources/Random.lua"))()

    -- Creates an interactable prompt
    Inviter.Prompt({
        name = "Agent Revamped",
        invite = "https://discord.gg/wPQHasG3nX",
        script = "https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Versions/BadSploits",
    })
    -- thank you using a good sploit
end
--// Old Shitty Dog Versions

--loadstring(game:HttpGet("https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Versions/BadSploits"))()
--[[if syn then
loadstring(game:HttpGet(Versions..'GoodSploits'))()
else
loadstring(game:HttpGet(Versions..'BadSploits'))()
end]]
