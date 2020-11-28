using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{

    public int rightSpeed;

    public float interpolator;

    public Transform pointZero, pointOne;

    public Rigidbody myRigidbody;
    
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(PlayerBegunRun());
    }

    // Update is called once per frame
    void Update()
    {
        transform.position += transform.right * rightSpeed * Time.deltaTime;
        
        
        //myRigidbody.velocity = transform.right * rightSpeed * Time.deltaTime;

        //transform.position = Vector3.Lerp(pointZero.position, pointOne.position, interpolator);
        
        transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, 
            Mathf.Lerp(pointZero.localPosition.z, pointOne.localPosition.z, interpolator));
    }

    IEnumerator PlayerBegunRun()
    {
        yield return new WaitForSeconds(1f);

        rightSpeed = 7;
    }
}
