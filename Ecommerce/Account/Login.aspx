<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Log In</h2>
    <p>
        Please enter your username and password. 
		<a href="Register.aspx">Register</a> if you don't have an account.</p>
</div>
<dx:ASPxLabel ID="lblUserName" runat="server" AssociatedControlID="tbUserName" Text="User Name:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbUserName" runat="server" Width="200px">
	    <ValidationSettings ValidationGroup="LoginUserValidationGroup">
	        <RequiredField ErrorText="User Name is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbPassword" runat="server" Password="true" Width="200px">
	    <ValidationSettings ValidationGroup="LoginUserValidationGroup">
	        <RequiredField ErrorText="Password is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnLogin" runat="server" Text="Log In" ValidationGroup="LoginUserValidationGroup"
    OnClick="btnLogin_Click">
</dx:ASPxButton>
</asp:Content>

