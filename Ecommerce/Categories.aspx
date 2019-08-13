<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="WebCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <center>
        <h2>Categorías</h2>
    <dx:ASPxGridView ID="gvCategories"
        runat="server"
        DataSourceID="odsCategories"
        KeyFieldName="id"
        EnableRowsCache="false"
        Width="80%">
        <SettingsPager Visible="true" PageSize="10" />
        <%--<Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="350" VerticalScrollBarStyle="Virtual" />--%>
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
    <asp:ObjectDataSource ID="odsCategories" runat="server"
        TypeName="CtrlCategories"
        SelectMethod="GetAllCategories"
        InsertMethod="InsertCategory"
        UpdateMethod="UpdateCategory"
        OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>

        </center>
</asp:Content>

