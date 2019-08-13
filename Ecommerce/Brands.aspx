<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="WebBrands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <center>
        <h2>Marcas</h2>
    <dx:ASPxGridView ID="gvBrands"
        runat="server"
        DataSourceID="odsBrands"
        KeyFieldName="id"
        EnableRowsCache="false"
        Width="80%"
        SettingsBehavior-ConfirmDelete="true">
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
    <asp:ObjectDataSource ID="odsBrands" runat="server"
        TypeName="CtrlBrands"
        SelectMethod="GetAllBrands"
        InsertMethod="InsertBrand"
        UpdateMethod="UpdateBrand"
        OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>

        </center>
</asp:Content>

