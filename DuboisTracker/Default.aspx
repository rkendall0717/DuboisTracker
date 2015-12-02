<%@ Page Title="Dubois Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LoginView ID="LoginView1" runat="server" ClientIDMode="Static">
        <LoggedInTemplate>
            <p>If you want to Manage, please go to  <asp:HyperLink ID="Admin" runat="server" NavigateUrl="~/Admin">Admin Page</asp:HyperLink></p>
    <div class="jumbotron text-center">
        <div>
            <h1>Select your company
            </h1>
            <asp:RadioButton ID="rb_newJob" runat="server" Text="New Job" GroupName="Jobs" AutoPostBack="True" OnCheckedChanged ="rb_selectionChanged" />
            &nbsp;
            <asp:RadioButton ID="rb_existingJob" runat="server" Text="Existing Job" GroupName="Jobs" AutoPostBack="True" OnCheckedChanged ="rb_selectionChanged" />
            &nbsp;<br />             
            <br />
        </div>
    </div>

    <div class="row text-center">
        <div class="col-xs-12 col-sm-12 col-md-4">
            <asp:ImageButton ID="MoldPro" runat="server"
                ImageUrl="~/Content/Images/MoldProLogo.jpg"
                OnClick="btnNewEntry_Click" Height="300px" Width="300px" Visible="False" />
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4">
            <asp:ImageButton ID="OTHS" runat="server"
                ImageUrl="~/Content/Images/OTHSLogo.png"
                OnClick="btnNewEntry_Click" Height="300px" Width="300px" Visible="False" />
        </div>
        <div class="col-xs-12 col-sm-12 col-md-4">
            <asp:ImageButton ID="OTR" runat="server"
                ImageUrl="~/Content/Images/OTRLogo.jpg"
                OnClick="btnNewEntry_Click" Height="300px" Width="300px" Visible="False" />
        </div>
    </div>
            </LoggedInTemplate>
        <AnonymousTemplate>
            <br />
            <p>You are not logged in. Please  <asp:HyperLink ID="Login" runat="server" NavigateUrl="~/Account/Login">Login</asp:HyperLink></p>
        </AnonymousTemplate>
    </asp:LoginView>
</asp:Content>
