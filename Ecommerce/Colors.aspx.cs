using DevExpress.Web;
using DevExpress.Web.Data;
using Entities;
using System;
using System.ComponentModel.DataAnnotations;
using System.Web.UI.WebControls;

public partial class Colors : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void odsColors_Updated(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void odsColors_Deleted(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void odsColors_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
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

    protected void gvColors_RowValidating(object sender, ASPxDataValidationEventArgs e)
    {
        try
        {
            //ASPxGridView gv = sender as ASPxGridView;
            //GridViewDataColumn columnSearch = gv.Columns["color"] as GridViewDataColumn;
            //ASPxColorEdit colorPicker = gv.FindEditRowCellTemplateControl(columnSearch, "colorPicker") as ASPxColorEdit;
            //e.NewValues.Add(columnSearch.FieldName, colorPicker.Text);

            // Checks for null values. 
            foreach (GridViewColumn column in gvColors.Columns)
            {
                if (column is GridViewDataColumn)
                {
                    GridViewDataColumn dataColumn = column as GridViewDataColumn;
                    if (dataColumn.Visible)
                    {
                        //Validations in model
                        StringLengthAttribute strLenAttr = Utils.GetLengthAttribute(typeof(Color), dataColumn.FieldName);
                        RequiredAttribute requiredAttr = Utils.GetRequiredAttribute(typeof(Color), dataColumn.FieldName);

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

    protected void gvColors_StartRowEditing(object sender, ASPxStartRowEditingEventArgs e)
    {
        ((GridViewDataColumn)gvColors.Columns["Ejemplo"]).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.False;
    }

    protected void gvColors_InitNewRow(object sender, ASPxDataInitNewRowEventArgs e)
    {
        ((GridViewDataColumn)gvColors.Columns["Ejemplo"]).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.False;
    }
}