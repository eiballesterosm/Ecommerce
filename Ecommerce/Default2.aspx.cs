using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void odsCategories_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {
        lblError.Text = "EDUARDO BALLESTEROS";
    }

    protected void odsCategories_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        lblError.Text = "EDUARDO BALLESTEROS";
    }
}