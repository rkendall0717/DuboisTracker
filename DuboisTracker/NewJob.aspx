<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="DuboisTracker.NewJob" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:LoginView ID="LoginView1" runat="server" ClientIDMode="Static">
        <LoggedInTemplate>
            <div class="form-horizontal">
                <asp:Panel ID="panel_infoForm" runat="server">
                    <h3>Please enter your information.</h3>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-3 col-md-3">
                            <asp:Label ID="lbl_Company" runat="server" Text="Company" AssociatedControlID="tb_company"></asp:Label>
                            <asp:TextBox ID="tb_company" runat="server" ReadOnly="True" Enabled="False" CssClass="form-control"></asp:TextBox>
                            </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-3 col-md-3">
                            <asp:Label ID="lbl_firstName" runat="server" Text="First Name" AssociatedControlID="tb_firstName"></asp:Label>
                            <asp:TextBox ID="tb_firstName" runat="server" CssClass="form-control"> </asp:TextBox>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3">
                            <asp:Label ID="lbl_lastName" runat="server" Text="Last Name" AssociatedControlID="tb_lastName"></asp:Label>
                            <asp:TextBox ID="tb_lastName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <asp:Label ID="lbl_address" runat="server" Text="Address" AssociatedControlID="tb_address"></asp:Label>
                            <asp:TextBox ID="tb_address" runat="server" CssClass="form-control"> </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-3 col-md-3">
                            <asp:Label ID="lbl_city" runat="server" AssociatedControlID="tb_city" Text="City"></asp:Label>
                            <asp:TextBox ID="tb_city" runat="server" CssClass="form-control"> </asp:TextBox>
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3">
                            <asp:Label ID="lbl_state" runat="server" Text="State" AssociatedControlID="tb_state"></asp:Label>
                            <asp:TextBox ID="tb_state" runat="server" CssClass="form-control"> </asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-3 col-md-3">
                            <asp:Label ID="lbl_location" runat="server" Text="Location" AssociatedControlID="tb_location"></asp:Label>
                            <asp:TextBox ID="tb_location" runat="server" TextMode="MultiLine" Wrap="True" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12 col-sm-3 col-md-3">
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
                    <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btnSubmit_Clicked" CssClass="btn btn-primary" />
                    <div id="mapholder"></div>
                </asp:Panel>
            </div>
            <script>
                var x = document.getElementById('<%= tb_location.ClientID %>');
                getLocation();
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
            <br />
            <p>
                You are not logged in. Please
                <asp:HyperLink ID="Login" runat="server" NavigateUrl="~/Account/Login">Login</asp:HyperLink>
            </p>
        </AnonymousTemplate>
    </asp:LoginView>
</asp:Content>




