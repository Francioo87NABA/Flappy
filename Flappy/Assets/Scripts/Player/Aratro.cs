using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Aratro : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Aratro"))
        {
            Destroy(gameObject);
        }
    }
}
