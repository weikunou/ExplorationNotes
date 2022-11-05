using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using LuaInterface;

public class LuaControl : MonoBehaviour
{
    LuaState lua = null; // lua 虚拟机
    LuaFunction luaFunc = null; // lua 方法

    void Start()
    {
        new LuaResLoader();

        // 创建并开启 Lua 虚拟机
        lua = new LuaState();
        lua.Start();

        // 向虚拟机绑定 Wrap 文件
        LuaBinder.Bind(lua);
 
        // Lua 工程路径
        string luaPath = Application.dataPath + "/MyExample/LuaScripts";
        lua.AddSearchPath(luaPath);

        // 执行 Main.lua 脚本
        lua.DoFile("LuaMain.lua");

        // 调用 Main.lua 的 Start 方法
        CallFunc("Main.Start", gameObject);
    }

    void Update()
    {
        // 调用 Main.lua 的 Update 方法
        CallFunc("Main.Update", gameObject);
    }

    /// <summary>
    /// 调用 Lua 方法
    /// </summary>
    /// <param name="func">方法名</param>
    /// <param name="obj">游戏对象</param>
    void CallFunc(string func, GameObject obj)
    {
        luaFunc = lua.GetFunction(func);
        luaFunc.Call(obj);
        luaFunc.Dispose();
        luaFunc = null;
    }
}
