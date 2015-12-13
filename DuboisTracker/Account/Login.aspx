<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DuboisTracker.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
<<<<<<< HEAD
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-xs-2 col-sm-2 col-md-2">Email</asp:Label>
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
=======
                        <asp:Label runat="server" AssociatedControlID="UserName" CssClass="col-md-2 control-label">User Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="UserName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="The User Name field is required." />
>>>>>>> refs/remotes/origin/master
                        </div>
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-xs-2 col-sm-2 col-md-2">Password</asp:Label>
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                        <div class="col-xs-3 col-sm-3 col-md-3">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                        </div>
                        <div class="col-xs-10 col-sm-10 col-md-10">
                            <asp:HyperLink class="btn btn-link" runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    --%>
                </p>
            </section>
        </div>

<<<<<<< HEAD
        <div class="col-xs-4 col-sm-4 col-md-4 hidden">
=======
        <!--<div class="col-md-4">
>>>>>>> refs/remotes/origin/master
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div> -->
    </div>
</asp:Content>
