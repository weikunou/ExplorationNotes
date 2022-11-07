require("Player")

-- 主入口函数，从这里开始lua逻辑
function Main()
    -- 创建一个角色
    local player = Player.New("kun", 1)
    -- 移动位置
    player:Move(Vector3.New(0, 2, 0))
end

-- 场景切换通知
function OnLevelWasLoaded(level)
    collectgarbage("collect")
    Time.timeSinceLevelLoad = 0
end

function OnApplicationQuit()
    print("退出游戏")
end
