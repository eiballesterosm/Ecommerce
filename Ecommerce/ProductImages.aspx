<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeFile="ProductImages.aspx.cs" Inherits="WebProductImages" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function OnFileUploadComplete(s, e) {
            //document.getElementById('image').src = e.callbackData;
            gvProductImages.PerformCallback();
        }
        function ShowDetailPopup(customerID) {
            window.open('Images\\' + customerID, '_blank', 'status=no,menubar=no,toolbar=no,scrollbars=yes,resizable=yes,height=800,width=800,location=no').focus();
        }
    </script>
    <center>
    <h2>Imágenes de Productos</h2>
    <br />
    <table>
        <tr>
            <td><b>Nombre: </b><dx:ASPxLabel ID="lblNombreProducto" runat="server"></dx:ASPxLabel></td>
            <td>&nbsp;&nbsp;</td>
            <td><b>Descripción: </b><dx:ASPxLabel ID="lblDescripcion" runat="server"></dx:ASPxLabel></td>
        </tr>
    </table>
    <br />
    <dx:ASPxUploadControl ID="Upload" runat="server"
        ShowUploadButton="True"
        OnFileUploadComplete="Upload_FileUploadComplete"
        UploadButton-Text="CARGAR"
        Width="20%">
        <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif,.png">
        </ValidationSettings>
        <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
    </dx:ASPxUploadControl>
    <br />
    <br />
    <dx:ASPxGridView ID="gvProductImages"
        runat="server"
        ClientInstanceName="gvProductImages"
        DataSourceID="odsProductImages"
        KeyFieldName="id"
        EnableRowsCache="False"
        Width="50%"
        AutoGenerateColumns="False"
        SettingsBehavior-ConfirmDelete="true"
        OnCustomCallback="gvProductImages_CustomCallback" SettingsText-ConfirmDelete="¿Desea eliminar la imagen del producto?">
        <SettingsPager Visible="true" PageSize="20" />        
        <Paddings Padding="0px" />
        <Border BorderWidth="0px" />
        <BorderBottom BorderWidth="1px" />        
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="false" ShowNewButtonInHeader="false" ShowDeleteButton="true">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="image" Caption="Nombre Imagen" Width="80%">
                <HeaderStyle Font-Bold="true" />
                <EditItemTemplate>
                    <dx:ASPxLabel ID="labelImageName" runat="server" Text='<%# Eval("image") %>' CssClass="editForm">
                    </dx:ASPxLabel>
                </EditItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="image" Caption="Imágenes" Width="20%" CellStyle-HorizontalAlign="Center">
                <HeaderStyle Font-Bold="true" />
                <PropertiesHyperLinkEdit NavigateUrlFormatString="javascript:ShowDetailPopup('{0}');" Text="Ver Imagen">
                </PropertiesHyperLinkEdit>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:ObjectDataSource ID="odsProductImages" runat="server"
        TypeName="CtrlProductImages"
        SelectMethod="GetAllProductImages"
        InsertMethod="InsertProductImage"
        DeleteMethod="DeleteProductImage">
        <SelectParameters>
            <asp:QueryStringParameter Name="productId" QueryStringField="productId" Type ="Int32" />
        </SelectParameters>
        </asp:ObjectDataSource>
</center>
</asp:Content>
