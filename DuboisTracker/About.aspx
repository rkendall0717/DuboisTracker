<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="DuboisTracker.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About Us:</h2>
    <h5>Property of moldPro LLC, Oak Tree Home Services LLC, and Oak Tree Residential LLC.</h5>
    <p>If you have questions or concerns, please <asp:HyperLink ID="Contact" runat="server" NavigateUrl="~/Contact.aspx">Contact Us.</asp:HyperLink></p>
</asp:Content>