<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="DuboisTracker.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="row">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-xs-2 col-sm-2 col-md-2">User Name</asp:Label>
                <div class="col-xs-10 col-sm-10 col-md-10">
                    <asp:TextBox runat="server" ID="UserName" CssClass="form-control"  />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                        CssClass="text-danger" ErrorMessage="The User Name field is required." />
                </div>
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-xs-2 col-sm-2 col-md-2">Password</asp:Label>
                <div class="col-xs-10 col-sm-10 col-md-10">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="The password field is required." />
                </div>
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-xs-4 col-sm-4 col-md-4">Confirm password</asp:Label>
                <div class="col-xs-10 col-sm-10 col-md-10">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <div class="col-xs-2 col-sm-2 col-md-2">
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                            CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                    </div>
                </div>
                <div class="col-xs-10 col-sm-10 col-md-10">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
