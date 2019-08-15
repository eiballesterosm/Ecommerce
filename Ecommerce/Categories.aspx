<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Categories.aspx.cs" Inherits="WebCategories" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 50%; text-align: center">
        <br />
        <br />
        <h2>Categorías</h2>
        <br />
        <dx:ASPxGridView ID="gvCategories"
            runat="server"
            DataSourceID="odsCategories"
            KeyFieldName="id"
            EnableRowsCache="false"
            EnableCallBacks="false"
            OnRowValidating="gvCategories_RowValidating"
            Width="100%">
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
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <HeaderStyle Font-Bold="true" />
                    <PropertiesTextEdit MaxLength="50"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="description" Caption="Descripción"
                    VisibleIndex="3" Width="65%">
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <HeaderStyle Font-Bold="true" />
                    <PropertiesTextEdit MaxLength="100"></PropertiesTextEdit>
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
            OnDeleted="odsCategories_Deleted"
            OnInserted="odsCategories_Inserted"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>

    </div>
</asp:Content>

