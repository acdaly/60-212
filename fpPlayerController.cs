using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//https://www.youtube.com/watch?v=blO039OzUZc

public class fpPlayerController : MonoBehaviour {

	public float speed = 10.0f;
	private bool visibleMouse = false;

	void Start () {
		Cursor.lockState = CursorLockMode.Locked;
	}

	// Update is called once per frame
	void Update () {
		float translation = Input.GetAxis ("Vertical") * speed;
		float straffe = Input.GetAxis ("Horizontal") * speed;
		translation *= Time.deltaTime;
		straffe *= Time.deltaTime;

		transform.Translate (straffe, 0, translation);

		if (Input.GetKeyDown ("escape")) 
			//Cursor.lockState = CursorLockMode.None;
			if (visibleMouse == false)
				visibleMouse = true;
			else if (visibleMouse == true)
				visibleMouse = false;


		Cursor.visible = visibleMouse;
		Debug.Log(visibleMouse);
		
	}
}