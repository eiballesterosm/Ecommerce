<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="CategorySizes.aspx.cs" Inherits="CategorySizes" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 50%; text-align: center">
        <br />
        <br />
        <h2>Categorías Tallas</h2>
        <br />
        <dx:ASPxGridView ID="gvCategorySizes"
            runat="server"
            DataSourceID="odsCategorySizes"
            KeyFieldName="id"
            EnableRowsCache="false"
            EnableCallBacks="false"
            OnRowValidating="gvCategorySizes_RowValidating"
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
                    VisibleIndex="2" Width="100%">
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <HeaderStyle Font-Bold="true" />
                    <PropertiesTextEdit MaxLength="50"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="odsCategorySizes" runat="server"
            TypeName="CtrlCategorySizes"
            SelectMethod="GetAllCategorySizes"
            InsertMethod="InsertCategorySize"
            UpdateMethod="UpdateCategorySize"
            DeleteMethod="DeleteCategorySize"
            OnUpdated="odsCategorySizes_Updated"
            OnDeleted="odsCategorySizes_Deleted"
            OnInserted="odsCategorySizes_Inserted"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>

    </div>
</asp:Content>

