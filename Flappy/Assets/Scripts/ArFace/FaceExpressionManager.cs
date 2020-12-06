using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class FaceExpressionManager : MonoBehaviour
{
    public static FaceExpressionManager Singleton;

    public float mouthOpenValue;

    public Text DebugText;
    public Text DebugText2;

    public FaceExpressionInstance currentFaceInstance;

    private void OnEnable()
    {
        Singleton = this;
    }

    // Update is called once per frame
    void Update()
    {
        DebugText.text = mouthOpenValue.ToString();
        
        if (currentFaceInstance != null)
        {
            DebugText2.text = "there is face";
        }
        else
        {
            DebugText2.text = "there is no face";
        }
    }
    
    public void SetStandardFaceData()
    {
        if (currentFaceInstance != null)
        {
            currentFaceInstance.SetStandardFaceData();
        }
    }

    public void SetOpenMouthFaceData()
    {
        if (currentFaceInstance != null)
        {
            currentFaceInstance.SetOpenMouthFaceData();
        }
    }
}
