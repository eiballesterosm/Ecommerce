using DevExpress.Web;
using Entities;
using System;
using System.ComponentModel.DataAnnotations;
using System.Web.UI.WebControls;

public partial class WebBrands : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvBrands_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
    {
        try
        {
            // Checks for null values. 
            foreach (GridViewColumn column in gvBrands.Columns)
            {
                if (column is GridViewDataColumn)
                {
                    GridViewDataColumn dataColumn = column as GridViewDataColumn;
                    if (dataColumn.Visible)
                    {
                        //Validations in model
                        StringLengthAttribute strLenAttr = Utils.GetLengthAttribute(typeof(Brand), dataColumn.FieldName);
                        RequiredAttribute requiredAttr = Utils.GetRequiredAttribute(typeof(Brand), dataColumn.FieldName);

                        if (requiredAttr != null)
                        {
                            if (e.NewValues[dataColumn.FieldName] == null)
                            {
                                e.Errors[dataColumn] = requiredAttr.ErrorMessage;
                            }
                            else
                            {
                                if (strLenAttr != null)
                                {
                                    int maxLen = strLenAttr.MaximumLength;
                                    int minLen = strLenAttr.MinimumLength;

                                    if (e.NewValues[dataColumn.FieldName].ToString().Length > maxLen || e.NewValues[dataColumn.FieldName].ToString().Length < minLen)
                                    {
                                        e.Errors[dataColumn] = strLenAttr.ErrorMessage;
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // Displays the error row if there is at least one error. 
            if (e.Errors.Count > 0)
            {
                if (e.IsNewRow)
                {
                    e.RowError = "Error al crear el registro";
                }
                else
                {
                    e.RowError = "Error al actualizar el registro";
                }
                return;
            }
        }
        catch (Exception)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", "Error. Por favor intente más tarde"), true);
        }
    }

    protected void odsBrands_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void odsBrands_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", e.Exception.InnerException.Message), true);
            e.ExceptionHandled = true;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", "¡El registro se eliminó de forma correcta!"), true);
        }
    }

    protected void odsBrands_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        if (e.Exception != null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", e.Exception.InnerException.Message), true);
            e.ExceptionHandled = true;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Respuesta", string.Format("alert('{0}');", "¡El registro se insertó de forma correcta!"), true);
        }
    }
}