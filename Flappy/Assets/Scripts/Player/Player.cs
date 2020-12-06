using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UIElements;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Player : MonoBehaviour
{

    public int speed;
    

    public float interpolator;
    

    public bool stop;
    

    public Transform pointZero, pointOne;

    public Text gameOver;
    
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (!stop)
        {
            transform.position += transform.right * speed * Time.deltaTime;

            interpolator = FaceExpressionManager.Singleton.mouthOpenValue;

            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, 
                Mathf.Lerp(pointZero.localPosition.z, pointOne.localPosition.z, interpolator));
        }

        if (GameManager.Singleton.speedIsChanged)
        {
            speed = GameManager.Singleton.playerSpeed;
            GameManager.Singleton.speedIsChanged = false;
        }

        if (stop)
        {
            StartCoroutine(GameOver());
        }
    }

    public void parti ()
    {
        speed = 4;
    }

    IEnumerator GameOver()
    {
        yield return new WaitForSeconds(0.5f);
        
        gameOver.gameObject.SetActive(true);
        
        yield return new WaitForSeconds(3f);

        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }
}
