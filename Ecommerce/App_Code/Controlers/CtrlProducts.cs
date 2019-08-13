using System.Collections.Generic;
using System.ComponentModel;
using DAO;
using Entities;

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

    public void InsertProduct(string name, int productTypeId, int brandId, string shortDescription, string longDescription, string price
        , string sizes, string colors, int stock)
    {
        ProductsDAO dao = new ProductsDAO();
        Product newProduct = new Product();
        newProduct.name = name;
        newProduct.name = name;
        newProduct.productTypeId = productTypeId;
        newProduct.brandId = brandId;
        newProduct.shortDescription = shortDescription;
        newProduct.longDescription = longDescription;
        newProduct.price = price;
        newProduct.sizes = sizes;
        newProduct.colors = colors;
        newProduct.stock = stock;
        dao.CreateProduct(newProduct);
    }

    public void UpdateProduct(string name, int productTypeId, int brandId, string shortDescription, string longDescription, string price
        , string sizes, string colors, int stock, int id)
    {
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
            updatedProduct.sizes = sizes;
            updatedProduct.colors = colors;
            updatedProduct.stock = stock;
            dao.UpdateProduct(updatedProduct);
        }
    }
}