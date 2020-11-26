using UnityEngine;

public class SleepTimeoutBehaviour : MonoBehaviour
{
    void Start()
    {
        Screen.sleepTimeout = SleepTimeout.NeverSleep;
    }
}
