//using Assets.MaterializeFX.Scripts;
using MCS;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class ManageOutfits : MonoBehaviour
{
    public GameObject OutfitSelectionPrefab;

    public List<Outfit> Outfit;

    public List<GameObject> Effects;

    public GameObject EffectsOn;

    public GameObject CastEffect;

    public GameObject CastEffectOn;

    public GameObject WeaponsOn;

    public GameObject WeightOn;

    public GameObject WeaponsButton;

    private GameObject CurrentEffect;

    //private MfxController MfxController;

    private MCSCharacterManager OutfitMorph;

    private KinectManager KinectManager;

    private SpeechReco SpeechReco;

    private GameObject CardPrefab;

    private Transform OutfitTransform;

    private int index;

    private float size;

    private bool heavy;

    public bool weapon;

    public bool casteffect;

    private bool effects;

    private GameObject CurrentOutfit;

    private void Awake()
    {
        UnityEngine.Debug.Log("AWAKE - SECOND");
        EffectsOn.SetActive(value: false);
        KinectManager = UnityEngine.Object.FindObjectOfType<KinectManager>();
        for (int i = 0; i < Outfit.Count; i++)
        {
            KinectManager.avatarControllers.Add(Outfit[i].OutfitModel.GetComponent<AvatarController>());
        }
    }

    public GameObject GetCurrentOutfit()
    {
        CurrentOutfit = Outfit[index].OutfitModel;
        return CurrentOutfit;
    }

    private void Start()
    {
        UnityEngine.Debug.Log("START - FIRST");
        EffectsOn.SetActive(value: false);
        WeaponsOn.SetActive(value: false);
        //MfxController = UnityEngine.Object.FindObjectOfType<MfxController>();
        SpeechReco = UnityEngine.Object.FindObjectOfType<SpeechReco>();
        for (int i = 0; i < Outfit.Count; i++)
        {
            if (Outfit[i].AvailableProps != null)
            {
                Outfit[i].AvailableProps.SetActive(value: false);
            }
        }
        for (int j = 0; j < Outfit.Count; j++)
        {
            Outfit[j].OutfitModel.SetActive(value: true);
            Outfit[j].OutfitModel.SetActive(value: false);
        }
        OutfitSelectionPrefab.SetActive(value: false);
        GenerateOutfits();
        LoadInitialAvatar();
    }

    public void WeightOnOff()
    {
        heavy = !heavy;
        if (heavy)
        {
            WeightOn.SetActive(value: true);
            AdaptWeight();
        }
        else
        {
            WeightOn.SetActive(value: false);
            AdaptWeight();
        }
    }

    private void AdaptWeight()
    {
        OutfitMorph = Outfit[index].OutfitModel.gameObject.GetComponent<MCSCharacterManager>();
        if (heavy)
        {
            OutfitMorph.SetBlendshapeValue("FBMHeavy", 100f);
        }
        else
        {
            OutfitMorph.SetBlendshapeValue("FBMHeavy", 0f);
        }
    }

    public void CastEffectOnOff()
    {
        casteffect = !casteffect;
        if (casteffect)
        {
            CastEffectOn.SetActive(value: true);
            CastEffect.SetActive(value: true);
        }
        else if (!casteffect)
        {
            CastEffectOn.SetActive(value: false);
            CastEffect.SetActive(value: false);
        }
    }

    public void WeaponsOnOff()
    {
        weapon = !weapon;
        if (weapon)
        {
            WeaponsOn.SetActive(value: true);
            if (Outfit[index].AvailableProps != null)
            {
                Outfit[index].AvailableProps.SetActive(value: true);
            }
        }
        else if (!weapon)
        {
            WeaponsOn.SetActive(value: false);
            if (Outfit[index].AvailableProps != null)
            {
                Outfit[index].AvailableProps.SetActive(value: false);
            }
        }
    }

    private void CheckWeapon()
    {
        if (Outfit[index].AvailableProps != null)
        {
            UnityEngine.Debug.Log("Available Props ON");
            WeaponsButton.SetActive(value: true);
            if (weapon)
            {
                Outfit[index].AvailableProps.SetActive(value: true);
            }
        }
        else
        {
            UnityEngine.Debug.Log("Available Props OFF");
            WeaponsButton.SetActive(value: false);
        }
    }

    private void LoadInitialAvatar()
    {
        Outfit[index].OutfitModel.SetActive(value: true);
        Outfit[index].OutfitModel.GetComponent<AvatarScaler>().enabled = true;
      //  MfxController.TargetObject = Outfit[index].OutfitModel;
      //  MfxController.MaskOffsetDirection = MaskOffsetDirection.Forward;
        CheckWeapon();
    }

    private void GenerateOutfits()
    {
        for (int i = 0; i < Outfit.Count; i++)
        {
            if (Outfit[i].OutfitImage != null)
            {
                OutfitSelectionPrefab.transform.GetChild(0).GetComponent<Image>().sprite = Outfit[i].OutfitImage;
                OutfitSelectionPrefab.transform.GetChild(1).GetComponent<Text>().text = Outfit[i].OutfitImage.name;
            }
            else
            {
                UnityEngine.Debug.Log("You need to add Outfit Image. Outfit Index: " + i);
            }
            CardPrefab = UnityEngine.Object.Instantiate(OutfitSelectionPrefab, OutfitSelectionPrefab.transform.parent.transform);
            CardPrefab.name = i.ToString();
            CardPrefab.SetActive(value: true);
        }
    }

    private IEnumerator TransformOutfitForward(int index, bool status)
    {
        yield return new WaitForSeconds(0.75f);
        Outfit[index].OutfitModel.SetActive(status);
    }

    private IEnumerator TransformOutfitBackward(int index)
    {
        yield return new WaitForSeconds(0.75f);
        Outfit[index].OutfitModel.transform.localScale = new Vector3(0f, 0f, 0f);
        Outfit[index].OutfitModel.SetActive(value: true);
      //  MfxController.TargetObject = Outfit[index].OutfitModel;
      //  MfxController.MaskOffsetCurve = AnimationCurve.EaseInOut(0f, 1.5f, 0.5f, -0.4f);
      //  MfxController.MaskOffsetDirection = MaskOffsetDirection.Forward;
       // MfxController.ReActivate();
        StartCoroutine(SizeBack());
    }

    private IEnumerator SizeBack()
    {
        yield return new WaitForSeconds(0.15f);
        Outfit[index].OutfitModel.transform.localScale = new Vector3(1f, 1f, 1f);
        Outfit[index].OutfitModel.GetComponent<AvatarScaler>().enabled = true;
        AdaptWeight();
        if (effects)
        {
            StartCoroutine(Effect());
        }
    }

    public void EffectsOnOff()
    {
        effects = !effects;
        if (effects)
        {
            EffectsOn.SetActive(value: true);
            StartCoroutine(Effect());
            return;
        }
        EffectsOn.SetActive(value: false);
        if (CurrentEffect != null)
        {
            UnityEngine.Object.DestroyImmediate(CurrentEffect);
        }
        UnityEngine.Debug.Log("Effects are off");
    }

    private IEnumerator Effect()
    {
        yield return new WaitForSeconds(0.85f);
        int Rand = UnityEngine.Random.Range(0, Effects.Count);
        if (CurrentEffect != null)
        {
            UnityEngine.Object.DestroyImmediate(CurrentEffect);
        }
        CurrentEffect = UnityEngine.Object.Instantiate(Effects[Rand], Outfit[index].OutfitModel.transform);
       // CurrentEffect.GetComponent<PSMeshRendererUpdater>().MeshObject = Outfit[index].OutfitModel;
       // CurrentEffect.GetComponent<PSMeshRendererUpdater>().UpdateMeshEffect(Outfit[index].OutfitModel);
        UnityEngine.Debug.Log("Effect generated: " + CurrentEffect.name);
    }

    public void NextOutfit()
    {
        if (CurrentEffect != null)
        {
            UnityEngine.Object.DestroyImmediate(CurrentEffect);
        }
        OutfitTransform = Outfit[index].OutfitModel.transform;
       // MfxController.TargetObject = Outfit[index].OutfitModel;
      //  MfxController.MaskOffsetCurve = AnimationCurve.EaseInOut(0f, 0f, 0.5f, 1.5f);
     //   MfxController.MaskOffsetDirection = MaskOffsetDirection.Forward;
       // MfxController.ReActivate();
        StartCoroutine(TransformOutfitForward(index, status: false));
        index++;
        if (index == Outfit.Count)
        {
            index = 0;
        }
        Outfit[index].OutfitModel.transform.position = OutfitTransform.position;
        Outfit[index].OutfitModel.transform.eulerAngles = OutfitTransform.eulerAngles;
        StartCoroutine(TransformOutfitBackward(index));
    }

    public void PreviousOutfit()
    {
        if (CurrentEffect != null)
        {
            UnityEngine.Object.Destroy(CurrentEffect);
        }
        OutfitTransform = Outfit[index].OutfitModel.transform;
    //    MfxController.TargetObject = Outfit[index].OutfitModel;
     //   MfxController.MaskOffsetCurve = AnimationCurve.EaseInOut(0f, 0f, 0.5f, 1.5f);
    //    MfxController.MaskOffsetDirection = MaskOffsetDirection.Forward;
      //  MfxController.ReActivate();
        StartCoroutine(TransformOutfitForward(index, status: false));
        index--;
        if (index < 0)
        {
            index = Outfit.Count - 1;
        }
        Outfit[index].OutfitModel.transform.position = OutfitTransform.position;
        Outfit[index].OutfitModel.transform.eulerAngles = OutfitTransform.eulerAngles;
        StartCoroutine(TransformOutfitBackward(index));
    }

    public void SelectOutfit(int selectionIndex)
    {
        if (CurrentEffect != null)
        {
            UnityEngine.Object.DestroyImmediate(CurrentEffect);
        }
        OutfitTransform = Outfit[index].OutfitModel.transform;
      //  MfxController.TargetObject = Outfit[index].OutfitModel;
       // MfxController.MaskOffsetCurve = AnimationCurve.EaseInOut(0f, 0f, 0.5f, 1.5f);
       // MfxController.MaskOffsetDirection = MaskOffsetDirection.Forward;
       // MfxController.ReActivate();
        StartCoroutine(TransformOutfitForward(index, status: false));
        index = selectionIndex;
        Outfit[index].OutfitModel.transform.position = OutfitTransform.position;
        Outfit[index].OutfitModel.transform.eulerAngles = OutfitTransform.eulerAngles;
        StartCoroutine(TransformOutfitBackward(index));
    }

    private void CreateBodyMasking(GameObject Outfit)
    {
        GameObject gameObject = Outfit.transform.GetChild(0).gameObject;
        gameObject.SetActive(value: true);
        Renderer[] componentsInChildren = Outfit.GetComponentsInChildren<Renderer>();
        UnityEngine.Debug.Log(Outfit.name);
        Renderer[] array = componentsInChildren;
        foreach (Renderer renderer in array)
        {
            renderer.material.renderQueue = 3020;
        }
    }
}
