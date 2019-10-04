using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;

/// <summary>
/// Summary description for CtrlProducts
/// </summary>
[DataObject]
public class CtrlProducts
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<Product> GetAllProducts()
    {
        List<Product> products = new List<Product>();
        ProductsDAO dao = new ProductsDAO();
        products = dao.GetAllProducts();
        return products;
    }

    public Product GetProduct(int id)
    {
        Product product = new Product();
        ProductsDAO dao = new ProductsDAO();
        product = dao.GetProduct(id);
        return product;
    }

    #region INSERT

    public void InsertProduct(string name, int productTypeId, int brandId, string shortDescription, string longDescription, string price, int colorId)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            shortDescription = shortDescription.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible registrar el Producto");
        }

        ProductsDAO dao = new ProductsDAO();
        Product newProduct = new Product();
        newProduct.name = name;
        newProduct.productTypeId = productTypeId;
        newProduct.brandId = brandId;
        newProduct.shortDescription = shortDescription;
        newProduct.longDescription = longDescription;
        newProduct.price = price;
        newProduct.colorId = colorId;
        dao.CreateProduct(newProduct);
    }

    #endregion


    #region UPDATE

    public void UpdateProduct(int id, string name, int productTypeId, int brandId, string shortDescription, string longDescription, string price, int colorId)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            shortDescription = shortDescription.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible actualizar el Producto");
        }

        ProductsDAO dao = new ProductsDAO();
        Product updatedProduct = dao.GetProduct(id);
        if (updatedProduct != null)
        {
            updatedProduct.name = name;
            updatedProduct.productTypeId = productTypeId;
            updatedProduct.brandId = brandId;
            updatedProduct.shortDescription = shortDescription;
            updatedProduct.longDescription = longDescription;
            updatedProduct.price = price;
            updatedProduct.colorId = colorId;
            int result = dao.UpdateProduct(updatedProduct);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar el Producto");
            }
        }
    }

    public void UpdateProduct(int id, string name, int brandId, string shortDescription, string longDescription, string price, int colorId)
    {
        try
        {
            name = name.TrimEnd().TrimStart();
            shortDescription = shortDescription.TrimEnd().TrimStart();
        }
        catch (Exception)
        {
            throw new Exception("No es posible actualizar el Producto");
        }

        ProductsDAO dao = new ProductsDAO();
        Product updatedProduct = dao.GetProduct(id);
        if (updatedProduct != null)
        {
            updatedProduct.name = name;
            updatedProduct.brandId = brandId;
            updatedProduct.shortDescription = shortDescription;
            updatedProduct.longDescription = longDescription;
            updatedProduct.price = price;
            updatedProduct.colorId = colorId;
            int result = dao.UpdateProduct(updatedProduct);
            if (result < 1)
            {
                throw new Exception("No es posible actualizar el Producto");
            }
        }
    }

    #endregion

    public void DeleteProduct(int id)
    {
        ProductsDAO dao = new ProductsDAO();
        Product deleteProduct = dao.GetProduct(id);
        if (deleteProduct != null)
        {
            int result = dao.DeleteProduct(deleteProduct);
            if (result < 1)
            {
                throw new Exception("No es posible eliminar el Producto");
            }
        }
        else
        {
            throw new Exception("El id del Producto a eliminar no es válido");
        }
    }
}