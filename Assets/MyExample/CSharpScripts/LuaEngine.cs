using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LuaEngine : LuaClient
{
    protected override void LoadLuaFiles()
    {
        luaState.AddSearchPath(Application.dataPath + "/MyExample/LuaScripts");
        OnLoadFinished();
    }
}
