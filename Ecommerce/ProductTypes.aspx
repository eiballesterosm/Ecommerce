<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="ProductTypes.aspx.cs" Inherits="WebProductTypes" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 50%; text-align: center">
        <br />
        <br />
        <h2>Tipos De Productos</h2>
        <br />
        <dx:ASPxGridView ID="gvProductTypes"
            runat="server"
            DataSourceID="odsProductTypes"
            KeyFieldName="id"
            EnableRowsCache="False"
            EnableCallBacks="false"
            Width="100%"
            AutoGenerateColumns="False"
            OnRowValidating="gvProductTypes_RowValidating">
            <Paddings Padding="0px" />
            <Border BorderWidth="0px" />
            <BorderBottom BorderWidth="1px" />
            <SettingsPager Visible="true" PageSize="20" />
            <SettingsEditing Mode="EditFormAndDisplayRow"></SettingsEditing>
            <SettingsBehavior ConfirmDelete="true" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" ShowDeleteButton="true">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="1" Width="5%" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="name" Caption="Nombre"
                    VisibleIndex="2" Width="24%">
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <HeaderStyle Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="description" Caption="Descripción"
                    VisibleIndex="3" Width="30%">
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <HeaderStyle Font-Bold="true" />
                </dx:GridViewDataTextColumn>
                <%--<dx:GridViewDataTextColumn FieldName="idCategory" Caption="Categoría"
                VisibleIndex="3" Width="10%">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>--%>
                <%--<dx:GridViewDataTextColumn FieldName="categoryName" Caption="Categoría" 
                VisibleIndex="3" Width="10%">
                <EditItemTemplate>
                    <dx:ASPxComboBox ID="lstCategories" runat="server" DataSourceID="odsCategories"
                        ValueField="Id" ClientIDMode="Static"
                        OnSelectedIndexChanged="lstCategories_SelectedIndexChanged"
                        AutoPostBack="true">
                        <Columns>
                            <dx:ListBoxColumn Caption="Id" FieldName="id" ToolTip="Id" Width="10%"/>
                            <dx:ListBoxColumn Caption="Name" FieldName="name" ToolTip="Name" Width="90%" />
                        </Columns>
                    </dx:ASPxComboBox>
                </EditItemTemplate>
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataTextColumn>--%>
                <%--<dx:GridViewDataComboBoxColumn FieldName="idCategory" Caption="Categoría"
                PropertiesComboBox-DataSourceID="odsCategories"
                ReadOnly="false" PropertiesComboBox-ValueField="id"
                PropertiesComboBox-TextField="Name">
                <HeaderStyle Font-Bold="true" />
            </dx:GridViewDataComboBoxColumn>--%>
                <dx:GridViewDataComboBoxColumn Caption="Categoría"
                    FieldName="categoryId"
                    PropertiesComboBox-DataSourceID="odsCategories"
                    Width="23%">
                    <PropertiesComboBox
                        TextField="name"
                        ValueField="id"
                        ValueType="System.Int32"
                        DropDownStyle="DropDownList">
                    </PropertiesComboBox>
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoría Talla"
                    FieldName="categorySizeId"
                    PropertiesComboBox-DataSourceID="odsCategorySizes"
                    Width="23%">
                    <PropertiesComboBox
                        TextField="name"
                        ValueField="id"
                        ValueType="System.Int32"
                        DropDownStyle="DropDownList">
                    </PropertiesComboBox>
                    <HeaderStyle Font-Bold="true" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="odsProductTypes" runat="server"
            TypeName="CtrlProductTypes"
            SelectMethod="GetAllProductTypes"
            InsertMethod="InsertProductType"
            UpdateMethod="UpdateProductType"
            DeleteMethod="DeleteProductType"
            OnUpdated="odsProductTypes_Updated"
            OnDeleted="odsProductTypes_Deleted"
            OnInserted="odsProductTypes_Inserted">
            <%--<UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32"/>
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:SessionParameter Name="CategoryID" SessionField="CategoryID" Type="Int32"/>
        </InsertParameters>--%>
            <%--<InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="description" Type="String" />
        </UpdateParameters>--%>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCategories" runat="server"
            TypeName="CtrlCategories"
            SelectMethod="GetAllCategories"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCategorySizes" runat="server"
            TypeName="CtrlCategorySizes"
            SelectMethod="GetAllCategorySizes"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
    </div>
</asp:Content>
