<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="DuboisTracker.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Admin</h3>
    <asp:LoginView ID="LoginView1" runat="server" ClientIDMode="Static">
        <LoggedInTemplate>
            <div class="form-group">
                <asp:Panel ID="panel_passwordSubmit" runat="server">
                    <asp:Label runat="server" AssociatedControlID="tb_password" CssClass="active left" ID="lbl_password" ViewStateMode="Inherit">Password</asp:Label>
                    <div>
                        <asp:TextBox runat="server" ID="tb_password" TextMode="Password" CssClass="form-control" />
                    </div>
                    <br>
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btnSubmit_Clicked" CssClass="btn btn-primary" />
                </asp:Panel>
                <asp:Panel ID="panel_ddlTask" runat="server" Style="display: none">
                    <p>
                        New User? Please
                        <asp:HyperLink ID="Register" runat="server" NavigateUrl="~/Account/Register">Register</asp:HyperLink>
                    </p>
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <asp:DropDownList ID="ddl_task" runat="server" CssClass="form-control">
                            <asp:ListItem>View/Update Users</asp:ListItem>
                            <asp:ListItem>View Jobs</asp:ListItem>
                            <asp:ListItem>View Locations</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btn_submitView" runat="server" Text="Submit View" OnClick="btnSubmitView_Clicked" CssClass="btn btn-primary" />
                </asp:Panel>
                <asp:Panel ID="panel_viewUpdateUsers" runat="server" Style="display: none">
                    <h3>The following users are registered: </h3>
                    <asp:GridView ID="gv_users" runat="server" CssClass="table table-striped table-bordered table-condensed table-hover"></asp:GridView>
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <asp:Label ID="lbl_deleteUser" runat="server" Text="Delete a User? Select a User Name to Delete:" AssociatedControlID="ddl_userToDelete"></asp:Label>
                    </div>
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <asp:DropDownList ID="ddl_userToDelete" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btn_deleteUser" runat="server" Text="Delete User" OnClick="DeleteUser" CssClass="btn btn-danger" />
                </asp:Panel>
                <asp:Panel ID="panel_viewLocations" runat="server" Style="display: none">
                    <div class="col-xs-12 col-sm-3 col-md-3">
                        <asp:DropDownList ID="ddl_locationsToView" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </div>
                    <asp:Button ID="btn_viewLocations" runat="server" Text="Delete User" CssClass="btn btn-danger" />
                </asp:Panel>
            </div>
            <div id="mapholder">
                <br />
                <br />
                <asp:GridView ID="dgv_jobInfo" runat="server" DataSourceID="JobInfo" AutoGenerateColumns="False" Visible="False"
                    CssClass="table table-striped table-bordered table-condensed table-hover">
                    <Columns>
                        <asp:BoundField DataField="companyName" HeaderText="Company Name" SortExpression="CompanyName" />
                        <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                        <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                        <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                        <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                        <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                        <asp:BoundField DataField="jobTitle" HeaderText="Job Title" SortExpression="jobTitle" />
                        <asp:BoundField DataField="jobDetails" HeaderText="Job Details" SortExpression="jobDetails" />
                        <asp:BoundField DataField="materials" HeaderText="Materials Needed" SortExpression="materials" />
                        <asp:BoundField DataField="jobComplete" HeaderText="JobComplete" SortExpression="jobComplete" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="JobLocations" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT location FROM jobinfo"></asp:SqlDataSource>
                <asp:SqlDataSource ID="JobInfo" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_infoConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_infoConnectionString.ProviderName %>" SelectCommand="SELECT * FROM jobinfo"></asp:SqlDataSource>
                <asp:SqlDataSource ID="UserInfo" runat="server" ConnectionString="<%$ ConnectionStrings:db_9e00e3_userConnectionString %>" ProviderName="<%$ ConnectionStrings:db_9e00e3_userConnectionString.ProviderName %>" SelectCommand="SELECT UserName from AspNetUsers"></asp:SqlDataSource>
            </div>

            <script>
                var x = document.getElementById('<%= ddl_locationsToView.ClientID %>');
                //getLocation();
                function getLocation() {

                    x.readOnly = "true";
                    x.Enabled = "false";

                    if (navigator.geolocation) {
                        navigator.geolocation.getCurrentPosition(showPosition, showError);
                    } else {
                        x.value = "Geolocation is not supported by this browser.";
                    }
                }

                function showPosition(position) {
                    x.value = position.coords.latitude + "\n" +
                    position.coords.longitude;
                    navigator.geolocation.getCurrentPosition(showPositionMap, showError);
                }

                function showPositionMap(position) {
                    var latlon = position.coords.latitude + "," + position.coords.longitude;

                    var img_url = "https://maps.googleapis.com/maps/api/staticmap?maptype=satellite&center=&markers=color:blue%7Clabel:S%7C"
                    + latlon + "&zoom=18&size=400x300&sensor=false";
                    document.getElementById("mapholder").innerHTML = "<img src='" + img_url + "'>";
                }

                function showError(error) {
                    switch (error.code) {
                        case error.PERMISSION_DENIED:
                            x.value = "User denied the request for Geolocation."
                            break;
                        case error.POSITION_UNAVAILABLE:
                            x.value = "Location information is unavailable."
                            break;
                        case error.TIMEOUT:
                            x.value = "The request to get user location timed out."
                            break;
                        case error.UNKNOWN_ERROR:
                            x.value = "An unknown error occurred."
                            break;
                    }
                }
            </script>
        </LoggedInTemplate>
        <AnonymousTemplate>
            <p>
                You are not logged in. Please
                <asp:HyperLink ID="Login" runat="server" NavigateUrl="~/Account/Login">Login</asp:HyperLink>
            </p>
        </AnonymousTemplate>
    </asp:LoginView>
</asp:Content>
