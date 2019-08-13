using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Home_ : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadProducts();
    }

    private void LoadProducts()
    {
        ProductsDAO productsDAO = new ProductsDAO();
        ProductImagesDAO productImagesDAO = new ProductImagesDAO();

        List<Product> productsList = productsDAO.GetAllProducts();
        List<ProductImage> productImageList = productImagesDAO.GetAllProductImages();

        ProductImage productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[0].id))
            .FirstOrDefault();

        //P1
        LoadProductInfo(hlProduct1, imgProduct1, productsList[0], productImage, lblPrice1, hlProductZoom1, hlBuyProduct1);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[1].id))
            .FirstOrDefault();

        //P2
        LoadProductInfo(hlProduct2, imgProduct2, productsList[1], productImage, lblPrice2, hlProductZoom2, hlBuyProduct2);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[2].id))
            .FirstOrDefault();

        //P3
        LoadProductInfo(hlProduct3, imgProduct3, productsList[2], productImage, lblPrice3, hlProductZoom3, hlBuyProduct3);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[3].id))
            .FirstOrDefault();

        //P4
        LoadProductInfo(hlProduct4, imgProduct4, productsList[3], productImage, lblPrice4, hlProductZoom4, hlBuyProduct4);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[4].id))
            .FirstOrDefault();

        //P5
        LoadProductInfo(hlProduct5, imgProduct5, productsList[4], productImage, lblPrice5, hlProductZoom5, hlBuyProduct5);


        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[5].id))
            .FirstOrDefault();

        //P6
        LoadProductInfo(hlProduct6, imgProduct6, productsList[5], productImage, lblPrice6, hlProductZoom6, hlBuyProduct6);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[6].id))
            .FirstOrDefault();

        //P7
        LoadProductInfo(hlProduct7, imgProduct7, productsList[6], productImage, lblPrice7, hlProductZoom7, hlBuyProduct7);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[7].id))
            .FirstOrDefault();

        //P7
        LoadProductInfo(hlProduct8, imgProduct8, productsList[7], productImage, lblPrice8, hlProductZoom8, hlBuyProduct8);

    }

    private void LoadProductInfo(HtmlAnchor htmlAnchor, HtmlImage htmlImage, Product product, ProductImage productImage
        , Label lblPrice, HtmlAnchor htmlAnchorProductZoom, HtmlAnchor htmlAnchorBuyProduct)
    {
        htmlAnchor.InnerText = product.name;
        htmlAnchor.HRef = "/Products.aspx?productId=" + product.id + "#main";
        object ob = HttpContext.Current.Request.Url;
        string url = "http://localhost:6742/Images/";
        htmlImage.Src = url + productImage.image;
        lblPrice.Text = string.Concat("$", " ", product.price);

        htmlAnchorProductZoom.HRef = htmlImage.Src;
        htmlAnchorBuyProduct.HRef = htmlAnchor.HRef;
    }
}