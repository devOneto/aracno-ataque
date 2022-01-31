using CodeMonkey.Utils;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Testing : MonoBehaviour
{
    private Grid<GridObject> grid;
    private void Start()
    {
        grid = new Grid<GridObject>(10, 10, 10f, new Vector3(-50,-50), () => new GridObject());
    }
    private void Update()
    {
        Vector3 mousePosition;
        if (Input.GetMouseButtonDown(0))
        {
            mousePosition = UtilsClass.GetMouseWorldPosition();
            //grid.SetValue(mousePosition,true);
        }
        if (Input.GetMouseButtonDown(1))
        {
            mousePosition = UtilsClass.GetMouseWorldPosition();
            grid.GetGridObject(mousePosition);
            Debug.Log(mousePosition);
            //https://youtu.be/8jrAWtI8RXg?list=PLzDRvYVwl53uhO8yhqxcyjDImRjO9W722&t=445
        }
    }

}

class GridObject
{
    public int value;
    public void addValue(int addValue) 
    {
        this.value += addValue;
    }
}