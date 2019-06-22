using UnityEngine;

public class HandTracker : MonoBehaviour
{
    public GameObject handCursor;

    [Tooltip("Index of the player, tracked by this component. 0 means the 1st player, 1 - the 2nd one, 2 - the 3rd one, etc.")]
    public int playerIndex;

    [Tooltip("Whether the player's left hand should be tracked, or the right hand.")]
    public bool isLeftHanded;

    [Tooltip("Hand-cursor texture for the hand-grip state.")]
    public Texture gripHandTexture;

    [Tooltip("Hand-cursor texture for the hand-release state.")]
    public Texture releaseHandTexture;

    [Tooltip("Hand-cursor texture for the non-tracked state.")]
    public Texture normalHandTexture;

    [Tooltip("Smooth factor for cursor movement.")]
    public float smoothFactor = 10f;

    private Vector2 cursorPos = Vector2.zero;

    private InteractionManager.HandEventType lastHandEvent;

    public Vector2 GetCursorPos()
    {
        return cursorPos;
    }

    public InteractionManager.HandEventType GetLastHandEvent()
    {
        return lastHandEvent;
    }

    private void Update()
    {
        KinectManager instance = KinectManager.Instance;
        if (!instance || !instance.IsInitialized())
        {
            return;
        }
        int joint = isLeftHanded ? 7 : 11;
        if (!instance.IsUserDetected(playerIndex))
        {
            return;
        }
        long userIdByIndex = instance.GetUserIdByIndex(playerIndex);
        if (!instance.IsJointTracked(userIdByIndex, joint))
        {
            return;
        }
        Vector3 jointKinectPosition = instance.GetJointKinectPosition(userIdByIndex, joint);
        if (!(jointKinectPosition != Vector3.zero))
        {
            return;
        }
        Vector2 vector = instance.MapSpacePointToDepthCoords(jointKinectPosition);
        ushort depthForPixel = instance.GetDepthForPixel((int)vector.x, (int)vector.y);
        if (!(vector != Vector2.zero) || depthForPixel <= 0)
        {
            return;
        }
        Vector2 vector2 = instance.MapDepthPointToColorCoords(vector, depthForPixel);
        if (!float.IsInfinity(vector2.x) && !float.IsInfinity(vector2.y))
        {
            float num = instance.GetColorImageWidth();
            float num2 = 0f;
            PortraitBackground instance2 = PortraitBackground.Instance;
            if ((bool)instance2 && instance2.enabled)
            {
                num = instance.GetColorImageHeight() * instance.GetColorImageHeight() / instance.GetColorImageWidth();
                num2 = ((float)instance.GetColorImageWidth() - num) / 2f;
            }
            float x = (vector2.x - num2) / num;
            float num3 = vector2.y / (float)instance.GetColorImageHeight();
            cursorPos = Vector2.Lerp(cursorPos, new Vector2(x, 1f - num3), smoothFactor * Time.deltaTime);
        }
    }

    private void OnGUI()
    {
        InteractionManager instance = InteractionManager.Instance;
        Texture x = null;
        if ((bool)instance && instance.IsInteractionInited())
        {
            if (isLeftHanded)
            {
                lastHandEvent = instance.GetLastLeftHandEvent();
                if (lastHandEvent == InteractionManager.HandEventType.Grip)
                {
                    x = gripHandTexture;
                }
                else if (lastHandEvent == InteractionManager.HandEventType.Release)
                {
                    x = releaseHandTexture;
                }
            }
            else
            {
                lastHandEvent = instance.GetLastRightHandEvent();
                if (lastHandEvent == InteractionManager.HandEventType.Grip)
                {
                    x = gripHandTexture;
                }
                else if (lastHandEvent == InteractionManager.HandEventType.Release)
                {
                    x = releaseHandTexture;
                }
            }
        }
        if (x == null)
        {
            x = normalHandTexture;
        }
        if (cursorPos != Vector2.zero && x != null)
        {
            Vector3 vector = new Vector3(cursorPos.x * (float)Screen.width, cursorPos.y * (float)Screen.height, 0f);
            handCursor.transform.position = vector;
            Vector3.Lerp(handCursor.transform.position, vector, 2f * Time.deltaTime);
        }
    }
}
