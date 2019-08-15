using DevExpress.Web;
using DevExpress.Web.Data;
using Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.UI.WebControls;

public partial class WebCategories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void odsCategories_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void odsCategories_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void odsCategories_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void gvCategories_RowValidating(object sender, ASPxDataValidationEventArgs e)
    {
        try
        {
            // Checks for null values. 
            foreach (GridViewColumn column in gvCategories.Columns)
            {
                if (column is GridViewDataColumn)
                {
                    GridViewDataColumn dataColumn = column as GridViewDataColumn;
                    if (dataColumn.Visible)
                    {
                        //Validations in model
                        StringLengthAttribute strLenAttr = Utils.GetLengthAttribute(typeof(Category), dataColumn.FieldName);
                        RequiredAttribute requiredAttr = Utils.GetRequiredAttribute(typeof(Category), dataColumn.FieldName);

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


        //CtrlCategories ctrlCategories = new CtrlCategories();
        //List<Category> categoryList = ctrlCategories.GetAllCategories();

        //if (e.IsNewRow)
        //{
        //    string name = e.NewValues["name"].ToString();
        //    if (categoryList.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant()))).Count > 0)
        //    {
        //        e.RowError = "Error al crear el registro, ya existe una categoría con el mismo Nombre";
        //    }
        //}
        //else
        //{
        //    int id = ((Category)((DevExpress.Web.ASPxGridView)sender).GetRow(e.VisibleIndex)).id;
        //    string name = e.NewValues["name"].ToString();
        //    if (categoryList.FindAll(c => (c.name.ToUpperInvariant().Equals(name.ToUpperInvariant())) && (c.id != id)).Count > 0)
        //    {
        //        e.RowError = "Error al actualizar el registro, ya existe una categoría con el mismo Nombre";
        //    }
        //}

        //if (e.NewValues["ContactName"] != null &&
        //    e.NewValues["ContactName"].ToString().Length < 2)
        //{
        //    AddError(e.Errors, gvCategories.Columns["ContactName"],
        //    "Contact Name must be at least two characters long.");
        //}
        //if (e.NewValues["CompanyName"] != null &&
        //e.NewValues["CompanyName"].ToString().Length < 2)
        //{
        //    AddError(e.Errors, gvCategories.Columns["CompanyName"],
        //    "Company Name must be at least two characters long.");
        //}
        //if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0)
        //    e.RowError = "Please, correct all errors.";
    }

    void AddError(Dictionary<GridViewColumn, string> errors, GridViewColumn column, string errorText)
    {
        if (errors.ContainsKey(column)) return;
        errors[column] = errorText;
    }

}