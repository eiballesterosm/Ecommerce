using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Mujer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.QueryString["productTypeId"]))
            {
                try
                {
                    int productTypeId = Convert.ToInt32(Request.QueryString["productTypeId"]);
                    LoadMainProducts(0, productTypeId);
                }
                catch
                {
                    LoadMainProducts(0);
                }
            }
            else
            {
                LoadMainProducts(0);
            }
        }
        catch (Exception exc)
        {
            Response.Write(exc.Message);
            //Response.Redirect("Products.aspx");
        }
    }

    private void LoadMainProducts(int order, int productypeId = 0)
    {
        CategoriesDAO categoriesDAO = new CategoriesDAO();
        List<Category> allCategoriesList = categoriesDAO.GetAllCategories();

        Category manCategory = allCategoriesList.Find(c => c.name.ToUpper().Equals("MUJER"));

        ProductTypesDAO productTypesDAO = new ProductTypesDAO();
        List<ProductType> productTypesList = productTypesDAO.GetAllProductTypes();
        productTypesList = productTypesList.FindAll(pt => pt.categoryId.Equals(manCategory.id)).ToList();

        ulProductTypesMan.Controls.Clear();

        HtmlGenericControl liAll = new HtmlGenericControl("li");
        HtmlGenericControl ianchorAll = new HtmlGenericControl("a");
        liAll = new HtmlGenericControl("li");
        ianchorAll = new HtmlGenericControl("a");
        ianchorAll.Attributes.Add("href", "?productTypeId=-1#main");
        ianchorAll.Attributes.Add("class", "active");
        ianchorAll.InnerText = "Todas";
        liAll.Controls.Add(ianchorAll);
        ulProductTypesMan.Controls.Add(liAll);

        foreach (ProductType productType in productTypesList)
        {
            HtmlGenericControl li = new HtmlGenericControl("li");
            HtmlGenericControl ianchor = new HtmlGenericControl("a");
            li = new HtmlGenericControl("li");
            ianchor = new HtmlGenericControl("a");
            ianchor.Attributes.Add("href", "?productTypeId=" + productType.id + "#main");
            ianchor.Attributes.Add("class", "active");
            ianchor.InnerText = productType.name;
            li.Controls.Add(ianchor);
            ulProductTypesMan.Controls.Add(li);
        }

        ProductsDAO productsDAO = new ProductsDAO();
        ProductImagesDAO productImagesDAO = new ProductImagesDAO();

        List<Product> allProductsList = productsDAO.GetAllProducts();
        List<ProductImage> productImageList = productImagesDAO.GetAllProductImages();

        List<Product> productsList = allProductsList.Where(p => productTypesList.Any(pl => pl.id.Equals(p.productTypeId))).ToList();
        if (productypeId > 0)
        {
            productsList = allProductsList.FindAll(p => p.productTypeId.Equals(productypeId));
        }

        //default order
        productsList = productsList.OrderBy(p => p.name).ToList();

        switch (order)
        {
            //NOMBRE (A -Z)
            case 0:
                productsList = productsList.OrderBy(p => p.name).ToList();
                break;
            //NOMBRE (Z -A)
            case 1:
                productsList = productsList.OrderByDescending(p => p.name).ToList();
                break;
            //MENOR PRECIO
            case 2:
                productsList = productsList.OrderBy(p => Double.Parse(p.price)).ToList();
                break;
            //MAYOR PRECIO
            case 3:
                productsList = productsList.OrderByDescending(p => Double.Parse(p.price)).ToList();
                break;
            default:
                productsList = productsList.OrderBy(p => p.name).ToList();
                break;
        }

        pnlProducts.Controls.Clear();

        if (productsList.Count > 0)
        {
            foreach (Product product in productsList)
            {
                //P1
                ProductImage productImage = productImagesDAO.GetAllProductImages()
                    .FindAll(pi => pi.productId.Equals(product.id)).FirstOrDefault();
                string url = "http://localhost:6742/Images/";
                string ImageSrc = url + productImage.image;
                string productDescription =
                    @"<div class=""col-xs-12 col-sm-4"">
                        <div class=""product-display product-description"">
                            <figure class=""product-image"">
                                <img id=""imgProduct1"" src=""" + ImageSrc + @""" alt=""image"" />
			                    <div class=""overlay"">
                                    <div class=""product-view-block"">
    					                <div class=""product-view clearfix"">
						                    <a id=""hlProductZoom1"" href=""" + ImageSrc + @""" class=""zoom icon_zoom-in_alt single_image""></a>
					                    </div>
                                        <a id=""hlBuyProduct1"" href=""/Products.aspx?productId=" + product.id + @"#main"" class=""btn add-cart"">COMPRAR</a>
        			                </div>
                                </div>
		                    </figure>
		                    <div class=""about-product"">
			                    <h4><a id=""hlProduct1"" href=""/Products.aspx?productId=" + product.id + @"#main"" class=""item-name"">" + product.name + @"</a></h4>
			                    <span class=""price"">
				                    <span id=""lblPrice1"">$ " + product.price + @"</span></span>
                                    </div>
	                            </div>
                            </div>";

                HtmlGenericControl div = new HtmlGenericControl("div");
                div.InnerHtml = productDescription;
                pnlProducts.Controls.Add(div);
            }
            ////P8
            //LoadProductInfo(hlProduct8, imgProduct8, productsList[7], productImage, lblPrice8, hlProductZoom8, hlBuyProduct8);

            //productImage = productImagesDAO.GetAllProductImages()
            //    .FindAll(pi => pi.productId.Equals(productsList[8].id))
            //    .FirstOrDefault();

            ////P9
            //LoadProductInfo(hlProduct9, imgProduct9, productsList[8], productImage, lblPrice9, hlProductZoom9, hlBuyProduct9);
        }
    }




    protected void ddOrderBy_SelectedIndexChanged(object sender, EventArgs e)
    {
        int orderValue = Convert.ToInt32(((DropDownList)sender).SelectedValue);
        try
        {
            int productTypeId = Convert.ToInt32(Request.QueryString["productTypeId"]);
            LoadMainProducts(orderValue, productTypeId);
        }
        catch
        {
            LoadMainProducts(orderValue);
        }
    }
}