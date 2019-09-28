<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
	<script type="text/javascript">
		function OnEndCallBack(s, e) {
			if (s.cpIsUpdated != '') {
                alert('1');
			}
			else {
				alert('2');
			}
		}
	</script>
</head>
<body>
    <form id="form1" runat="server">
        <center>
        <h2>Categorías</h2>
       
        <br />
   <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="odsCategories">
       <Columns>
           <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
           <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
           <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
           <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
       </Columns>

   </asp:GridView>
    <asp:ObjectDataSource ID="odsCategories" runat="server"  
        TypeName="CtrlCategories"
        SelectMethod="GetAllCategories"
        InsertMethod="InsertCategory"
        UpdateMethod="UpdateCategory"
        OnUpdating="odsCategories_Updating"
        OnUpdated="odsCategories_Updated"
        OldValuesParameterFormatString="{0}">
    </asp:ObjectDataSource>


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>  
<asp:UpdatePanel ID="UpdatePanel1" runat="server">  
    <ContentTemplate>  
         <dx:ASPxLabel ID="lblError" runat="server" Text="sss">
        </dx:ASPxLabel>
         <dx:ASPxGridView ID="gvCategories"
        runat="server"
        ClientInstanceName="gvCategories"
        DataSourceID="odsCategories"
        KeyFieldName="id"
        EnableRowsCache="false"
        Width="80%">
        <SettingsPager Visible="true" PageSize="10" />
        <Paddings Padding="0px" />
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="1" Width="5%" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="name" Caption="Nombre"
                VisibleIndex="2" Width="25%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="description" Caption="Descripción"
                VisibleIndex="3" Width="65%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    </ContentTemplate>  
</asp:UpdatePanel>
 

        </center>
    </form>
</body>
</html>
