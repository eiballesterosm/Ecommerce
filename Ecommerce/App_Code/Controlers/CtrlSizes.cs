using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;

/// <summary>
/// Summary description for CtrlSizes
/// </summary>
[DataObject]
public class CtrlSizes
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<Size> GetAllSizes()
    {
        List<Size> sizes = new List<Size>();
        SizesDAO dao = new SizesDAO();
        sizes = dao.GetAllSizes();
        return sizes;
    }

    public void InsertSize(string name, int categorySizeId)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Talla");
        }

        SizesDAO dao = new SizesDAO();
        List<Size> sizes = GetAllSizes();
        if (sizes.FindAll(p => (p.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (p.categorySizeId == categorySizeId)).Count > 0)
        {
            throw new Exception("Ya existe una Talla con este nombre para esa categoría de Talla");
        }

        Size newSize = new Size();
        newSize.name = name;
        newSize.categorySizeId = categorySizeId;
        int result = dao.CreateSize(newSize);
        if (result < 1)
        {
            throw new Exception("No es posible registrar la Talla");
        }
    }

    public void UpdateSize(string name, int categorySizeId, int id)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Talla");
        }

        SizesDAO dao = new SizesDAO();
        List<Size> sizes = GetAllSizes();
        Size updateSize = sizes.Find(p => p.id.Equals(id));
        if (updateSize != null)
        {
            if (sizes.FindAll(p => (p.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (p.categorySizeId == categorySizeId) && (p.id != id)).Count > 0)
            {
                throw new Exception("Ya existe una Talla con este nombre para esa categoría de Talla");
            }

            updateSize.name = name;
            updateSize.categorySizeId = categorySizeId;
            int result = dao.UpdateSize(updateSize);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar la Talla");
            }
        }
        else
        {
            throw new Exception("El id de la Talla a actualizar no es válido");
        }
    }

    public void DeleteSize(int id)
    {
        SizesDAO dao = new SizesDAO();
        Size deleteSize = dao.GetSize(id);
        if (deleteSize != null)
        {
            int result = dao.DeleteSize(deleteSize);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar la Talla");
            }
        }
        else
        {
            throw new Exception("El id de la Talla a eliminar no es válido");
        }
    }
}