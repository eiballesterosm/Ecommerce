<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="ProductTypes.aspx.cs" Inherits="WebProductTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <center>
        <h2>Tipos De Productos</h2>
    <dx:ASPxGridView ID="gvProductTypes"
        runat="server"
        DataSourceID="odsProductTypes"
        KeyFieldName="id"
        EnableRowsCache="False"
        Width="80%" AutoGenerateColumns="False">
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
                VisibleIndex="3" Width="50%">
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
                Width="25%">
               <PropertiesComboBox
                   TextField="name"
                   ValueField="id"
                   ValueType="System.Int32"
                   DropDownStyle="DropDownList">
               </PropertiesComboBox>
                <HeaderStyle Font-Bold="true" />
                </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:ObjectDataSource ID="odsProductTypes" runat="server"
        TypeName="CtrlProductTypes"
        SelectMethod="GetAllProductTypes"
        InsertMethod="InsertProductType"
        UpdateMethod="UpdateProductType">
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
        </center>
</asp:Content>
