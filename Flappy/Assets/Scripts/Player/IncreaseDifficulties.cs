using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IncreaseDifficulties : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            GameManager.Singleton.playerSpeed++;
            GameManager.Singleton.speedIsChanged = true;

        }
    }
}
