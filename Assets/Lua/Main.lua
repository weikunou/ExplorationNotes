-- 加载全局表和函数
require("GlobalTable")
require("GlobalFunction")

-- 加载管理器
require("GameManager")
require("PlayerManager")

-- 主入口函数，从这里开始lua逻辑
function Main()
    local gameManager = GameManager.New()
    local playerManager = PlayerManager.New()
    -- 创建一个角色
    local player = playerManager:CreatePlayer(10001, "kun", 1)
end

-- 场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
    print("退出游戏")
end
