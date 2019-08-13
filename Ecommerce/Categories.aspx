<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="WebCategories" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <center>     

         <h2>Categorías</h2>
        <dx:ASPxLabel ID="lblError" runat="server" Text="">
        </dx:ASPxLabel>
        <br />
    <dx:ASPxGridView ID="gvCategories"
        runat="server"
        DataSourceID="odsCategories"
        KeyFieldName="id"
        EnableRowsCache="false"
        EnableCallBacks="false"
        Width="80%">
        <SettingsPager Visible="true" PageSize="10" />
        <%--<Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350" VerticalScrollBarStyle="Virtual" />--%>
        <Paddings Padding="0px" />
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" ShowDeleteButton="true">
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
    <asp:ObjectDataSource ID="odsCategories" runat="server"
        TypeName="CtrlCategories"
        SelectMethod="GetAllCategories"
        InsertMethod="InsertCategory"
        UpdateMethod="UpdateCategory"
        DeleteMethod="DeleteCategory"
        OnUpdated="odsCategories_Updated"
        OldValuesParameterFormatString="{0}">
    </asp:ObjectDataSource>
       
        </center>
</asp:Content>

