<%@ Page Title="Dubois Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LoginView ID="LoginView1" runat="server" ClientIDMode="Static">
        <LoggedInTemplate>
                <br />
                <h5>
                    If you want to Manage, please go to the
                    <asp:HyperLink ID="Admin" runat="server" NavigateUrl="~/Admin">Admin Page</asp:HyperLink>
                </h5>
                <div class="jumbotron text-center">
                    <div>
                        <asp:RadioButton ID="rb_newJob" runat="server" Text="New Job" GroupName="Jobs" AutoPostBack="True" OnCheckedChanged="rb_selectionChanged" /> &nbsp
                        <asp:RadioButton ID="rb_existingJob" runat="server" Text="Existing Job" GroupName="Jobs" AutoPostBack="True" OnCheckedChanged="rb_selectionChanged" />
                        <div id="companyList" class="row text-center">
                            <asp:Label ID="lbl_selectYourCompany" runat="server" Visible="False" Font-Size="XX-Large">Select your company</asp:Label>
                            <br />
                            <br />
                            <div class="col-xs-12 col-sm-12 col-md-4">
                                <asp:ImageButton ID="MoldPro" runat="server"
                                    ImageUrl="~/Content/Images/MoldProLogo.jpg"
                                    OnClick="btnNewEntry_Click" Visible="False" Style="outline: 2px outset lightblue; height:auto; max-width:100%;" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4">
                                <asp:ImageButton ID="OTHS" runat="server"
                                    ImageUrl="~/Content/Images/OTHSLogo.png"
                                    OnClick="btnNewEntry_Click" Visible="False" Style="outline: 2px outset lightblue; height:auto; max-width:100%;" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4">
                                <asp:ImageButton ID="OTR" runat="server"
                                    ImageUrl="~/Content/Images/OTRLogo.jpg"
                                    OnClick="btnNewEntry_Click" Visible="False" Style="outline: 2px outset lightblue; height:auto; max-width:100%;" />
                            </div>
                        </div>
                    </div>
                </div>

                
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
