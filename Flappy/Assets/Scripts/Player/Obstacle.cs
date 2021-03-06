﻿using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Object = System.Object;

public class Obstacle : MonoBehaviour
{
    private int stop = 0;

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            Player player = other.GetComponent<Player>();
            player.speed = stop;
            player.stop = true;
            SpawnManager.Singleton.end = true;
        }

        if (other.CompareTag("Aratro"))
        {
            Destroy(gameObject);
        }
    }
}
