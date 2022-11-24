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
    self.jumpSpeed = 100
    self.isGround = true
    self:CreateModel()
    self:RegisterEvent()
end

---注册事件
---@param self table 实例
Player.RegisterEvent = function (self)
    if not self.handleUpdate then
        self.handleUpdate = UpdateBeat:CreateListener(self.Update, self)
    end
    UpdateBeat:AddListener(self.handleUpdate)
    if not self.handleFixedUpdate then
        self.handleFixedUpdate = FixedUpdateBeat:CreateListener(self.FixedUpdate, self)
    end
    UpdateBeat:AddListener(self.handleFixedUpdate)
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
    self.rigidbody = self.player:AddComponent(typeof(Rigidbody))
    self.rigidbody.freezeRotation = true
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
        local move = Vector3.New(h, 0, v) * self.speed
        self.currentMove = move
        self.isMove = true
    else
        self.isMove = false
    end

    self.isJump = Input.GetButton("Jump")

    if self.rigidbody.velocity.y == 0 then
        self.isGround = true
    else
        self.isGround = false
    end
end

Player.FixedUpdate = function (self)
    if self.isMove then
        self.rigidbody.velocity = Vector3.New(self.currentMove.x, self.rigidbody.velocity.y, self.currentMove.z)
    end

    if self.isGround and self.isJump then
        self.rigidbody:AddForce(self.player.transform.up * self.jumpSpeed)
    end
end