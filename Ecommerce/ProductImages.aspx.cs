using DAO;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxUploadControl;
using Entities;
using System;
using System.IO;
using System.Web.UI;

public partial class WebProductImages : System.Web.UI.Page
{
    int productId = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                productId = Convert.ToInt32(Request.QueryString["productId"]);
                ProductsDAO productsDAO = new ProductsDAO();
                Product product = productsDAO.GetProduct(productId);
                lblNombreProducto.Text = product.name;
                lblDescripcion.Text = product.shortDescription;
                Session["sku"] = product.sku;
            }
            catch (Exception)
            {
                Response.Redirect("Products.aspx");
            }
        }
    }

    protected void Upload_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
    {
        string extension = Path.GetExtension(e.UploadedFile.FileName);
        string imageName = String.Format("{0}{1}{2}", Session["sku"], DateTime.Now.ToString("yyyy_MM_dd_hhmmss"), extension);
        e.CallbackData = String.Format("Images\\{0}", imageName);
        string path = Page.MapPath("~/") + e.CallbackData;
        e.UploadedFile.SaveAs(path);

        CtrlProductImages ctrlProductImages = new CtrlProductImages();
        ctrlProductImages.InsertProductImage(Convert.ToInt32(Request.QueryString["productId"]), imageName);
    }

    protected void gvProductImages_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
    {
        ASPxGridView gv = (ASPxGridView)sender;
        gv.DataBind();
    }
}