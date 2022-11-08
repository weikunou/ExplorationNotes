require("Player")

PlayerManager = Class("PlayerManager")

PlayerManager.Ctor = function (self)
    self._playerList = {}
    if not self.handle then
        self.handle = UpdateBeat:CreateListener(self.Update, self)
    end
    UpdateBeat:AddListener(self.handle)
end

PlayerManager.CreatePlayer = function (self, id, name, level)
    local player = Player.New(name, level)
    self._playerList[id] = player
    return player
end

PlayerManager.Update = function (self)

end
