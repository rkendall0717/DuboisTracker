<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="DuboisTracker.NewJob" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Please enter your information.</h3>
    <asp:Image ID="LLCSelection" runat="server" Height="300px" Width="300px" />
    <br />
    <br />

    <asp:Panel ID="panel_infoForm" runat="server">
        <asp:Label ID="lbl_firstName" runat="server" Text="First Name" AssociatedControlID="tb_firstName"></asp:Label>
        <br />
        <asp:TextBox ID="tb_firstName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_lastName" runat="server" Text="Last Name" AssociatedControlID="tb_lastName"></asp:Label>
        <br />
        <asp:TextBox ID="tb_lastName" runat="server"></asp:TextBox>
    
    <br />
        <br />
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btnSubmit_Clicked" />
        <br />
        <br />
        </asp:Panel>

        <asp:GridView ID="DataGridView1" runat="server" DataSourceID="JobInfo" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField DataField="firstName" HeaderText="firstName" SortExpression="firstName" />
                <asp:BoundField DataField="lastName" HeaderText="lastName" SortExpression="lastName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="JobInfo" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT * FROM jobinfo"></asp:SqlDataSource>

</asp:Content>
