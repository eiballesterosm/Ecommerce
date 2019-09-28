<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="Colors.aspx.cs" Inherits="Colors" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="margin: 0 auto; width: 40%; text-align: center">
        <br />
        <br />
        <h2>Colores</h2>
        <br />
        <dx:ASPxGridView ID="gvColors"
            runat="server"
            DataSourceID="odsColors"
            KeyFieldName="id"
            EnableRowsCache="false"
            EnableCallBacks="false"
            Width="100%"
            AutoGenerateColumns="false"
            OnRowValidating="gvColors_RowValidating">
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
                    VisibleIndex="2" Width="40%">
                    <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="color" Caption="Color"
                    VisibleIndex="3" Width="45%">
                    <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="color" Caption="Ejemplo"
                    VisibleIndex="4" Width="15%">
                     <HeaderStyle Font-Bold="true" HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center"></CellStyle>
                    <DataItemTemplate>
                        <div style="width:40px; height:20px;border-color:black;border-width:1px;border-style:groove; background-color:<%# Eval("color") %>"></div>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="odsColors" runat="server"
            TypeName="CtrlColors"
            SelectMethod="GetAllColors"
            InsertMethod="InsertColor"
            UpdateMethod="UpdateColor"
            DeleteMethod="DeleteColor"
            OnUpdated="odsColors_Updated"
            OnDeleted="odsColors_Deleted"
            OnInserted="odsColors_Inserted"
            OldValuesParameterFormatString="{0}"></asp:ObjectDataSource>

    </div>
</asp:Content>



