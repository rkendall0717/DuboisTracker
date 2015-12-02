<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DuboisTracker.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Admin</h3>
    <asp:LoginView ID="LoginView1" runat="server" ClientIDMode="Static">
        <LoggedInTemplate>
            <br />
            <asp:DropDownList ID="ddl_task" runat="server">
                <asp:ListItem>View Users</asp:ListItem>
                <asp:ListItem>View Jobs</asp:ListItem>
            </asp:DropDownList>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tb_password" CssClass="active left" ID="lbl_password">Password</asp:Label>
                <div>
                    <asp:TextBox runat="server" ID="tb_password" TextMode="SingleLine" CssClass="form-control" />
                    <asp:RequiredFieldValidator
                        ID="ValueRequiredValidatorPassword" ControlToValidate="tb_password" ErrorMessage="Please enter a correct password.<br />"
                        Display="Dynamic" runat="server" />                    
                </div>
                <br>
                <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btnSubmit_Clicked" />
                <br />

                <asp:GridView ID="GridView1" runat="server" Visible="False" Caption="The Following Users Are Registered"></asp:GridView>
        </LoggedInTemplate>
        <AnonymousTemplate>
            <br />
            <p>
                You are not logged in. Please 
                <asp:HyperLink ID="Login" runat="server" NavigateUrl="~/Account/Login">Login</asp:HyperLink>
            </p>
        </AnonymousTemplate>
    </asp:LoginView>

</asp:Content>
