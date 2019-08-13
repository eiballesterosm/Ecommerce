using System.Collections.Generic;
using System.ComponentModel;
using DAO;
using Entities;

/// <summary>
/// Summary description for CtrlProductTypes
/// </summary>
[DataObject]
public class CtrlProductTypes
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<ProductType> GetAllProductTypes()
    {
        List<ProductType> productTypes = new List<ProductType>();
        ProductTypesDAO dao = new ProductTypesDAO();
        productTypes = dao.GetAllProductTypes();
        return productTypes;
    }

    public void InsertProductType(string name, string description, int categoryId)
    {
        ProductTypesDAO dao = new ProductTypesDAO();
        ProductType newProductType = new ProductType();
        newProductType.name = name;
        newProductType.description = description;
        newProductType.categoryId = categoryId;
        dao.CreateProductType(newProductType);
    }

    public void UpdateProductType(string name, string description, int categoryId, int id)
    {
        ProductTypesDAO dao = new ProductTypesDAO();
        ProductType updatedProductType = dao.GetProductType(id);
        if (updatedProductType != null)
        {
            updatedProductType.name = name;
            updatedProductType.description = description;
            updatedProductType.categoryId = categoryId;
            dao.UpdateProductType(updatedProductType);
        }
    }
}