using UnityEngine;

[RequireComponent(typeof(AudioSource))]
public class BackgroundMusic : MonoBehaviour
{
    public AudioClip[] clips;

    private AudioSource music;

    private int i;

    private void Start()
    {
        music = GetComponent<AudioSource>();
        i = UnityEngine.Random.Range(0, clips.Length);
        music.clip = clips[i];
        music.Play();
    }

    private void Update()
    {
        if (!music.isPlaying)
        {
            i++;
            if (i < clips.Length)
            {
                music.clip = clips[i];
                music.Play();
            }
            else
            {
                i = 0;
            }
        }
    }
}
