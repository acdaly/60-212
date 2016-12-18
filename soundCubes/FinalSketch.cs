using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FinalSketch : MonoBehaviour {

	public GameObject myPrefab;

	public AudioClip One;

	private List<GameObject> unityGameObjects = new List<GameObject>();

	public Material myMaterial;

	//private List<

	void Start () {

		int TOTAL_CUBES = 17;

		float TOTAL_DISTANCE = 2.5f;

		for (int i = 0; i < TOTAL_CUBES; i++) {

			float x = (Random.value - Random.value) * 250.0f;
			float y = 5.0f + Random.value*5.0f;
			float z = (Random.value - Random.value) * 250.0f;

			var newCube = Instantiate (myPrefab, new Vector3 (x, y, z), Quaternion.identity);

			//ADD MATERIAL

			Renderer rend = newCube.GetComponent<Renderer>();
			rend.material = myMaterial;
		

			//ADD POINT LIGHT

			GameObject lightGameObject = new GameObject("The Light");
			Light lightComp = lightGameObject.AddComponent<Light>();
			lightComp.color = Color.Lerp(Color.green, Color.blue, 0.6f);
			lightComp.intensity = 2.0f;
			lightComp.range = 20f;
			lightGameObject.transform.position = new Vector3(x, y, z);

			newCube.GetComponent<soundCubeCS> ().SetSize (2.0f);
			//newCube.GetComponent<cubeScript> ().rotateSpeed = .2f + perc;


			//ADD AUDIO

			AudioSource audioSource = newCube.AddComponent<AudioSource>();
			if (i == 0) {
				audioSource.clip = Resources.Load ("rain-03") as AudioClip;
			}
			if (i == 1) {
				audioSource.clip = Resources.Load ("clairdelune") as AudioClip;
			}
			if (i == 2) {
				audioSource.clip = Resources.Load ("campfire-1") as AudioClip;
			}

			if (i == 3) {
				audioSource.clip = Resources.Load ("sad-machine") as AudioClip;
				audioSource.volume = 0.25f;
			}

			if (i == 4) {
				audioSource.clip = Resources.Load ("night-crickets") as AudioClip;
			}

			if (i == 5) {
				audioSource.clip = Resources.Load ("magia") as AudioClip;
				audioSource.volume = 0.5f;
			}

			if (i == 6) {
				audioSource.clip = Resources.Load ("rods-and-cones") as AudioClip;
			}

			if (i == 7) {
				audioSource.clip = Resources.Load ("laputa") as AudioClip;
			}

			if (i == 8) {
				audioSource.clip = Resources.Load ("ticking") as AudioClip;
			}

			if (i == 9) {
				audioSource.clip = Resources.Load ("sponsor-voices") as AudioClip;
			}



			if (i == 10) {
				audioSource.clip = Resources.Load ("lucy") as AudioClip;
				audioSource.volume = 0.8f;
			}

			if (i == 11) {
				audioSource.clip = Resources.Load ("raceday") as AudioClip;
			}

			if (i == 12) {
				audioSource.clip = Resources.Load ("roll") as AudioClip;
			}

			if (i == 13) {
				audioSource.clip = Resources.Load ("new-mexico") as AudioClip;
				audioSource.volume = 0.7f;
			}
			if (i == 14) {
				audioSource.clip = Resources.Load ("cty") as AudioClip;
			}
			if (i == 15) {
				audioSource.clip = Resources.Load ("emerald-coast-2") as AudioClip;
				audioSource.volume = 0.25f;
			}

			if (i == 16) {
				audioSource.clip = Resources.Load ("japan-jenga") as AudioClip;
			}
			/*
			if (i == 17) {
				audioSource.clip = Resources.Load ("rain-03") as AudioClip;
			}
			if (i == 18) {
				audioSource.clip = Resources.Load ("rain-03") as AudioClip;
			}
			if (i == 19) {
				audioSource.clip = Resources.Load ("rain-03") as AudioClip;
			}
			if (i == 20) {
				audioSource.clip = Resources.Load ("rain-03") as AudioClip;
			}
			*/
			audioSource.spatialBlend = 1.0f;
			audioSource.maxDistance = 5f;
			audioSource.loop = true;
			audioSource.dopplerLevel = 0.0f;
			audioSource.Play ();

		}

	}
	
}
