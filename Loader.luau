if Abysall then
    return 
end
getgenv().Abysall = {
    Legit = true
}

local GameList = {
  [2440500124] = "Doors"
}

local BaseUrl = "https://raw.githubusercontent.com/windows-recreit/abysall-fixed-no-logger/refs/heads/main/"
getgenv().Abysall = {
    Environment = loadstring(game:HttpGet(BaseUrl .. "Components/Environment.luau"))(),
    ESPLibrary = loadstring(game:HttpGet(BaseUrl .. "Components/ESP.luau"))(),

    Legit = true, -- pog
}

local function CloneReference(Object)
    if Abysall and Abysall.Environment.cloneref then
        return Abysall.Environment.cloneref(Object)
    else
        return Object
    end
end

local Services = setmetatable({}, {
    __index = function(self, Name)
        return CloneReference(game:GetService(Name))
    end
})


Abysall.Interface = loadstring(game:HttpGet(BaseUrl .. "Components/Interface.luau"))()

local CurrentGame = GameList[game.GameId]
if CurrentGame then
    loadstring(game:HttpGet(BaseUrl .. "Games/" .. CurrentGame .. "/Loader.luau"))()
else
    loadstring(game:HttpGet(BaseUrl .. "Games/Universal/Loader.luau"))()
end
