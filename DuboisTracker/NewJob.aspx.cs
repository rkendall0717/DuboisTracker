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
        public static String myConnectionString = "Server=MYSQL5013.Smarterasp.net;Database=db_9e00e3_info;Uid=9e00e3_info;Pwd=Password1.;";

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

        protected void btnSubmit_Clicked(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;
            // tb_firstName.Visible = false;
            //tb_lastName.Visible = false;
            //btn_submit.Visible = false;
            panel_infoForm.Visible = false;
            
            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                cmd.CommandText = "INSERT INTO JobInfo(firstName, lastName)VALUES(@firstName,@lastName)";
                cmd.Parameters.AddWithValue("@firstName", tb_firstName.Text);
                cmd.Parameters.AddWithValue("@lastName", tb_lastName.Text);
                cmd.ExecuteNonQuery();
            }
            catch(Exception)
            {
                throw;
            }
            finally
            {
                if(connection.State == ConnectionState.Open)
                {
                    connection.Close();
                    LoadData();
                }
            }
        }

        protected void LoadData()
        {
            DataGridView1.Visible = true;
            MySqlConnection connection = new MySqlConnection(myConnectionString);
          
            try
            {
                connection.Open();
                MySqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT * FROM JobInfo";
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
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

        }
    }
}