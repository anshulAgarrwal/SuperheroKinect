using System;
using System.Collections;
using System.IO;
using UnityEngine;
using UnityEngine.UI;

public class Snapshot : MonoBehaviour
{
    public GameObject[] HideUI;

    public Image TakenScreenshot;

    public GameObject SnapshotCheckmark;

    private Texture2D ImageToSave;

    private string fileExtension = ".png";

    private string fileName = string.Empty;

    private void Start()
    {
        TakenScreenshot.transform.parent.transform.parent.gameObject.SetActive(value: false);
    }

    public void StartSnapshot()
    {
        SnapshotCheckmark.SetActive(value: true);
        StartCoroutine(Screenshot());
    }

    private IEnumerator Screenshot()
    {
        yield return new WaitForSeconds(2f);
        for (int i = 0; i < HideUI.Length; i++)
        {
            if (HideUI[i] != null)
            {
                HideUI[i].SetActive(value: false);
            }
        }
        StartCoroutine(snapshot());
    }

    private IEnumerator snapshot()
    {
        yield return new WaitForEndOfFrame();
        int width = Screen.width;
        int height = Screen.height;
        ImageToSave = new Texture2D(width, height, TextureFormat.RGB24, mipChain: false);
        ImageToSave.ReadPixels(new Rect(0f, 0f, width, height), 0, 0);
        ImageToSave.Apply();
        TakenScreenshot.sprite = Sprite.Create(ImageToSave, new Rect(0f, 0f, Screen.width, Screen.height), new Vector2(0.5f, 0.5f));
        byte[] bytes = ImageToSave.EncodeToPNG();
        fileName = DateTime.Now.ToString("s").Replace("-", string.Empty).Replace("-", string.Empty)
            .Replace(":", string.Empty)
            .Replace(":", string.Empty);
        UnityEngine.Debug.Log(fileName);
        string path = Application.dataPath + "/Screenshots/" + fileName + fileExtension;
        File.WriteAllBytes(path, bytes);
        UnityEngine.Debug.Log(path);
        for (int i = 0; i < HideUI.Length; i++)
        {
            if (HideUI[i] != null)
            {
                HideUI[i].SetActive(value: true);
            }
        }
        TakenScreenshot.transform.parent.transform.parent.gameObject.SetActive(value: true);
        StartCoroutine(Off());
        SnapshotCheckmark.SetActive(value: false);
    }

    private IEnumerator Off()
    {
        yield return new WaitForSeconds(4f);
        TakenScreenshot.transform.parent.transform.parent.gameObject.SetActive(value: false);
    }
}
