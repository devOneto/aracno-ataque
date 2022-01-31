using CodeMonkey.Utils;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Testing : MonoBehaviour
{
    private Grid<int> grid;
    private void Start()
    {
        grid = new Grid<int>(3, 3, 10f, new Vector3(0,20));
    }
    private void Update()
    {
        Vector3 mousePosition;
        if (Input.GetMouseButtonDown(0))
        {
            mousePosition = UtilsClass.GetMouseWorldPosition();
            grid.SetValue(mousePosition,56);
        }
        if (Input.GetMouseButtonDown(1))
        {
            mousePosition = UtilsClass.GetMouseWorldPosition();
            grid.GetValue(mousePosition);
        }
    }

}
