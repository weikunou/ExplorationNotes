---角色类
Player = Class("Player")

---构造函数
---@param self table 实例
---@param name string 角色名称
---@param level number 角色等级
Player.Ctor = function (self, name, level)
    self.name = name
    self.level = level
    self.speed = 5
    self:CreateModel()

    if not self.handle then
        self.handle = UpdateBeat:CreateListener(self.Update, self)
    end
    UpdateBeat:AddListener(self.handle)
end

---创建模型
---@param self table 实例
Player.CreateModel = function (self)
    -- 创建角色空物体
    self.player = GameObject.New("Player")

    -- 创建一个方块，表示角色模型
    self.cube = GameObject.CreatePrimitive(PrimitiveType.Cube)
    self.cube.transform.parent = self.player.transform

    self.player.transform.position = Vector3.New(0, 0.5, 0)

    self.player:AddComponent(typeof(CapsuleCollider))
    self.player:AddComponent(typeof(Rigidbody))
end

---角色移动
---@param self table 实例
---@param position table 位置
Player.Move = function (self, position)
    self.player.transform.position = position
end

Player.Update = function (self)
    local h = Input.GetAxis("Horizontal")
    local v = Input.GetAxis("Vertical")
    if h ~= 0 or v ~= 0 then
        local move = Vector3.New(h, 0, v) * self.speed * Time.deltaTime
        self.player.transform:Translate(move)
    end
end
