using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class spawnMore : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            SpawnManager.Singleton.more = true;
        }
    }
}
