<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Light.master" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <div class="accountHeader">
    <h2>
        Change Password</h2>
    <p>Use the form below to change your password.</p>
    <p>New passwords are required to be a minimum of <%= Membership.MinRequiredPasswordLength %> characters in length.</p>
</div>

<br />
<dx:ASPxLabel ID="lblCurrentPassword" runat="server" Text="Old Password:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbCurrentPassword" runat="server" Password="true" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Old Password is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblPassword" runat="server" AssociatedControlID="tbPassword" Text="Password:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbPassword" ClientInstanceName="Password" Password="true" runat="server"
	    Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Password is required." IsRequired="true" />
	    </ValidationSettings>
	</dx:ASPxTextBox>
</div>
<dx:ASPxLabel ID="lblConfirmPassword" runat="server" AssociatedControlID="tbConfirmPassword"
    Text="Password:" />
<div class="form-field">
	<dx:ASPxTextBox ID="tbConfirmPassword" Password="true" runat="server" Width="200px">
	    <ValidationSettings ValidationGroup="ChangeUserPasswordValidationGroup">
	        <RequiredField ErrorText="Confirm Password is required." IsRequired="true" />
	    </ValidationSettings>
	    <ClientSideEvents Validation="function(s, e) {
			var originalPasswd = Password.GetText();
			var currentPasswd = s.GetText();
			e.isValid = (originalPasswd  == currentPasswd );
			e.errorText = 'The Password and Confirmation Password must match.';
		}" />
	</dx:ASPxTextBox>
</div>
<dx:ASPxButton ID="btnChangePassword" runat="server" Text="Change Password" ValidationGroup="ChangeUserPasswordValidationGroup"
    OnClick="btnChangePassword_Click">
</dx:ASPxButton>
</asp:Content>