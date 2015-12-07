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
        public static Label lbl_confirmation = new Label();

        protected void Page_Load(object sender, EventArgs e)
        {
            // set up confirmation label
            lbl_confirmation.Text = "Job has been successfully submitted. <br/> <br/>";
            lbl_confirmation.Font.Size = 30;

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
                cmd.CommandText = "INSERT INTO JobInfo(companyName,firstName,lastName,address,city,state,jobTitle,jobDetails,materials, jobComplete)VALUES(@company,@firstName,@lastName,@address,@city,@state,@jobTitle,@jobDetails,@materials,@jobComplete)";
                cmd.Parameters.AddWithValue("@company", tb_company.Text);
                cmd.Parameters.AddWithValue("@firstName", tb_firstName.Text);
                cmd.Parameters.AddWithValue("@lastName", tb_lastName.Text);
                cmd.Parameters.AddWithValue("@address", tb_address.Text);
                cmd.Parameters.AddWithValue("@city", tb_city.Text);
                cmd.Parameters.AddWithValue("@state", tb_state.Text);
                cmd.Parameters.AddWithValue("@jobTitle", tb_jobTitle.Text);
                cmd.Parameters.AddWithValue("@jobDetails", tb_jobDetails.Text);
                cmd.Parameters.AddWithValue("@materials", tb_Materials.Text);
                cmd.Parameters.AddWithValue("@jobComplete", 0);
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

            panel_infoForm.Controls.Add(lbl_confirmation);
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

                foreach(GridViewRow theRows in DataGridView1.Rows)
                {
                    if (theRows.Cells[10].Text == "0")
                        theRows.Cells[10].Text = "Open";
                    else
                        theRows.Cells[10].Text = "Closed";
                }
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