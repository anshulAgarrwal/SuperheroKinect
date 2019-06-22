using UnityEngine;

public class SplashScreen : MonoBehaviour
{
    public bool auto;

    public GameObject Splashscreen;

    public GameObject WaterMark;

    public int WithoutSplashScreenTime = 5;

    public float showSplashScreenTime = 3f;

    public float currentTime;

    private float startTime;

    private void Start()
    {
        if (auto)
        {
            WaterMark.SetActive(value: true);
        }
    }

    public void resetTime()
    {
        startTime = 0f;
    }

    private void Update()
    {
        if (!auto)
        {
            return;
        }
        startTime += Time.deltaTime;
        if (startTime > (float)WithoutSplashScreenTime)
        {
            if (!Splashscreen.activeSelf)
            {
                Splashscreen.SetActive(value: true);
            }
            if (startTime - showSplashScreenTime > (float)WithoutSplashScreenTime)
            {
                Splashscreen.SetActive(value: false);
                currentTime = startTime;
                resetTime();
            }
        }
    }
}
