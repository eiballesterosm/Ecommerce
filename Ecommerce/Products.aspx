<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="WebProducts" %>

<%@ Register Assembly="DevExpress.Web.v13.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <center>
        <h2>Productos</h2>
    <dx:ASPxGridView ID="gvProducts"
        runat="server"
        DataSourceID="odsProducts"
        KeyFieldName="id"
        EnableRowsCache="False"
        Width="80%" AutoGenerateColumns="False" SettingsBehavior-ConfirmDelete="true">
        <SettingsPager Visible="true" PageSize="40" />        
        <Paddings Padding="0px" />
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />        
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" ShowDeleteButton="true">
            </dx:GridViewCommandColumn>
            <%--<dx:GridViewDataTextColumn FieldName="id" Width="5%" Visible="false">
            </dx:GridViewDataTextColumn>--%>
            <dx:GridViewDataTextColumn FieldName="sku" Caption="SKU" Width="6%">
                <HeaderStyle Font-Bold="true" />
                <EditItemTemplate>
                    <dx:ASPxLabel ID="labelCategoryName" runat="server" Text='<%# Eval("sku") %>' CssClass="editForm">
                    </dx:ASPxLabel>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="name" Caption="Nombre" Width="14%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Tipo Producto"
                FieldName="productTypeId"
                PropertiesComboBox-DataSourceID="odsProductTypes"
                Width="10%">
               <PropertiesComboBox
                   TextField="description"
                   ValueField="id"
                   ValueType="System.Int32"
                   DropDownStyle="DropDownList">
               </PropertiesComboBox>
                <HeaderStyle Font-Bold="true" />
                </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Marca"
                FieldName="brandId"
                PropertiesComboBox-DataSourceID="odsBrands"
                Width="10%">
               <PropertiesComboBox
                   TextField="name"
                   ValueField="id"
                   ValueType="System.Int32"
                   DropDownStyle="DropDownList">
               </PropertiesComboBox>
                <HeaderStyle Font-Bold="true" />
                </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="shortDescription" Caption="Descripción Corta" Width="4%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="longDescription" Caption="Descripción" Width="14%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="price" Caption="Precio" Width="8%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="sizes" Caption="Tallas" Width="8%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="colors" Caption="Color" Width="8%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="stock" Caption="Stock" Width="6%">
                <HeaderStyle Font-Bold="true"/>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="id" Caption="Imágenes" Width="12%" CellStyle-HorizontalAlign="Center">
                <HeaderStyle Font-Bold="true" />
                <PropertiesHyperLinkEdit NavigateUrlFormatString = "ProductImages.aspx?productId={0}" Text="Ver">
                </PropertiesHyperLinkEdit>
                <EditItemTemplate>
                    <dx:ASPxHyperLink ID="hlProductImages" runat="server" Text="Ver" NavigateUrl='<%# Eval("id", "ProductImages.aspx?productId={0}") %>'/>
                </EditItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:ObjectDataSource ID="odsProducts" runat="server"
        TypeName="CtrlProducts"
        SelectMethod="GetAllProducts"
        InsertMethod="InsertProduct"
        UpdateMethod="UpdateProduct">
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsProductTypes" runat="server"
        TypeName="CtrlProductTypes"
        SelectMethod="GetAllProductTypes"
        OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsBrands" runat="server"
        TypeName="CtrlBrands"
        SelectMethod="GetAllBrands"
        OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
</center>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
