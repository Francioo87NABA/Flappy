using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{
    public static GameManager Singleton;
    
    public int playerSpeed = 4;

    public bool speedIsChanged;

    public Text UIScore;
    private int score;
    
    
    private void OnEnable()
    {
        Singleton = this;
    }

    public void UpdateScore()
    {
        score++;
        UIScore.text = "Score : " + score;
    }
}
