using UnityEngine;

public class HandTargets : MonoBehaviour
{
    public GameObject[] HandTarget;

    public bool on = true;

    private void Start()
    {
        HandTargetOn(on);
    }

    private void HandTargetOn(bool onOff)
    {
        for (int i = 0; i < HandTarget.Length; i++)
        {
            HandTarget[i].SetActive(onOff);
        }
    }
}
