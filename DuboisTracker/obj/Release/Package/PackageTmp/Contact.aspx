<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="DuboisTracker.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        Eastern Michigan University<br />
        <abbr title="Phone">P:</abbr>
        719.466.7190
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">rkendal5@emich.edu</a><br />
    </address>
</asp:Content>
