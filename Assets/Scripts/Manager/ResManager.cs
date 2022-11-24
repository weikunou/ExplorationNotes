using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ResManager : Singleton<ResManager>
{
    private AssetBundle mainAB = null;
    private AssetBundleManifest manifest = null;
    private Dictionary<string, AssetBundle> abDic = new Dictionary<string, AssetBundle>();
    private string PathUrl { get { return Application.streamingAssetsPath + "/"; } }
    private string MainABName { get { return "Android"; } }

    public void LoadAB(string abName)
    {
        if (mainAB == null)
        {
            mainAB = AssetBundle.LoadFromFile(PathUrl + MainABName);
            manifest = mainAB.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        }
        AssetBundle ab = null;
        string[] strs = manifest.GetAllDependencies(abName);
        for (int i = 0; i < strs.Length; i++)
        {
            if (!abDic.ContainsKey(strs[i]))
            {
                ab = AssetBundle.LoadFromFile(PathUrl + strs[i]);
                abDic.Add(strs[i], ab);
            }
        }
        if (!abDic.ContainsKey(abName))
        {
            ab = AssetBundle.LoadFromFile(PathUrl + abName);
            abDic.Add(abName, ab);
        }
    }

    public T LoadRes<T>(string abName, string resName) where T : Object
    {
        LoadAB(abName);
        return abDic[abName].LoadAsset<T>(resName);
    }

    public GameObject LoadGameObject(string abName, string resName)
    {
        return LoadRes<GameObject>(abName, resName);
    }

    public void Unload(string abName)
    {
        if (abDic.ContainsKey(abName))
        {
            abDic[abName].Unload(false);
            abDic.Remove(abName);
        }
    }

    public void ClearAB()
    {
        AssetBundle.UnloadAllAssetBundles(false);
        abDic.Clear();
        mainAB = null;
        manifest = null;
    }
}
