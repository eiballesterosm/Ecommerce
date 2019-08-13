using DAO;
using Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

public partial class CarritoCompras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request["__EVENTARGUMENT"]))
            {
                DeleteProductShoppingCard(Convert.ToInt32(Request["__EVENTARGUMENT"]));
            }

            LoadShoppingCard();
        }
        catch (Exception exc)
        {
            Response.Write(exc.Message);
            //Response.Redirect("Products.aspx");
        }
    }

    private void DeleteProductShoppingCard(int id)
    {
        if (Session["ssSHOPPINGCARD"] != null)
        {
            List<ShoppingCartProduct> listProducts = (List<ShoppingCartProduct>)Session["ssSHOPPINGCARD"];
            listProducts.Remove(listProducts.Find(p => p.product.id.Equals(id)));

            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta"
                , string.Format("alert('{0}');"
                , "¡Eliminado correctamente!"), true);
        }
    }

    private void LoadShoppingCard()
    {
        double total = 0;
        if (Session["ssSHOPPINGCARD"] != null)
        {
            List<ShoppingCartProduct> listProducts = (List<ShoppingCartProduct>)Session["ssSHOPPINGCARD"];
            total = listProducts.Sum(p => Double.Parse(p.product.price) * p.total);
            if (total <= 0)
            {
                btnConfirmShopping.Visible = false;
            }
            else
            {
                btnConfirmShopping.Visible = true;

                string innerHtml = "<h3>Tu Carro de compras</h3><table class=\"table custom-table\"><thead><tr>" +
                "<th colspan = \"1\">Descripción Producto</th><th>Precio</th><th>Cantidad</th>" +
                "<th colspan = \"2\"> total </th></tr></thead><tbody>";

                ProductImagesDAO productImagesDAO = new ProductImagesDAO();
                List<ProductImage> listProductImages = productImagesDAO.GetAllProductImages();

                foreach (ShoppingCartProduct shoppingCartProduct in listProducts)
                {
                    string productImageURL = "assets/images/cart-1.jpg";
                    ProductImage productImage = listProductImages.Find(pi => pi.productId.Equals(shoppingCartProduct.product.id));
                    if (productImage != null)
                    {
                        productImageURL = "http://localhost:6742/Images/" + productImage.image;
                    }

                    string productDescription =
                    @"<tr><td data-product=""descripción producto"" class=""cart-fig"">
                          <figure>  
                              <img src=""" + productImageURL + @""" alt=""""/>     
                          </figure>     
                            <div class=""cart-description"">
			                <h4>" + shoppingCartProduct.product.name + @"</h4>
			                <span>Color : <strong>" + shoppingCartProduct.product.colors + @"</strong></span>
			                <span>Talla : <strong>" + shoppingCartProduct.product.sizes[0] + @"</strong></span>
		                </div>
	                </td>
	                <td data-price=""precio"" class=""cart-price-head""><span class=""cart-price"">" + String.Format("{0:C}", Double.Parse(shoppingCartProduct.product.price)) + @"</span></td>
	                <td data-quantity=""cantidad"" class=""cart-quantity"">
		                <input type = ""text"" placeholder=" + shoppingCartProduct.total + @" disabled/>
	                </td>
	                <td data-total=""total"" class=""cart-total""><span class=""cart-price"">" + String.Format("{0:C}", Double.Parse(shoppingCartProduct.product.price)) + @"</span></td>
	                <td class=""cart-btn""><a href = ""#"" class=""trash"" onclick=""javascript: DeleteProduct('" + shoppingCartProduct.product.id + @"')""><i class=""fa fa-trash""></i></a></td>
                    </tr>";

                    innerHtml += productDescription;
                }
                innerHtml = innerHtml + "</tbody></table>";

                divCartItems.InnerHtml = innerHtml;
            }
        }
        else
        {
            btnConfirmShopping.Visible = false;
        }

        ltlSubtotal.Text = String.Format("{0:C}", total);
        ltlTotal.Text = String.Format("{0:C}", total);
    }

    private void EnviarEmail()
    {
        List<ShoppingCartProduct> listProducts = (List<ShoppingCartProduct>)Session["ssSHOPPINGCARD"];

        Dictionary<string, string> attachments = new Dictionary<string, string>();

        string asunto = "Compra MARIAC STORE";
        //string destinatario = "jorge.a.nova@gmail.com";
        //string destinatario = "eduballesteros@yahoo.com";
        string destinatario = "eduballesteros@gmail.com";
        string mensaje = GetLocalResourceObject("mailTemplate").ToString();

        ProductImagesDAO productImagesDAO = new ProductImagesDAO();
        List<ProductImage> listProductImages = productImagesDAO.GetAllProductImages();

        double total = 0;
        total = listProducts.Sum(p => Double.Parse(p.product.price) * p.total);

        string rowsProduct = "";
        foreach (ShoppingCartProduct shoppingCartproduct in listProducts)
        {
            ProductImage productImage = listProductImages.Find(pi => pi.productId.Equals(shoppingCartproduct.product.id));
            string productImageUrl = "";
            if (productImage != null)
            {
                productImageUrl = productImage.image;
            }
            string productImageGUID = "[" + shoppingCartproduct.product.id + Guid.NewGuid().ToString().Substring(0, 3) + "]";

            string rowProducto = GetLocalResourceObject("mailTemplateRow").ToString();
            rowProducto = rowProducto.Replace("@@productName@@", shoppingCartproduct.product.name);
            rowProducto = rowProducto.Replace("@@productDescription@@", shoppingCartproduct.product.longDescription);
            rowProducto = rowProducto.Replace("@@productPrice@@", String.Format("{0:C}", Double.Parse(shoppingCartproduct.product.price)));
            rowProducto = rowProducto.Replace("@@productImage@@", productImageGUID);
            rowProducto = rowProducto.Replace("@@productTotal@@", shoppingCartproduct.total.ToString());
            rowsProduct = rowsProduct + rowProducto;
            attachments.Add(productImageGUID, string.Format("{0}Images\\{1}", "C:\\Ecommerce\\Ecommerce\\", productImage.image));
        }
        mensaje = mensaje.Replace("@@productsTotal@@", String.Format("{0:C}", total));
        mensaje = mensaje.Replace("@@products@@", rowsProduct);

        attachments.Add("@@brandLogo@@", string.Format("{0}Images\\Email\\{1}", "C:\\Ecommerce\\Ecommerce\\", "logo-mc-p.png"));
        attachments.Add("@@twitterLogo@@", string.Format("{0}Images\\Email\\{1}", "C:\\Ecommerce\\Ecommerce\\", "social-icon-twitter.png"));
        attachments.Add("@@facebookLogo@@", string.Format("{0}Images\\Email\\{1}", "C:\\Ecommerce\\Ecommerce\\", "social-icon-fb.png"));

        EnviarEmailConAdjuntos(destinatario, asunto, mensaje, true, attachments);
    }


    public static int EnviarEmailConAdjuntos(string destinatario, string asunto, string mensaje, bool html, Dictionary<string, string> attachments)
    {
        int resultado = 0;
        try
        {
            if (!string.IsNullOrEmpty(destinatario))
            {
                MailMessage message = new MailMessage();
                message.To.Add(new MailAddress(destinatario));
                message.Subject = asunto;

                foreach (var attachment in attachments)
                {
                    mensaje = mensaje.Replace(attachment.Key, Path.GetFileName(attachment.Value));
                }

                AlternateView avHtml = AlternateView.CreateAlternateViewFromString(mensaje, Encoding.UTF8, MediaTypeNames.Text.Html);

                foreach (var attachment in attachments)
                {
                    Attachment att = new Attachment(attachment.Value);
                    message.Attachments.Add(att);
                    LinkedResource inline = new LinkedResource(attachment.Value, MediaTypeNames.Image.Jpeg);
                    inline.ContentId = Path.GetFileName(attachment.Value);

                    avHtml.LinkedResources.Add(inline);
                }

                message.AlternateViews.Add(avHtml);

                SmtpClient client = new SmtpClient();
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.Timeout = 60000;
                client.Send(message);
                resultado = 1;
                client.Dispose();
            }
        }
        catch (Exception ex)
        { }

        return resultado;
    }


    public static AlternateView MailBody()
    {
        string path = "C:\\Ecommerce\\Ecommerce\\Images\\1BB1AF8F2018_10_17_122157.jpg";
        LinkedResource linkedResource = new LinkedResource(path, MediaTypeNames.Image.Jpeg);
        linkedResource.ContentId = "MyImage";
        string str = @"  
                <table>  
                    <tr>  
                        <td> '" + "test" + @"'  
                        </td>  
                    </tr>  
                    <tr>  
                        <td>  
                          <img src=cid:MyImage  id='img' alt='' width='100px' height='100px'/>   
                        </td>  
                    </tr></table>  
                ";
        AlternateView AV =
        AlternateView.CreateAlternateViewFromString(str, null, MediaTypeNames.Text.Html);
        AV.LinkedResources.Add(linkedResource);
        return AV;
    }


    protected void btnConfirmShopping_Click(object sender, EventArgs e)
    {
        EnviarEmail();
    }
}