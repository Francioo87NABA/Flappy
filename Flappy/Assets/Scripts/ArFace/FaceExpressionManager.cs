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

    public FaceExpressionInstance currentFaceInstance;

    private void OnEnable()
    {
        Singleton = this;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        DebugText.text = mouthOpenValue.ToString();
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
