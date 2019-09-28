using Entities;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

public partial class ProductStocks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int productId = -1;

        if (!IsPostBack)
        {
            try
            {
                productId = Convert.ToInt32(Request.QueryString["productId"]);
                CtrlProducts ctrlProducts = new CtrlProducts();
                Product product = ctrlProducts.GetProduct(productId);

                if (product != null && product.id > 0)
                {
                    lblNombreProducto.Text = product.name;
                    lblDescripcion.Text = product.shortDescription;

                    CtrlProductTypes ctrlProductTypes = new CtrlProductTypes();
                    ProductType productType = ctrlProductTypes.GetProductType(product.productTypeId);

                    if (productType != null && productType.id > 0)
                    {
                        CtrlCategorySizes ctrlCategorySizes = new CtrlCategorySizes();
                        CategorySize categorySize = ctrlCategorySizes.GetCategorySize(productType.categorySizeId);

                        CtrlSizes ctrlSizes = new CtrlSizes();
                        List<Size> listAllSizes = ctrlSizes.GetAllSizes();
                        listAllSizes = listAllSizes.FindAll(s => s.categorySizeId.Equals(categorySize.id));

                        CtrlStockSizes ctrlStockSizes = new CtrlStockSizes();
                        List<StockSize> listAllStockSizes = ctrlStockSizes.GetAllStockSizes();
                        listAllStockSizes = listAllStockSizes.FindAll(ss => ss.productId.Equals(product.id));

                        foreach (Size size in listAllSizes)
                        {
                            StockSize stockSize = listAllStockSizes.Find(ss => ss.sizeId.Equals(size.id));
                            if (stockSize == null)
                            {
                                StockSize newStockSize = new StockSize();
                                newStockSize.productId = product.id;
                                newStockSize.sizeId = size.id;
                                newStockSize.stock = 0;
                                ctrlStockSizes.InsertStockSize(newStockSize.productId, newStockSize.sizeId, newStockSize.stock);
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                Response.Redirect("Products.aspx");
            }
        }
    }

    protected void odsProductStocks_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", e.Exception.InnerException.Message), true);
            e.ExceptionHandled = true;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", "¡El registro se actualizó de forma correcta!"), true);
        }
    }

    protected void gvProductStocks_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {

    }
}