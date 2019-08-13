using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    int productId = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            productId = Convert.ToInt32(Request.QueryString["productId"]);
            LoadProduct(productId);

            LoadOtherProducts(productId);
        }
        catch (Exception exc)
        {
            Response.Write(exc.Message);
            //Response.Redirect("Products.aspx");
        }
    }

    private void LoadProduct(int productId)
    {
        try
        {
            ProductsDAO productsDAO = new ProductsDAO();
            Product product = productsDAO.GetProduct(productId);

            lblProductName.Focus();

            lblProductName.InnerText = product.name;
            lblProductPrice.InnerText = string.Concat("$", " ", product.price);
            lblProductDescrition.InnerText = product.shortDescription;
            lblColors.InnerText = product.colors;

            ProductImagesDAO productImagesDAO = new ProductImagesDAO();
            List<ProductImage> ProductImageList = productImagesDAO.GetAllProductImages();
            ProductImageList = ProductImageList.FindAll(pi => pi.productId.Equals(product.id));
            ProductImage productImage = ProductImageList.FirstOrDefault();
            string url = "http://localhost:6742/Images/";
            imgProductMain.Src = url + productImage.image;

            hlProductZoom.HRef = imgProductMain.Src;

            string[] sizes = product.sizes.Split(',');
            foreach (string size in sizes)
            {
                ddlProductSizes.Items.Add(size);
            }

            imgProduct1.Src = url + ProductImageList[0].image;
            imgProduct2.Src = url + ProductImageList[1].image;
            imgProduct3.Src = url + ProductImageList[2].image;
            imgProduct4.Src = url + ProductImageList[3].image;


        }
        catch (Exception)
        { }
    }

    private void LoadOtherProducts(int productId)
    {
        ProductsDAO productsDAO = new ProductsDAO();
        ProductImagesDAO productImagesDAO = new ProductImagesDAO();

        List<Product> allProductsList = productsDAO.GetAllProducts();
        List<ProductImage> productImageList = productImagesDAO.GetAllProductImages();

        List<Product> productsList = new List<Product>();
        //Random 4 products
        for (int i = 0; i < Int32.MaxValue; i++)
        {
            Random random = new Random();
            int randomNumber = random.Next(0, allProductsList.Count);

            Product product = allProductsList[randomNumber];

            if ((!productsList.Contains(product)) && (product.id != productId))
            {
                productsList.Add(product);
            }

            if (productsList.Count == 4) break;
        }

        ProductImage productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[0].id))
            .FirstOrDefault();

        //P1
        LoadProductInfo(hlOtherProduct1, imgOtherProduct1, productsList[0], productImage, lblPriceOtherProduct1, hlOtherProductZoom1, hlBuyOtherProduct1);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[1].id))
            .FirstOrDefault();

        //P2
        LoadProductInfo(hlOtherProduct2, imgOtherProduct2, productsList[1], productImage, lblPriceOtherProduct2, hlOtherProductZoom2, hlBuyOtherProduct2);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[2].id))
            .FirstOrDefault();

        //P3
        LoadProductInfo(hlOtherProduct3, imgOtherProduct3, productsList[2], productImage, lblPriceOtherProduct3, hlOtherProductZoom3, hlBuyOtherProduct3);

        productImage = productImagesDAO.GetAllProductImages()
            .FindAll(pi => pi.productId.Equals(productsList[3].id))
            .FirstOrDefault();

        //P4
        LoadProductInfo(hlOtherProduct4, imgOtherProduct4, productsList[3], productImage, lblPriceOtherProduct4, hlOtherProductZoom4, hlBuyOtherProduct4);
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


    protected void btnBuyProduct_Click(object sender, EventArgs e)
    {
        productId = Convert.ToInt32(Request.QueryString["productId"]);
        ProductsDAO productsDAO = new ProductsDAO();
        Product product = productsDAO.GetProduct(productId);

        if (product != null)
        {
            List<ShoppingCartProduct> listProductsShoppingCard;
            if (Session["ssSHOPPINGCARD"] == null)
            {
                listProductsShoppingCard = new List<ShoppingCartProduct>();
                ShoppingCartProduct shoppingCartProduct = new ShoppingCartProduct();
                shoppingCartProduct.product = product;
                shoppingCartProduct.total = 1;
                listProductsShoppingCard.Add(shoppingCartProduct);
                Session["ssSHOPPINGCARD"] = listProductsShoppingCard;
            }
            else
            {
                listProductsShoppingCard = (List<ShoppingCartProduct>)Session["ssSHOPPINGCARD"];
                ShoppingCartProduct shoppingCartProductOld = listProductsShoppingCard.Find(p => p.product.id.Equals(product.id));
                if (shoppingCartProductOld != null)
                {
                    shoppingCartProductOld.total++;
                }
                else
                {
                    ShoppingCartProduct shoppingCartProduct = new ShoppingCartProduct();
                    shoppingCartProduct.product = product;
                    shoppingCartProduct.total = 1;
                    listProductsShoppingCard.Add(shoppingCartProduct);
                }
            }

            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta"
                   , string.Format("alert('{0}');"
                   , "¡Agregado correctamente!"), true);

        }
    }

}