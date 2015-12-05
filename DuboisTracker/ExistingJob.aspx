<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExistingJob.aspx.cs" Inherits="DuboisTracker.ExistingJob" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Existing Jobs</h3>
    <asp:Image ID="LLCSelection" runat="server" Height="300px" Width="300px" />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Select a Location"></asp:Label>
    <br />
    <asp:DropDownList ID="moldProDropDownList" runat="server" DataSourceID="moldProLocations" Visible="false" DataTextField="address" DataValueField="address">
    </asp:DropDownList>
    <asp:DropDownList ID="otrDropDownList" runat="server" DataSourceID="otrLocations" Visible="false" DataTextField="address" DataValueField="address">
    </asp:DropDownList>
    <asp:DropDownList ID="othsDropDownList" runat="server" DataSourceID="othsLocations" Visible="false" DataTextField="address" DataValueField="address">
    </asp:DropDownList>
    <asp:SqlDataSource ID="moldProLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT address FROM jobinfo WHERE companyname = 'moldPro'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="otrLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM JobInfo WHERE companyname = 'OTR'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="othsLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM JobInfo WHERE companyname = 'OTHS'"></asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="submitQuery" />
    <br />
    <br />
    <asp:GridView ID="DataGridView1" runat="server" AutoGenerateColumns="False" Visible="False">
        <Columns>
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
            <asp:BoundField DataField="jobDetails" HeaderText="Job Details" SortExpression="jobDetails" />
            <asp:BoundField DataField="materials" HeaderText="Materials Needed" SortExpression="materials" />
            <asp:BoundField DataField="jobComplete" HeaderText="JobComplete" SortExpression="jobComplete" />
        </Columns>
    </asp:GridView>

    </asp:Content>
