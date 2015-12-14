<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ExistingJob.aspx.cs" Inherits="DuboisTracker.ExistingJob" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h3>Existing Jobs</h3>
    <asp:Image ID="LLCSelection" runat="server" Height="300px" Width="300px" />
    <br />
    <div class="col-xs-12 col-sm-12 col-md-12">
        <asp:Label ID="Label1" runat="server" Text="Select a Location"></asp:Label>
    </div>
    <br />
    <br />
    <div class="col-xs-12 col-sm-3 col-md-3">
<<<<<<< HEAD
        <asp:DropDownList ID="moldProDropDownList" runat="server" DataSourceID="moldProLocations" Visible="false" DataTextField="address" DataValueField="address">
        </asp:DropDownList>
    </div>
    <div class="col-xs-12 col-sm-3 col-md-3">
        <asp:DropDownList ID="otrDropDownList" runat="server" DataSourceID="otrLocations" Visible="false" DataTextField="address" DataValueField="address">
        </asp:DropDownList>
    </div>
    <div class="col-xs-12 col-sm-3 col-md-3">
        <asp:DropDownList ID="othsDropDownList" runat="server" DataSourceID="othsLocations" Visible="false" DataTextField="address" DataValueField="address">
=======
        <asp:DropDownList ID="moldProDropDownList" runat="server" DataSourceID="moldProLocations" Visible="false" DataTextField="address" DataValueField="address" CssClass="form-control" >
        </asp:DropDownList>
    </div>
    <div class="col-xs-12 col-sm-3 col-md-3">
        <asp:DropDownList ID="otrDropDownList" runat="server" DataSourceID="otrLocations" Visible="false" DataTextField="address" DataValueField="address" CssClass="form-control" >
        </asp:DropDownList>
    </div>
    <div class="col-xs-12 col-sm-3 col-md-3">
        <asp:DropDownList ID="othsDropDownList" runat="server" DataSourceID="othsLocations" Visible="false" DataTextField="address" DataValueField="address" CssClass="form-control" >
>>>>>>> refs/remotes/origin/master
        </asp:DropDownList>
    </div>
    <asp:SqlDataSource ID="moldProLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM jobinfo WHERE companyname = 'moldPro'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="otrLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM JobInfo WHERE companyname = 'OTR'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="othsLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT address FROM JobInfo WHERE companyname = 'OTHS'"></asp:SqlDataSource>
<<<<<<< HEAD
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="submitQuery" CssClass="btn btn-primary" />
    <br />
    <br />
=======
    <br />
    <br />
    <br />
    <div class="col-xs-12 col-sm-12 col-md-12">
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="submitQuery" CssClass="btn btn-primary" />
    </div>
    <br />
    <br />
    <br />
>>>>>>> refs/remotes/origin/master
    <asp:GridView ID="DataGridView1" runat="server" AutoGenerateColumns="False" Visible="False" CssClass="table table-striped table-bordered table-condensed table-hover">
        <Columns>
            <asp:BoundField DataField="jobId" HeaderText="ID" SortExpression="jobId" />
            <asp:BoundField DataField="jobTitle" HeaderText="Title" SortExpression="jobTitle" />
            <asp:BoundField DataField="jobDetails" HeaderText="Details" SortExpression="jobDetails" />
            <asp:BoundField DataField="materials" HeaderText="Materials" SortExpression="materials" />
            <asp:BoundField DataField="jobComplete" HeaderText="Status" SortExpression="jobComplete" />
            <asp:TemplateField HeaderText="Controls">
                <ItemTemplate>
<<<<<<< HEAD
                    <asp:Button ID="editButton" runat="server" Text="Edit" OnClick="editJobDetails" CssClass="btn btn-info" />
                    <asp:Button ID="timeCardButton" runat="server" Text="Time Card" OnClick="loadTimeCardTable" CssClass="btn btn-success" />
                    <asp:Button ID="jobCloseButton" runat="server" Text="Close Job" OnClick="closeJob" CssClass="btn btn-warning" />
=======
                    <asp:Button ID="editButton" runat="server" Text="Edit" OnClick="editJobDetails" CssClass="btn btn-xs btn-info" />
                    <asp:Button ID="timeCardButton" runat="server" Text="Time Card" OnClick="loadTimeCardTable" CssClass="btn btn-xs btn-success" />
                    <asp:Button ID="jobCloseButton" runat="server" Text="Close Job" OnClick="closeJob" CssClass="btn btn-xs btn-warning" />
>>>>>>> refs/remotes/origin/master
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <br />
    <asp:Panel ID="editJobPanel" runat="server" Visible="false">
        <asp:Label ID="lbl_jobId" runat="server" Text="Job ID"></asp:Label>
        <br />
        <asp:TextBox ID="tb_jobId" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
        <div class="form-group">
            <div class="col-xs-12 col-sm-3 col-md-3">
<<<<<<< HEAD
                <asp:Label ID="lbl_firstName" runat="server" Text="First Name" AssociatedControlID="tb_firstName"></asp:Label>
                <asp:TextBox ID="tb_firstName" runat="server" CssClass="form-control"> </asp:TextBox>
            </div>
            <div class="col-xs-12 col-sm-3 col-md-3">
                <asp:Label ID="lbl_lastName" runat="server" Text="Last Name" AssociatedControlID="tb_lastName"></asp:Label>
                <asp:TextBox ID="tb_lastName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-3 col-md-3">
=======
>>>>>>> refs/remotes/origin/master
                <asp:Label ID="lbl_jobTitle" runat="server" Text="Job Title" AssociatedControlID="tb_jobTitle"></asp:Label>
                <asp:TextBox ID="tb_jobTitle" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <asp:Label ID="lbl_jobDetails" runat="server" Text="Job Details" AssociatedControlID="tb_jobDetails"></asp:Label>
                <asp:TextBox ID="tb_jobDetails" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-xs-12 col-sm-6 col-md-6">
                <asp:Label ID="lbl_Materials" runat="server" Text="Materials" AssociatedControlID="tb_Materials"></asp:Label>
                <asp:TextBox ID="tb_materials" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
<<<<<<< HEAD
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="submitJobChanges" CssClass="btn btn-primary" />
=======
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="submitJobChanges" CssClass="btn btn-sm btn-primary" />
>>>>>>> refs/remotes/origin/master
        <asp:Button ID="editJobGoBack" runat="server" Text="Back" OnClick="goBack" CssClass="btn btn-warning" />
    </asp:Panel>

    <asp:Panel ID="timeCardTable" runat="server" Visible="false">
        <asp:Label ID="lbl_timeCardTitle" runat="server" Text="Time Card" />
        <br />
        <asp:Label ID="lbl_timeCardJobIdLabel" runat="server" Text="Job ID: " />
        <asp:Label ID="lbl_timeCardJobId" runat="server" Text="tempId" />
        <br />
        <asp:GridView ID="timeCardGridView" runat="server" AutoGenerateColumns="False" Visible="False" CssClass="table table-striped table-bordered table-condensed table-hover">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="Time Card #" SortExpression="id" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="timeIn" HeaderText="In" SortExpression="timeIn" />
                <asp:BoundField DataField="timeOut" HeaderText="Out" SortExpression="timeOut" />
                <asp:TemplateField HeaderText="Controls">
                    <ItemTemplate>
<<<<<<< HEAD
                        <asp:Button ID="clockOutButton" runat="server" Text="Clock Out" OnClick="clockOutJob" CssClass="btn btn-warning" />
=======
                        <asp:Button ID="clockOutButton" runat="server" Text="Clock Out" OnClick="clockOutJob" CssClass="btn btn-xs btn-warning" />
>>>>>>> refs/remotes/origin/master
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button ID="newTimeCardEntry" runat="server" Text="New Time Card Entry" OnClick="clockInJob" CssClass="btn btn-primary" />
        <asp:Button ID="timeCardGoBack" runat="server" Text="Back" OnClick="goBack" CssClass="btn btn-warning" />
    </asp:Panel>

    <asp:Panel ID="confirmationPanel" runat="server" Visible="false">
        <asp:Label ID="lbl_confirm" runat="server" Text="You clocked in for " Font-Size="X-Large" />
        <br />
        <asp:HyperLink ID="Home" runat="server" NavigateUrl="~">Return to Home</asp:HyperLink>
    </asp:Panel>

    </asp:Content>
