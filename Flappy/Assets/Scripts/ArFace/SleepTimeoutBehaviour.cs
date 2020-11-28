using System;
using UnityEngine;

public class SleepTimeoutBehaviour : MonoBehaviour
{
    void Start()
    {
        Screen.sleepTimeout = SleepTimeout.NeverSleep;
    }

    private void OnApplicationPause(bool pause)
    {
        if (!pause)
        {
            Screen.sleepTimeout = SleepTimeout.NeverSleep;
        }
    }
}
