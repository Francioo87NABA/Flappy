using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class FaceExpressionInstance : MonoBehaviour
{
    public ARFace myFace;

    public Transform maxInstanceDebug;

    private Vector3[] standardFaceVertexPositions;
    private Vector3[] openMouthFaceVertexPositions;
    
    // Start is called before the first frame update
    void Start()
    {
        FaceExpressionManager.Singleton.currentFaceInstance = this;
    }

    public void SetStandardFaceData()
    {
        standardFaceVertexPositions = myFace.vertices.ToArray();
    }

    public void SetOpenMouthFaceData()
    {
        openMouthFaceVertexPositions = myFace.vertices.ToArray();
    }
    
    // Update is called once per frame
    void Update()
    {
        if (FaceExpressionManager.Singleton != null)
        {
            FaceExpressionManager.Singleton.mouthOpenValue =
                Mathf.Clamp01(Vector3.Distance(standardFaceVertexPositions[17], myFace.vertices[17]) / 0.023f);
        }
    }

    void InterestingVertexDebug()
    {
        if (FaceExpressionManager.Singleton != null && standardFaceVertexPositions.Length != 0 && openMouthFaceVertexPositions.Length != 0)
        {
            int interestingVertex = 0;
            float interestingVertexMaxDistance = 0;

            for (int i = 0; i < standardFaceVertexPositions.Length; i++)
            {
                float currentDistance = Vector3.Distance(standardFaceVertexPositions[i], openMouthFaceVertexPositions[i]);

                if (currentDistance > interestingVertexMaxDistance)
                {
                    interestingVertex = i;
                    interestingVertexMaxDistance = currentDistance;
                }
            }

            maxInstanceDebug.localPosition = myFace.vertices[interestingVertex];
            FaceExpressionManager.Singleton.DebugText.text = interestingVertex.ToString() + " " + interestingVertexMaxDistance.ToString();
        }
    }
}
