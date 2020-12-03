using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;

public class Player : MonoBehaviour
{

    public int speed;
    

    public float interpolator;
    

    public bool stop;
    

    public Transform pointZero, pointOne;
    
    
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(PlayerBegunRun());
    }

    // Update is called once per frame
    void Update()
    {
        if (!stop)
        {
            transform.position += transform.right * speed * Time.deltaTime;

            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, 
                Mathf.Lerp(pointZero.localPosition.z, pointOne.localPosition.z, interpolator));
        }

        if (GameManager.Singleton.speedIsChanged)
        {
            speed = GameManager.Singleton.playerSpeed;
            GameManager.Singleton.speedIsChanged = false;
        }
    }

    IEnumerator PlayerBegunRun()
    {
        yield return new WaitForSeconds(2f);

        speed = 5;
    }
}
