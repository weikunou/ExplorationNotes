GameManager = Class("GameManager")

GameManager.Ctor = function (self)
    if not self.handle then
        self.handle = UpdateBeat:CreateListener(self.Update, self)
    end
    UpdateBeat:AddListener(self.handle)
end

GameManager.Update = function (self)

end
