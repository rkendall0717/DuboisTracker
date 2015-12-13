using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace DuboisTracker
{
    public partial class NewJob : Page
    {
        public static Panel panel_infoForm;
        public static TextBox tb_company;
        public static TextBox tb_firstName;
        public static TextBox tb_lastName;
        public static TextBox tb_address;
        public static TextBox tb_city;
        public static TextBox tb_state;
        public static TextBox tb_location;
        public static TextBox tb_jobTitle;
        public static TextBox tb_jobDetails;
        public static TextBox tb_materials;

        public static String myConnectionString = "Server=MYSQL5013.Smarterasp.net;Database=db_9e00e3_info;Uid=9e00e3_info;Pwd=Password1.;";
        public static Label lbl_confirmation = new Label();
        public static HyperLink reload = new HyperLink();

        protected void Page_Load(object sender, EventArgs e)
        {
            panel_infoForm = (Panel)LoginView1.FindControl("panel_infoForm");
            tb_company = (TextBox)LoginView1.FindControl("tb_company");
            tb_firstName = (TextBox)LoginView1.FindControl("tb_firstName");
            tb_lastName = (TextBox)LoginView1.FindControl("tb_lastName");
            tb_address = (TextBox)LoginView1.FindControl("tb_address");
            tb_city = (TextBox)LoginView1.FindControl("tb_city");
            tb_state = (TextBox)LoginView1.FindControl("tb_state");
            tb_location = (TextBox)LoginView1.FindControl("tb_location");
            tb_jobTitle = (TextBox)LoginView1.FindControl("tb_jobTitle");
            tb_jobDetails = (TextBox)LoginView1.FindControl("tb_jobDetails");
            tb_materials = (TextBox)LoginView1.FindControl("tb_materials");

            // set up confirmation label 
            lbl_confirmation.Text = "Job has been successfully submitted. <br/> <br/>";
            lbl_confirmation.Font.Size = 30;

            // set up reload hyperlink 
            reload.Text = "Return to Home";
            reload.NavigateUrl = "~/Default.aspx";


            // method that sets up page according to previously selected LLC
            if (Request.QueryString["Name"] != null)
            {
                if (Request.QueryString["Name"] == "moldPro")
                {
                    tb_company.Text = "moldPro";
                }
                else if (Request.QueryString["Name"] == "OTHS")
                {
                    tb_company.Text = "OTHS";
                }
                else if (Request.QueryString["Name"] == "OTR")
                {
                    tb_company.Text = "OTR";
                }
            }
        }

        protected void btnSubmit_Clicked(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            panel_infoForm.Controls.Clear();

            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                cmd.CommandText = "INSERT INTO JobInfo(companyName,firstName,lastName,address,city,state,location,jobTitle,jobDetails,materials,jobComplete)VALUES(@company,@firstName,@lastName,@address,@city,@state,@location,@jobTitle,@jobDetails,@materials,@jobComplete)";
                cmd.Parameters.AddWithValue("@company", tb_company.Text);
                cmd.Parameters.AddWithValue("@firstName", tb_firstName.Text);
                cmd.Parameters.AddWithValue("@lastName", tb_lastName.Text);
                cmd.Parameters.AddWithValue("@address", tb_address.Text);
                cmd.Parameters.AddWithValue("@city", tb_city.Text);
                cmd.Parameters.AddWithValue("@state", tb_state.Text);
                cmd.Parameters.AddWithValue("@location", tb_location.Text);
                cmd.Parameters.AddWithValue("@jobTitle", tb_jobTitle.Text);
                cmd.Parameters.AddWithValue("@jobDetails", tb_jobDetails.Text);
                cmd.Parameters.AddWithValue("@materials", tb_materials.Text);
                cmd.Parameters.AddWithValue("@jobComplete", 0);
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (connection.State == ConnectionState.Open)
                {
                    connection.Close();
                }
            }

            panel_infoForm.Controls.Add(lbl_confirmation);
            panel_infoForm.Controls.Add(reload);
        }
    }
}