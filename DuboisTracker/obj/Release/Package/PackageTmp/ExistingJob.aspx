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
    <asp:SqlDataSource ID="moldProLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM jobinfo WHERE companyname = 'moldPro'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="otrLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM JobInfo WHERE companyname = 'OTR'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="othsLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM JobInfo WHERE companyname = 'OTHS'"></asp:SqlDataSource>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="submitQuery" />
    <br />
    <br />
    <asp:GridView ID="DataGridView1" runat="server" AutoGenerateColumns="False" Visible="False">
        <Columns>
            <asp:BoundField DataField="jobId" HeaderText="Job ID" SortExpression="jobId" />
            <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
            <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
            <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
            <asp:BoundField DataField="jobDetails" HeaderText="Job Details" SortExpression="jobDetails" />
            <asp:BoundField DataField="materials" HeaderText="Materials Needed" SortExpression="materials" />
            <asp:BoundField DataField="jobComplete" HeaderText="JobComplete" SortExpression="jobComplete" />
            <asp:TemplateField HeaderText="Job Controls">
                <ItemTemplate>
                    <asp:Button ID="editButton" runat="server" Text="Edit" OnClick="editJobDetails"/>
                    <asp:Button ID="timeCardButton" runat="server" Text="Time Card" OnClick="loadTimeCardTable" />
                    <asp:Button ID="jobCloseButton" runat="server" Text="Close Job" OnClick="closeJob"/>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <asp:Panel ID="editJobPanel" runat="server" Visible="false">
        <asp:Label ID="lbl_jobId" runat="server" Text="Job ID"></asp:Label>
        <br />
        <asp:TextBox ID="tb_jobId" runat="server" ReadOnly="true"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_firstName" runat="server" Text="First Name" Width="125px"></asp:Label> &nbsp &nbsp
        <asp:Label ID="lbl_lastName" runat="server" Text="Last Name" Width="125px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_firstName" runat="server" ReadOnly="True" ></asp:TextBox> &nbsp &nbsp
        <asp:TextBox ID="tb_lastName" runat="server" ReadOnly="True" ></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="lbl_jobTitle" runat="server" Text="Job Title" AssociatedControlID="tb_jobTitle" Width="300px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_jobTitle" runat="server" Width="300px"></asp:TextBox>
        <br />
        <br />  
        <asp:Label ID="lbl_jobDetails" runat="server" Text="Job Details" AssociatedControlID="tb_jobDetails" Width="412px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_jobDetails" runat="server" Width="300px" Height="100px" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_Materials" runat="server" Text="Materials" AssociatedControlID="tb_Materials" Width="410px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_Materials" runat="server" Width="300px" Height="100px" TextMode="MultiLine"></asp:TextBox> 
        <br />
        <br />
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="submitJobChanges" /> &nbsp
        <asp:Button ID="editJobGoBack" runat="server" Text="Back" OnClick="goBack" />
    </asp:Panel>

    <asp:Panel ID="timeCardTable" runat="server" Visible="false">
        <asp:Label ID="lbl_timeCardTitle" runat="server" Text="Time Card" />
        <br />
        <asp:Label ID="lbl_timeCardJobIdLabel" runat="server" Text="Job ID: " />
        <asp:Label ID="lbl_timeCardJobId" runat="server" Text="tempId" />
        <br />
        <asp:GridView ID="timeCardGridView" runat="server" AutoGenerateColumns="False" Visible="False">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Time Card #" SortExpression="id" />
                <asp:BoundField DataField="jobId" HeaderText="Job ID" SortExpression="jobId" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="timeIn" HeaderText="Time In" SortExpression="timeIn" />
                <asp:BoundField DataField="timeOut" HeaderText="Time Out" SortExpression="timeOut" />
                <asp:TemplateField HeaderText="Clock Controls">
                    <ItemTemplate>
                        <asp:Button ID="clockOutButton" runat="server" Text="Clock Out" OnClick="clockOutJob"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="newTimeCardEntry" runat="server" Text="New Time Card Entry" OnClick="clockInJob" /> &nbsp
        <asp:Button ID="timeCardGoBack" runat="server" Text="Back" OnClick="goBack" />
    </asp:Panel>

    <asp:Panel ID="confirmationPanel" runat="server" Visible="false">
        <asp:Label ID="lbl_confirm" runat="server" Text="You clocked in for " />
        <br />
        <asp:HyperLink ID="Home" runat="server" NavigateUrl="~">Home</asp:HyperLink>
    </asp:Panel>

    </asp:Content>
