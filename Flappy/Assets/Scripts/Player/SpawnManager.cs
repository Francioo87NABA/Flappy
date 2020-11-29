using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SpawnManager : MonoBehaviour
{
    public static SpawnManager Singleton;
    
    public GameObject zolla;
    public Transform zollaContainer;

    public Vector3 instantiationPoint;
    
    public float unità;
    public float nuovaMisura;

    public bool more;
    public bool end;

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
        if (more)
        {
            instantiationPoint = new Vector3(transform.localPosition.x + nuovaMisura, transform.localPosition.y + 0.68f, transform.localPosition.z);
            Instantiate(zolla, instantiationPoint, Quaternion.identity, zollaContainer);
            nuovaMisura = nuovaMisura + unità;
            more = false;
        }
    }

    
}
