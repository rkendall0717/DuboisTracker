<%@ Page Title="Info" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewJob.aspx.cs" Inherits="DuboisTracker.NewJob" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="panel_infoForm" runat="server">
        <h3>Please enter your information.</h3>
        <asp:Label ID="lbl_Company" runat="server" Text="Company" AssociatedControlID="tb_company"></asp:Label>
        <br />
        <asp:TextBox ID="tb_company" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_firstName" runat="server" Text="First Name" AssociatedControlID="tb_firstName" Width="123px"></asp:Label>
        &nbsp &nbsp
        <asp:Label ID="lbl_lastName" runat="server" Text="Last Name" AssociatedControlID="tb_lastName" Width="123px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_firstName" runat="server" Width="123"> </asp:TextBox>
        &nbsp &nbsp
        <asp:TextBox ID="tb_lastName" runat="server" Width="123"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_address" runat="server" Text="Address" AssociatedControlID="tb_address" Width="300px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_address" runat="server" Width="300"> </asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_city" runat="server" AssociatedControlID="tb_city" Text="City" Width="123px"></asp:Label>
        &nbsp &nbsp
        <asp:Label ID="lbl_state" runat="server" Text="State" AssociatedControlID="tb_state" Width="123px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_city" runat="server" Width="123"> </asp:TextBox>
        &nbsp &nbsp
        <asp:TextBox ID="tb_state" runat="server" Width="123"> </asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lbl_location" runat="server" Text="Location" AssociatedControlID="tb_location" Width="300px"></asp:Label>
        <br />
        <asp:TextBox ID="tb_location" runat="server" Width="300" TextMode="MultiLine" Wrap="True"></asp:TextBox>
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
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="btnSubmit_Clicked" />
        <br />
        <br />
    </asp:Panel>

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
</asp:Content>




