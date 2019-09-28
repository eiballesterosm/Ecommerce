using System;
using System.Collections.Generic;
using System.ComponentModel;
using DAO;
using Entities;

/// <summary>
/// Summary description for CtrlBrands
/// </summary>
[DataObject]
public class CtrlBrands
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<Brand> GetAllBrands()
    {
        List<Brand> brands = new List<Brand>();
        BrandsDAO dao = new BrandsDAO();
        brands = dao.GetAllBrands();
        return brands;
    }

    [DataObjectMethod(DataObjectMethodType.Insert, false)]
    public void InsertBrand(string name, string description)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            description = description.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar la Marca");
        }

        BrandsDAO dao = new BrandsDAO();
        List<Brand> brands = GetAllBrands();
        if (brands.FindAll(b => b.name.ToUpperInvariant().Equals(name.ToUpperInvariant())).Count > 0)
        {
            throw new Exception("Ya existe una Marca con este nombre");
        }

        Brand newBrand = new Brand();
        newBrand.name = name;
        newBrand.description = description;
        int result = dao.CreateBrand(newBrand);
        if (result < 1)
        {
            throw new Exception("No es posible registrar la Marca");
        }
    }

    [DataObjectMethod(DataObjectMethodType.Update, false)]
    public void UpdateBrand(int id, string name, string description)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            description = description.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible actualizar la Marca");
        }

        BrandsDAO dao = new BrandsDAO();
        //Brand updateBrand = dao.GetBrand(id);
        List<Brand> brands = GetAllBrands();
        Brand updateBrand = brands.Find(b => b.id.Equals(id));
        if (updateBrand != null)
        {
            if (brands.FindAll(b => (b.name.Equals(name.ToUpperInvariant())) && (b.id != id)).Count > 0)
            {
                throw new Exception("Ya existe una Marca con este nombre");
            }

            updateBrand.name = name;
            updateBrand.description = description;
            int result = dao.UpdateBrand(updateBrand);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar la Marca");
            }
        }
        else
        {
            throw new Exception("El id de la Marca a actualizar no es válido");
        }
    }


    [DataObjectMethod(DataObjectMethodType.Delete, false)]
    public void DeleteBrand(int id)
    {
        BrandsDAO dao = new BrandsDAO();
        Brand deleteBrand = dao.GetBrand(id);
        if (deleteBrand != null)
        {
            int result = dao.DeleteBrand(deleteBrand);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar la Marca, por favor verificar que no existen Productos asociados a la Marca");
            }
        }
        else
        {
            throw new Exception("El id de la Marca a actualizar no es válido");
        }
    }
}