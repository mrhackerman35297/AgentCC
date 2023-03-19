	local req = (syn and syn.request) or (http and http.request) or http_request
	if req then
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
	end
local Versions = "https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Versions/"
if syn or ScriptWare or KRNL_LOADED then
loadstring(game:HttpGet(Versions..'GoodSploits'))()
else
loadstring(game:HttpGet(Versions..'BadSploits'))()
end
