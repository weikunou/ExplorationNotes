require("Player")

PlayerManager = Class("PlayerManager")

PlayerManager.Ctor = function (self)
    
end

PlayerManager.CreatePlayer = function (self, name, level)
    local player = Player.New(name, level)
    return player
end