using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for CtrlBrands
/// </summary>
[DataObject]
public class CtrlColors
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<Color> GetAllColors()
    {
        List<Color> brands = new List<Color>();
        ColorDAO dao = new ColorDAO();
        brands = dao.GetAllColors();
        return brands;
    }

    [DataObjectMethod(DataObjectMethodType.Insert, false)]
    public void InsertColor(string name, string color)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            color = color.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar el Color");
        }

        if (!ValidateHexColor(color))
        {
            throw new Exception("No es posible registrar el Color, el valor no es válido");
        }

        ColorDAO dao = new ColorDAO();
        List<Color> colors = GetAllColors();
        if (colors.FindAll(b => b.name.ToUpperInvariant().Equals(name.ToUpperInvariant())).Count > 0)
        {
            throw new Exception("Ya existe un Color con este nombre");
        }

        Color newColor = new Color();
        newColor.name = name;
        newColor.color = color;
        int result = dao.CreateColor(newColor);
        if (result < 1)
        {
            throw new Exception("No es posible registrar el Color");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Update, false)]
    public void UpdateColor(int id, string name, string color)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            color = color.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible actualizar el Color");
        }

        if (!ValidateHexColor(color))
        {
            throw new Exception("No es posible actualizar el Color, el valor no es válido");
        }

        ColorDAO dao = new ColorDAO();
        List<Color> colors = GetAllColors();
        Color colorFound = colors.Find(b => b.id.Equals(id));
        if (colorFound != null)
        {
            if (colors.FindAll(b => (b.name.Equals(name.ToUpperInvariant())) && (b.id != id)).Count > 0)
            {
                throw new Exception("Ya existe un Color con este nombre");
            }

            colorFound.name = name;
            colorFound.color = color;
            int result = dao.UpdateColor(colorFound);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar el Color");
            }
        }
        else
        {
            throw new Exception("El id del Color a actualizar no es válido");
        }
    }


    [DataObjectMethod(DataObjectMethodType.Delete, false)]
    public void DeleteColor(int id)
    {
        ColorDAO dao = new ColorDAO();
        Color deleteColor = dao.GetColor(id);
        if (deleteColor != null)
        {
            int result = dao.DeleteColor(id);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar el Color, por favor verificar que no existen Productos asociados al Color");
            }
        }
        else
        {
            throw new Exception("El id del Color a eliminar no es válido");
        }
    }

    private bool ValidateHexColor(string hexColor)
    {
        if (Regex.Match(hexColor, "^#(?:[0-9a-fA-F]{3}){1,2}$").Success)
        {
            return true;
        }

        System.Drawing.Color result = System.Drawing.Color.FromName(hexColor);
        return result.IsKnownColor;
    }
}