---定义类
---@param className string 类名
---@param super table 父类
---@return table 类
function Class(className, super)
    -- 构建类
    local clazz = { __cname = className, super = super }
    if super then
        -- 设置类的元表，类中没有的元素会到父类中查找
        setmetatable(clazz, { __index = super })
    end
    -- 定义创建对象的方法
    clazz.New = function (...)
        -- 构建对象
        local instance = {}
        -- 设置对象的元表，对象可以调用当前类生命的方法
        setmetatable(instance, { __index = clazz })
        if clazz.Ctor then
            -- 调用构造函数
            clazz.Ctor(instance, ...)
        end
        return instance
    end
    return clazz
end
