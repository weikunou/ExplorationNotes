UITool = Class("UITool")

UITool.Ctor = function (self)
    self.panelList = {}
end

---创建界面
---@param self table
---@param panelName string 界面名称
UITool.CreatePanel = function (self, panelName)
    local obj = ResManager.Instance:LoadGameObject("ui", panelName)
    local panel = GameObject.Instantiate(obj, UIManager.Instance.MainCanvas, false)
    self.panelList[panelName] = panel
end

---获取界面
---@param self table
---@param panelName string 界面名称
---@return table 界面预制体
UITool.GetPanel = function (self, panelName)
    return self.panelList[panelName]
end

---销毁界面
---@param self table
---@param panelName string 界面名称
UITool.DestroyPanel = function (self, panelName)
    if self.panelList[panelName] then
        GameObject.Destroy(self.panelList[panelName])
        self.panelList[panelName] = nil
    end
end