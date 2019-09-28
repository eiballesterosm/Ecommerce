using System.Collections.Generic;
using System.ComponentModel;
using DAO;
using Entities;

/// <summary>
/// Summary description for CtrlProductImages
/// </summary>
[DataObject]
public class CtrlProductImages
{
    [DataObjectMethod(DataObjectMethodType.Select, false)]
    public List<ProductImage> GetAllProductImages(int productId)
    {
        List<ProductImage> productImagesList = new List<ProductImage>();
        ProductImagesDAO dao = new ProductImagesDAO();
        productImagesList = dao.GetAllProductImages();
        //Filter by productID
        productImagesList = productImagesList.FindAll(pi => pi.productId.Equals(productId));
        return productImagesList;
    }

    public void InsertProductImage(int productId, string image)
    {
        ProductImagesDAO dao = new ProductImagesDAO();
        ProductImage newProductImage = new ProductImage();
        newProductImage.productId = productId;
        newProductImage.image = image;
        dao.CreateProductImage(newProductImage);
    }

    public void DeleteProductImage(int id)
    {
        ProductImagesDAO dao = new ProductImagesDAO();
        dao.DeleteProductImage(id);
    }
}