using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class PlayerPosition : MonoBehaviour
{
    public Transform playerTransform;
    
    private Renderer myRender;


    // Start is called before the first frame update
    void Start()
    {
        myRender = GetComponent<Renderer>();
    }

    // Update is called once per frame
    void Update()
    {
        if (playerTransform != null)
        {
            myRender.material.SetVector("_PlayerPosition", playerTransform.position);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            playerTransform = other.GetComponent<Player>().transform;
        }
    }
}
