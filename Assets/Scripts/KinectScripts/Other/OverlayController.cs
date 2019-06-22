using UnityEngine;

public class OverlayController : MonoBehaviour
{
    [Tooltip("Camera used to display the 1st scene background.")]
    public Camera backgroundCamera;

    [Tooltip("Camera used to display the 2nd scene background (users).")]
    public Camera backgroundCamera2;

    [Tooltip("Camera used to display the clothing models from the Kinect point of view.")]
    public Camera foregroundCamera;

    private void Start()
    {
        KinectManager instance = KinectManager.Instance;
        if ((bool)instance && instance.IsInitialized())
        {
            KinectInterop.SensorData sensorData = instance.GetSensorData();
            if (foregroundCamera != null && sensorData != null && sensorData.sensorInterface != null)
            {
                foregroundCamera.transform.position = new Vector3(0f, instance.sensorHeight, 0f);
                foregroundCamera.transform.rotation = Quaternion.Euler(0f - instance.sensorAngle, 0f, 0f);
            }
            if (backgroundCamera != null && sensorData != null && sensorData.sensorInterface != null)
            {
                backgroundCamera.transform.position = new Vector3(0f, instance.sensorHeight, 0f);
                backgroundCamera.transform.rotation = Quaternion.Euler(0f - instance.sensorAngle, 0f, 0f);
            }
            if (backgroundCamera2 != null && sensorData != null && sensorData.sensorInterface != null)
            {
                backgroundCamera2.transform.position = new Vector3(0f, instance.sensorHeight, 0f);
                backgroundCamera2.transform.rotation = Quaternion.Euler(0f - instance.sensorAngle, 0f, 0f);
            }
        }
    }

    private void Update()
    {
        KinectManager instance = KinectManager.Instance;
        if (!instance || !instance.IsInitialized())
        {
            return;
        }
        KinectInterop.SensorData sensorData = instance.GetSensorData();
        if (instance.autoHeightAngle == KinectManager.AutoHeightAngle.AutoUpdate || instance.autoHeightAngle == KinectManager.AutoHeightAngle.AutoUpdateAndShowInfo)
        {
            if (foregroundCamera != null && sensorData != null)
            {
                foregroundCamera.transform.position = new Vector3(0f, instance.sensorHeight, 0f);
                foregroundCamera.transform.rotation = Quaternion.Euler(0f - instance.sensorAngle, 0f, 0f);
            }
            if (backgroundCamera != null && sensorData != null)
            {
                backgroundCamera.transform.position = new Vector3(0f, instance.sensorHeight, 0f);
                backgroundCamera.transform.rotation = Quaternion.Euler(0f - instance.sensorAngle, 0f, 0f);
            }
            if (backgroundCamera2 != null && sensorData != null)
            {
                backgroundCamera2.transform.position = new Vector3(0f, instance.sensorHeight, 0f);
                backgroundCamera2.transform.rotation = Quaternion.Euler(0f - instance.sensorAngle, 0f, 0f);
            }
        }
    }
}
