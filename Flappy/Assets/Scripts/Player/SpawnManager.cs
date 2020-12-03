using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Random = System.Random;

public class SpawnManager : MonoBehaviour
{
    public static SpawnManager Singleton;
    
    public GameObject zolla;
    public GameObject[] rocks;
    public Transform zollaContainer;
    public Transform obstacleContainer;

    public Vector3 zollaInstantiationPoint;
    private Vector3 ObstacleInstantiationpoint;
    
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
            zollaInstantiationPoint = new Vector3(transform.localPosition.x + nuovaMisura, transform.localPosition.y + 0.68f, transform.localPosition.z);
            Instantiate(zolla, zollaInstantiationPoint, Quaternion.identity, zollaContainer);
            nuovaMisura = nuovaMisura + unità;

            int random = 0;
            random = UnityEngine.Random.Range(0, 8);
            ObstacleInstantiationpoint = new Vector3(transform.localPosition.x + nuovaMisura + UnityEngine.Random.Range(2f, -2f), 
                transform.localPosition.y + 1,transform.localPosition.z + UnityEngine.Random.Range(3.8f, -3.8f));
            int randomRotation = 0;
            randomRotation = UnityEngine.Random.Range(50, -50);
            GameObject roccia = Instantiate(rocks[random], ObstacleInstantiationpoint, Quaternion.Euler(0, randomRotation, 0), obstacleContainer);
            float randomScale = 0;
            randomScale = UnityEngine.Random.Range(0.9f, 1.4f);
            roccia.transform.localScale = new Vector3(randomScale, randomScale, randomScale);
            more = false;
        }
    }
}
