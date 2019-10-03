<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Sizes.aspx.cs" Inherits="Sizes" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 30%; text-align: center">
        <br />
        <br />
        <h2>Tallas</h2>
        <br />
        <dx:ASPxGridView ID="gvSizes"
            runat="server"
            DataSourceID="odsSizes"
            KeyFieldName="id"
            EnableRowsCache="False"
            EnableCallBacks="false"
            Width="100%"
            AutoGenerateColumns="False"
            OnRowValidating="gvSizes_RowValidating">
            <Paddings Padding="0px" />
            <Border BorderWidth="0px" />
            <BorderBottom BorderWidth="1px" />
            <SettingsPager Visible="true" PageSize="20" />
            <SettingsEditing Mode="EditFormAndDisplayRow"></SettingsEditing>
            <SettingsBehavior ConfirmDelete="true" />
            <Settings ShowGroupPanel="false" ShowFilterRow="True"/>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" ShowDeleteButton="true">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="1" Width="5%" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="name" Caption="Nombre"
                    VisibleIndex="2" Width="30%">
                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                    <CellStyle HorizontalAlign="Left"></CellStyle>
                    <HeaderStyle Font-Bold="true" />
                    <PropertiesTextEdit MaxLength="10"></PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoría"
                    FieldName="categorySizeId"
                    PropertiesComboBox-DataSourceID="odsCategorySizes"
                    Width="70%">
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
        <asp:ObjectDataSource ID="odsSizes" runat="server"
            TypeName="CtrlSizes"
            SelectMethod="GetAllSizes"
            InsertMethod="InsertSize"
            UpdateMethod="UpdateSize"
            DeleteMethod="DeleteSize"
            OnUpdated="odsSizes_Updated"
            OnDeleted="odsSizes_Deleted"
            OnInserted="odsSizes_Inserted">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCategorySizes" runat="server"
            TypeName="CtrlCategorySizes"
            SelectMethod="GetAllCategorySizes"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>
    </div>
</asp:Content>


