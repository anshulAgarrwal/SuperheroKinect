using UnityEngine;

public class SpeechReco : MonoBehaviour
{
    private GameObject CurrentOutfit;

    private ManageOutfits ManageOutfits;

    private Snapshot Snapshot;

    private string OutfitPart;

    private void Start()
    {
        ManageOutfits = UnityEngine.Object.FindObjectOfType<ManageOutfits>();
        Snapshot = UnityEngine.Object.FindObjectOfType<Snapshot>();
    }

    public void AnalyzeSpeech(string speech)
    {
        if (speech.ToLower().Contains("arms on"))
        {
            UnityEngine.Debug.Log("Arms on");
            Arms(status: true);
        }
        else if (speech.ToLower().Contains("arms off"))
        {
            UnityEngine.Debug.Log("Arms off");
            Arms(status: false);
        }
        else if (speech.ToLower().Contains("legs on"))
        {
            UnityEngine.Debug.Log("Legs on");
            Legs(status: true);
        }
        else if (speech.ToLower().Contains("legs off"))
        {
            UnityEngine.Debug.Log("Legs off");
            Legs(status: false);
        }
        else if (speech.ToLower().Contains("chest on"))
        {
            UnityEngine.Debug.Log("Chest on");
            Chest(status: true);
        }
        else if (speech.ToLower().Contains("chest off"))
        {
            UnityEngine.Debug.Log("Chest off");
            Chest(status: false);
        }
        else if (speech.ToLower().Contains("helmet on"))
        {
            UnityEngine.Debug.Log("Helmet on");
            Helmet(status: true);
        }
        else if (speech.ToLower().Contains("helmet off"))
        {
            UnityEngine.Debug.Log("Helmet off");
            Helmet(status: false);
        }
        else if (speech.ToLower().Contains("body on"))
        {
            UnityEngine.Debug.Log("Body on");
            Body(status: true);
        }
        else if (speech.ToLower().Contains("body off"))
        {
            UnityEngine.Debug.Log("Body off");
            Body(status: false);
        }
        else if (speech.ToLower().Contains("next"))
        {
            UnityEngine.Debug.Log("Next");
            ManageOutfits.NextOutfit();
        }
        else if (speech.ToLower().Contains("previous"))
        {
            UnityEngine.Debug.Log("Previous");
            ManageOutfits.PreviousOutfit();
        }
        else if (speech.ToLower().Contains("reset"))
        {
            UnityEngine.Debug.Log("Reset");
            Reset(status: true);
        }
        else if (speech.ToLower().Contains("effects"))
        {
            UnityEngine.Debug.Log("Effects");
            Effects();
        }
        else if (speech.ToLower().Contains("weapons"))
        {
            UnityEngine.Debug.Log("Weapons");
            Weapons();
        }
        else if (speech.ToLower().Contains("snapshot"))
        {
            UnityEngine.Debug.Log("Screenshot");
            Screenshot();
        }
        else if (speech.ToLower().Contains("weight"))
        {
            UnityEngine.Debug.Log("Weight");
            Weight();
        }
        else if (speech.ToLower().Contains("all on"))
        {
            UnityEngine.Debug.Log("All On");
            AllOn();
        }
        else if (speech.ToLower().Contains("all off"))
        {
            UnityEngine.Debug.Log("All Off");
            AllOff();
        }
    }

    private void Arms(bool status)
    {
        CurrentOutfit = ManageOutfits.GetCurrentOutfit();
        for (int i = 0; i < CurrentOutfit.transform.childCount; i++)
        {
            OutfitPart = CurrentOutfit.transform.GetChild(i).gameObject.name.ToLower();
            if (OutfitPart.Contains("arms") || OutfitPart.Contains("shoulder") || OutfitPart.Contains("gloves") || OutfitPart.Contains("upperarm") || OutfitPart.Contains("forearm") || OutfitPart.Contains("gauntlets") || OutfitPart.Contains("elbow"))
            {
                UnityEngine.Debug.Log(OutfitPart);
                CurrentOutfit.transform.GetChild(i).gameObject.SetActive(status);
            }
        }
    }

    private void Legs(bool status)
    {
        CurrentOutfit = ManageOutfits.GetCurrentOutfit();
        for (int i = 0; i < CurrentOutfit.transform.childCount; i++)
        {
            OutfitPart = CurrentOutfit.transform.GetChild(i).gameObject.name.ToLower();
            if (OutfitPart.Contains("leg") || OutfitPart.Contains("shin") || OutfitPart.Contains("boot") || OutfitPart.Contains("thigh") || OutfitPart.Contains("knee") || OutfitPart.Contains("pants") || OutfitPart.Contains("knight skirt") || OutfitPart.Contains("belt") || OutfitPart.Contains("chain skirt"))
            {
                UnityEngine.Debug.Log(OutfitPart);
                CurrentOutfit.transform.GetChild(i).gameObject.SetActive(status);
            }
        }
    }

    private void Chest(bool status)
    {
        CurrentOutfit = ManageOutfits.GetCurrentOutfit();
        for (int i = 0; i < CurrentOutfit.transform.childCount; i++)
        {
            OutfitPart = CurrentOutfit.transform.GetChild(i).gameObject.name.ToLower();
            if (OutfitPart.Contains("chest") || OutfitPart.Contains("torso") || OutfitPart.Contains("life") || OutfitPart.Contains("coat") || OutfitPart.Contains("waist") || OutfitPart.Contains("vest") || OutfitPart.Contains("canana") || OutfitPart.Contains("parka") || OutfitPart.Contains("armour top") || OutfitPart.Contains("cape") || OutfitPart.Contains("pouch"))
            {
                UnityEngine.Debug.Log(OutfitPart);
                CurrentOutfit.transform.GetChild(i).gameObject.SetActive(status);
            }
        }
    }

    private void Helmet(bool status)
    {
        CurrentOutfit = ManageOutfits.GetCurrentOutfit();
        for (int i = 0; i < CurrentOutfit.transform.childCount; i++)
        {
            OutfitPart = CurrentOutfit.transform.GetChild(i).gameObject.name.ToLower();
            if (OutfitPart.Contains("helmet") || OutfitPart.Contains("hat") || OutfitPart.Contains("mask") || OutfitPart.Contains("glasses") || OutfitPart.Contains("scarf"))
            {
                UnityEngine.Debug.Log(OutfitPart);
                CurrentOutfit.transform.GetChild(i).gameObject.SetActive(status);
            }
        }
    }

    private void Body(bool status)
    {
        CurrentOutfit = ManageOutfits.GetCurrentOutfit();
        for (int i = 0; i < CurrentOutfit.transform.childCount; i++)
        {
            OutfitPart = CurrentOutfit.transform.GetChild(i).gameObject.name.ToLower();
            if (OutfitPart.Contains("body") || OutfitPart.Contains("codpiece") || OutfitPart.Contains("interior") || OutfitPart.Contains("shirt") || OutfitPart.Contains("leather") || OutfitPart.Contains("tunic") || OutfitPart.Contains("jacket") || OutfitPart.Contains("sweater") || OutfitPart.Contains("suit"))
            {
                UnityEngine.Debug.Log(OutfitPart);
                CurrentOutfit.transform.GetChild(i).gameObject.SetActive(status);
            }
        }
    }

    public void Reset(bool status)
    {
        CurrentOutfit = ManageOutfits.GetCurrentOutfit();
        for (int i = 0; i < CurrentOutfit.transform.childCount; i++)
        {
            CurrentOutfit.transform.GetChild(i).gameObject.SetActive(status);
            OutfitPart = CurrentOutfit.transform.GetChild(i).gameObject.name.ToLower();
            if (OutfitPart.Contains("availableprops") && !ManageOutfits.weapon)
            {
                CurrentOutfit.transform.GetChild(i).gameObject.SetActive(value: false);
            }
        }
    }

    private void Effects()
    {
        ManageOutfits.EffectsOnOff();
    }

    private void Weight()
    {
        ManageOutfits.WeightOnOff();
    }

    private void Weapons()
    {
        ManageOutfits.WeaponsOnOff();
    }

    private void Screenshot()
    {
        Snapshot.StartSnapshot();
    }

    private void AllOn()
    {
        Reset(status: true);
    }

    private void AllOff()
    {
        Reset(status: false);
    }
}
