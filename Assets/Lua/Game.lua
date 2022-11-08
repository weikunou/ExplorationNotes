-- 加载全局表和函数
require("GlobalTable")
require("GlobalFunction")

-- 加载管理器
require("GameManager")
require("PlayerManager")

require("CameraFollow")

Game = Class("Game")

Game.Ctor = function (self)
    self:Awake()
    self:Start()
end

Game.Awake = function (self)
    if not self.handle then
        self.handle = UpdateBeat:CreateListener(self.Update, self)
    end
    UpdateBeat:AddListener(self.handle)

    self:InitManager()
end

Game.Start = function (self)
    local player = self:GetManager("PlayerManager"):CreatePlayer(10001, "kun", 1)
    CameraFollow.New(player)
end

Game.Update = function (self)
    if Input.GetKeyDown(KeyCode.F1) then
        print("F1")
    elseif Input.GetKeyDown(KeyCode.F2) then
        print("F2")
    end
end

Game.InitManager = function (self)
    self.managerList = {}
    self.managerList["GameManager"] = GameManager.New()
    self.managerList["PlayerManager"] = PlayerManager.New()
end

Game.GetManager = function (self, name)
    return self.managerList[name]
end