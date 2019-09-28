using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;

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

    public ProductType GetProductType(int id)
    {
        ProductType productType = new ProductType();
        ProductTypesDAO dao = new ProductTypesDAO();
        productType = dao.GetProductType(id);
        return productType;
    }

    public void InsertProductType(string name, string description, int categoryId)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            description = description.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar el Tipo de Producto");
        }

        ProductTypesDAO dao = new ProductTypesDAO();
        List<ProductType> productTypes = GetAllProductTypes();
        if (productTypes.FindAll(p => (p.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (p.categoryId == categoryId)).Count > 0)
        {
            throw new Exception("Ya existe un Tipo de Producto con este nombre");
        }

        ProductType newProductType = new ProductType();
        newProductType.name = name;
        newProductType.description = description;
        newProductType.categoryId = categoryId;
        int result = dao.CreateProductType(newProductType);
        if (result < 1)
        {
            throw new Exception("No es posible registrar el Tipo de Producto");
        }
    }

    public void UpdateProductType(string name, string description, int categoryId, int id)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            description = description.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar el Tipo de Producto");
        }

        ProductTypesDAO dao = new ProductTypesDAO();
        List<ProductType> productTypes = GetAllProductTypes();
        //ProductType updatedProductType = dao.GetProductType(id);
        ProductType updatedProductType = productTypes.Find(p => p.id.Equals(id));
        if (updatedProductType != null)
        {
            if (productTypes.FindAll(p => (p.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (p.categoryId == categoryId) && (p.id != id)).Count > 0)
            {
                throw new Exception("Ya existe un Tipo de Producto con este nombre");
            }

            updatedProductType.name = name;
            updatedProductType.description = description;
            updatedProductType.categoryId = categoryId;
            int result = dao.UpdateProductType(updatedProductType);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar el Tipo de Producto");
            }
        }
        else
        {
            throw new Exception("El id del Tipo de Producto a actualizar no es válido");
        }
    }

    public void DeleteProductType(int id)
    {
        ProductTypesDAO dao = new ProductTypesDAO();
        ProductType deleteProductType = dao.GetProductType(id);
        if (deleteProductType != null)
        {
            int result = dao.DeleteProductType(deleteProductType);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar el Tipo de Producto, por favor verificar que no existan Productos asociados al Tipo de Producto");
            }
        }
        else
        {
            throw new Exception("El id del Tipo de Producto a eliminar no es válido");
        }
    }
}