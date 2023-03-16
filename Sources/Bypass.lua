local code = string.format([[
    repeat task.wait() until game:IsLoaded()
    
    wait(1)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mrhackerman35297/AgentCC/main/Launch.lua"))()

]])
function turnonque()
  if getgenv().turnonqueloaded ~= true then
    getgenv().turnonqueloaded = true
  local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport

  if syn then
    if syn.queue_on_teleport then
      syn.queue_on_teleport(code)
    end
  elseif fluxus then
    if fluxus.queue_on_teleport then
      fluxus.queue_on_teleport(code)
    end
  else
    if queue_on_teleport then
      queue_on_teleport(code)
    end
  end
end
end
turnonque()
