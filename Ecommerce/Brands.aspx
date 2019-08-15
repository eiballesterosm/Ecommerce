<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Brands.aspx.cs" Inherits="WebBrands" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 50%; text-align: center">
        <br />
        <br />
        <h2>Marcas</h2>
        <br />
        <dx:ASPxGridView ID="gvBrands"
            runat="server"
            DataSourceID="odsBrands"
            KeyFieldName="id"
            EnableRowsCache="false"
            EnableCallBacks="false"
            Width="100%"
            AutoGenerateColumns="false"
            OnRowValidating="gvBrands_RowValidating">
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
            DeleteMethod="DeleteBrand"
            OnUpdated="odsBrands_Updated"
            OnDeleted="odsBrands_Deleted"
            OnInserted="odsBrands_Inserted"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>

    </div>
</asp:Content>

