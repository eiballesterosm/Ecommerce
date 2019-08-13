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
        BrandsDAO dao = new BrandsDAO();
        Brand newBrand = new Brand();
        newBrand.name = name;
        newBrand.description = description;
        dao.CreateBrand(newBrand);
    }

    [DataObjectMethod(DataObjectMethodType.Update, false)]
    public void UpdateBrand(int id, string name, string description)
    {
        BrandsDAO dao = new BrandsDAO();
        Brand updateBrand = dao.GetBrand(id);
        if (updateBrand != null)
        {
            updateBrand.name = name;
            updateBrand.description = description;
            dao.UpdateBrand(updateBrand);
        }
    }
}