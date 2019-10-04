<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="WebProducts" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 80%; text-align: center">
        <br />
        <br />
        <h2>Productos</h2>
        <br />
        <dx:ASPxGridView ID="gvProducts"
            runat="server"
            DataSourceID="odsProducts"
            KeyFieldName="id"
            EnableRowsCache="False"
            EnableCallBacks="false"
            Width="100%"
            AutoGenerateColumns="False"
            OnStartRowEditing="gvProducts_StartRowEditing"
            OnInitNewRow="gvProducts_InitNewRow"
            OnRowValidating="gvProducts_RowValidating">
            <Paddings Padding="0px" />
            <Border BorderWidth="0px" />
            <BorderBottom BorderWidth="1px" />
            <SettingsPager Visible="true" PageSize="20" />
            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
            <SettingsPopup EditForm-HorizontalAlign="Center" EditForm-VerticalAlign="WindowCenter"></SettingsPopup>
            <SettingsBehavior ConfirmDelete="true" />
            <Settings ShowGroupPanel="false" ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" ShowDeleteButton="true">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" Width="5%" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="sku" Caption="SKU" Width="6%">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <EditItemTemplate>
                        <dx:ASPxLabel ID="labelCategoryName" runat="server" Text='<%# Eval("sku") %>' CssClass="editForm">
                        </dx:ASPxLabel>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="name" Caption="Nombre" Width="14%">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <PropertiesTextEdit MaxLength="100"></PropertiesTextEdit>
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
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <%--                <dx:GridViewDataColumn  Caption="Tipo Producto" FieldName="productTypeId" Width="10%">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lblProductType" runat="server" Text='<%# Eval("productTypeName") %>'></dx:ASPxLabel>
                    </DataItemTemplate>
                    <EditItemTemplate>
                        <dx:ASPxComboBox ID="ddlProductType" runat="server" Width="100%"
                            ValueField="id" TextField="description" DataSourceID="odsProductTypes"></dx:ASPxComboBox>
                    </EditItemTemplate>
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataColumn>--%>
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
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="shortDescription" Caption="Descripción Corta" Width="4%">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <PropertiesTextEdit MaxLength="100"></PropertiesTextEdit>
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="longDescription" Caption="Descripción" Width="14%">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <PropertiesTextEdit MaxLength="500"></PropertiesTextEdit>
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="price" Caption="Precio" Width="8%">
                    <DataItemTemplate>
                        <dx:ASPxLabel ID="lblPrice" runat="server" Text='<%# "$"+Eval("price") %>'></dx:ASPxLabel>
                    </DataItemTemplate>
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <PropertiesTextEdit MaxLength="6"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Color"
                    FieldName="colorId"
                    PropertiesComboBox-DataSourceID="odsColors"
                    Width="10%">
                    <PropertiesComboBox
                        TextField="name"
                        ValueField="id"
                        ValueType="System.Int32"
                        DropDownStyle="DropDownList">
                    </PropertiesComboBox>
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="sizes" Caption="Tallas" Width="8%">
                    <HeaderStyle Font-Bold="true" />
                    <PropertiesTextEdit MaxLength="20"></PropertiesTextEdit>
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                </dx:GridViewDataTextColumn>
                <%--<dx:GridViewDataSpinEditColumn FieldName="stock" Caption="Stock" Width="6%">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <PropertiesSpinEdit MinValue="1" MaxValue="99"></PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>--%>
                <dx:GridViewDataHyperLinkColumn FieldName="id" Caption="Stock" Width="8%" CellStyle-HorizontalAlign="Center" Settings-AllowAutoFilter="False">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="ProductStocks.aspx?productId={0}" Text="Ver">
                    </PropertiesHyperLinkEdit>
                    <EditItemTemplate>
                        <dx:ASPxHyperLink ID="hlProductImages" runat="server" Text="Ver" NavigateUrl='<%# Eval("id", "ProductStocks.aspx?productId={0}") %>' />
                    </EditItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="id" Caption="Imágenes" Width="10%" CellStyle-HorizontalAlign="Center" Settings-AllowAutoFilter="False">
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <PropertiesHyperLinkEdit NavigateUrlFormatString="ProductImages.aspx?productId={0}" Text="Ver">
                    </PropertiesHyperLinkEdit>
                    <EditItemTemplate>
                        <dx:ASPxHyperLink ID="hlProductImages" runat="server" Text="Ver" NavigateUrl='<%# Eval("id", "ProductImages.aspx?productId={0}") %>' />
                    </EditItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="odsProducts" runat="server"
            TypeName="CtrlProducts"
            SelectMethod="GetAllProducts"
            InsertMethod="InsertProduct"
            UpdateMethod="UpdateProduct"
            DeleteMethod="DeleteProduct"
            OnUpdated="odsProducts_Updated"
            OnDeleted="odsProducts_Deleted"
            OnInserted="odsProducts_Inserted"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsProductTypes" runat="server"
            TypeName="CtrlProductTypes"
            SelectMethod="GetAllProductTypes"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsBrands" runat="server"
            TypeName="CtrlBrands"
            SelectMethod="GetAllBrands"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsColors" runat="server"
            TypeName="CtrlColors"
            SelectMethod="GetAllColors"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
    </div>
</asp:Content>
