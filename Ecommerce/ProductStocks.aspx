<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="ProductStocks.aspx.cs" Inherits="ProductStocks" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <h2>Stock</h2>
        <br />
        <table style="width:20; text-align:center">
            <tr>
                <td><b>Nombre: </b>
                    <dx:ASPxLabel ID="lblNombreProducto" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td>&nbsp;&nbsp;</td>
                <td><b>Descripción: </b>
                    <dx:ASPxLabel ID="lblDescripcion" runat="server">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <dx:ASPxGridView ID="gvProductStocks"
            runat="server"
            ClientInstanceName="gvProductStocks"
            DataSourceID="odsProductStocks"
            KeyFieldName="id;productId;sizeId"
            EnableRowsCache="False"
            EnableCallBacks="false"
            Width="20%"
            AutoGenerateColumns="False"
            OnRowValidating="gvProductStocks_RowValidating">
            <SettingsPager Visible="true" PageSize="20" />
            <Paddings Padding="0px" />
            <Border BorderWidth="0px" />
            <BorderBottom BorderWidth="1px" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="false" ShowDeleteButton="false">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" Visible="false" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="productId" Visible="false" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="sizeId" Visible="false" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="sizeName" Caption="Talla" Width="50%">
                    <HeaderStyle Font-Bold="true" />
                    <EditItemTemplate>
                        <dx:ASPxLabel ID="lblSize" runat="server" Text='<%# Eval("sizeName") %>' CssClass="editForm">
                        </dx:ASPxLabel>
                    </EditItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn FieldName="stock" Caption="Stock" Width="50%">
                    <HeaderStyle Font-Bold="true" />
                    <PropertiesSpinEdit MinValue="0" MaxValue="99"></PropertiesSpinEdit>
                </dx:GridViewDataSpinEditColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="odsProductStocks" runat="server"
            TypeName="CtrlStockSizes"
            SelectMethod="GetAllStockSizes"
            UpdateMethod="UpdateStockSize"
            OnUpdated="odsProductStocks_Updated"
            OldValuesParameterFormatString="{0}">
            <SelectParameters>
                <asp:QueryStringParameter Name="productId" QueryStringField="productId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br /><br />
        <dx:ASPxButton ID="btnBack" runat="server" Text="Volver" OnClick="btnBack_Click"></dx:ASPxButton>
    </center>
</asp:Content>
