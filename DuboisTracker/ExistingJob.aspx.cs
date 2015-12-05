using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace DuboisTracker
{
    public partial class ExistingJob : Page
    {
        public static String myConnectionString = "Server=MYSQL5013.Smarterasp.net;Database=db_9e00e3_info;Uid=9e00e3_info;Pwd=Password1.;";

        protected void Page_Load(object sender, EventArgs e)
        {

            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            // method that sets up page according to previously selected LLC
            if (Request.QueryString["Name"] != null)
            {
                try {
                    connection.Open();
                    cmd = connection.CreateCommand();
                    string MyCommandText = "SELECT DISTINCT address FROM JobInfo WHERE companyname = ";
                    switch (Request.QueryString["Name"])
                    {
                        case "moldPro":
                            moldProDropDownList.Visible = true;
                            LLCSelection.ImageUrl = "~/Content/Images/MoldProLogo.jpg";
                            MyCommandText += "'moldPro'";
                            break;
                        case "OTHS":
                            othsDropDownList.Visible = true;
                            LLCSelection.ImageUrl = "~/Content/Images/OTHSLogo.png";
                            MyCommandText += "'OTHS'";
                            break;
                        case "OTR":
                            otrDropDownList.Visible = true;
                            LLCSelection.ImageUrl = "~/Content/Images/OTRLogo.jpg";
                            MyCommandText += "'OTR'";
                            break;
                    }
                    cmd.CommandText = MyCommandText;
                    MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);

                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        protected void submitQuery(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                string MyCommandText = "SELECT firstname, lastname, jobtitle, jobdetails, materials, jobcomplete FROM JobInfo WHERE address = ";

                if (moldProDropDownList.Visible == true)
                {
                    MyCommandText += "'" + moldProDropDownList.Text + "'";
                }
                else if (otrDropDownList.Visible == true)
                {
                    MyCommandText += "'" + otrDropDownList.Text + "'";
                }
                else if (othsDropDownList.Visible == true)
                {
                    MyCommandText += "'" + othsDropDownList.Text + "'";
                }

                cmd.CommandText = MyCommandText;
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                DataSet theData = new DataSet();
                adapter.Fill(theData);
                DataGridView1.DataSource = theData;
                DataGridView1.DataBind();
                DataGridView1.Visible = true;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}