﻿<%@ Page Title="Dubois Tracker" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LoginView ID="LoginView1" runat="server" ClientIDMode="Static">
        <LoggedInTemplate>
                <h5>
                    If you want to Manage, please go to the
                    <asp:HyperLink ID="Admin" runat="server" NavigateUrl="~/Admin">Admin Page</asp:HyperLink>
                </h5>
                <div class="jumbotron text-center">
                    <div>
                        <asp:RadioButton ID="rb_newJob" runat="server" Text="New Job" GroupName="Jobs" AutoPostBack="True" OnCheckedChanged="rb_selectionChanged" />
                        <asp:RadioButton ID="rb_existingJob" runat="server" Text="Existing Job" GroupName="Jobs" AutoPostBack="True" OnCheckedChanged="rb_selectionChanged" />
                        <div id="companyList" class="row text-center">
                            <h1>Select your company</h1>
                            <div class="col-xs-12 col-sm-12 col-md-4">
                                <asp:ImageButton ID="MoldPro" runat="server"
                                    ImageUrl="~/Content/Images/MoldProLogo.jpg"
                                    OnClick="btnNewEntry_Click" Height="300px" Width="300px" Visible="False" Style="outline: 2px outset lightblue;" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4">
                                <asp:ImageButton ID="OTHS" runat="server"
                                    ImageUrl="~/Content/Images/OTHSLogo.png"
                                    OnClick="btnNewEntry_Click" Height="300px" Width="300px" Visible="False" Style="outline: 2px outset lightblue;" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4">
                                <asp:ImageButton ID="OTR" runat="server"
                                    ImageUrl="~/Content/Images/OTRLogo.jpg"
                                    OnClick="btnNewEntry_Click" Height="300px" Width="300px" Visible="False" Style="outline: 2px outset lightblue;" />
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
