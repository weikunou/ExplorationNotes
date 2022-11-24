using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : Singleton<UIManager>
{
    public Transform MainCanvas { get; set; }

    protected override void Awake()
    {
        base.Awake();
        MainCanvas = transform.Find("MainCanvas");
    }
}
