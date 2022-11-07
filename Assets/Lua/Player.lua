require("Global_Function")

---角色类
Player = Class("Player")

---构造函数
---@param self table 实例
---@param name string 角色名称
---@param level number 角色等级
Player.Ctor = function (self, name, level)
	self.name = name
	self.level = level
	self:CreateModel()
end

---创建模型
---@param self table 实例
Player.CreateModel = function (self)
	-- 创建一个方块，表示角色模型
	self.cube = UnityEngine.GameObject.CreatePrimitive(UnityEngine.PrimitiveType.Cube)
	self.cube.transform.position = Vector3.New(0, 0.5, 0)
end

---角色移动
---@param self table 实例
---@param position table 位置
Player.Move = function (self, position)
	self.cube.transform.position = position
end
