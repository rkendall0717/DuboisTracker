using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DuboisTracker
{
    public partial class ExistingJob : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // method that sets up page according to previously selected LLC
            if (Request.QueryString["Name"] != null)
            {
                if (Request.QueryString["Name"] == "moldPro")
                {
                    LLCSelection.ImageUrl = "~/Content/Images/MoldProLogo.jpg";
                    //firstName.Text = Request.QueryString["Name"];
                }
                else if (Request.QueryString["Name"] == "OTHS")
                {
                    LLCSelection.ImageUrl = "~/Content/Images/OTHSLogo.png";
                    //firstName.Text = Request.QueryString["Name"];
                }
                else if (Request.QueryString["Name"] == "OTR")
                {
                    LLCSelection.ImageUrl = "~/Content/Images/OTRLogo.jpg";
                    //firstName.Text = Request.QueryString["Name"];
                }
            }
        }
    }
}