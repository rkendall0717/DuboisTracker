<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExistingJob.aspx.cs" Inherits="DuboisTracker.ExistingJob" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Please enter your information.</h3>
    <asp:Image ID="LLCSelection" runat="server" Height="300px" Width="300px" />
    <br />

    <div class="form-group">
        <asp:Label runat="server" AssociatedControlID="tb_firstName" CssClass="active left">First Name</asp:Label>
        <div>
            <asp:TextBox runat="server" ID="tb_firstName" TextMode="SingleLine" CssClass="form-control" />
            <asp:RequiredFieldValidator
                ID="Value1RequiredValidatorFirst" ControlToValidate="tb_firstName" ErrorMessage="Please enter a comment.<br />"
                Display="Dynamic" runat="server" />
        </div>
        <asp:Label runat="server" AssociatedControlID="tb_lastName" CssClass="active left">Last Name</asp:Label>
        <div>
            <asp:TextBox runat="server" ID="tb_lastName" TextMode="SingleLine" CssClass="form-control" />
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidatorLast" ControlToValidate="tb_lastName" ErrorMessage="Please enter a comment.<br />"
                Display="Dynamic" runat="server" />
        </div>
    </div>
</asp:Content>
