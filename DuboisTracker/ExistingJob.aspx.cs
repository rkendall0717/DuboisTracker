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
                finally
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
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
                string MyCommandText = "SELECT jobid, firstname, lastname, jobtitle, jobdetails, materials, jobcomplete FROM JobInfo WHERE address = ";

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
                foreach(GridViewRow theRows in DataGridView1.Rows)
                {
                    Button jobClose = (Button)theRows.FindControl("jobCloseButton");
                    Button editJob = (Button)theRows.FindControl("editButton");
                    Button clockIn = (Button)theRows.FindControl("clockInButton");
                    Button clockOut = (Button)theRows.FindControl("clockOutButton");
                    if (theRows.Cells[6].Text == "0")
                    { //Job is open
                        theRows.Cells[6].Text = "Open";
                        jobClose.Visible = true;
                        editJob.Visible = true;
                        clockIn.Visible = true;
                        clockOut.Visible = true;
                    }
                    else
                    { //Job is closed
                        theRows.Cells[6].Text = "Closed";
                        jobClose.Visible = false;
                        editJob.Visible = false;
                        clockIn.Visible = false;
                        clockOut.Visible = false;
                    }
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

        protected void editJobDetails(object sender, EventArgs e)
        {
            //Get row we want to edit
            GridViewRow theRow = (GridViewRow)((Button)sender).NamingContainer;
            string jobId = theRow.Cells[0].Text;
            string firstName = theRow.Cells[1].Text;
            string lastName = theRow.Cells[2].Text;
            string jobTitle = theRow.Cells[3].Text;
            string jobDetails = theRow.Cells[4].Text;
            string materials = theRow.Cells[5].Text;

            //Hide Existing Jobs For Location
            DataGridView1.Visible = false;

            //Disable DropDown from being edited
            if (moldProDropDownList.Visible == true)
                moldProDropDownList.Enabled = false;
            else if (otrDropDownList.Visible == true)
                otrDropDownList.Enabled = false;
            else if (othsDropDownList.Visible == true)
                othsDropDownList.Enabled = false;

            //Hide Submit Button for Location
            Button1.Visible = false;

            //Show Edit Job Panel
            editJobPanel.Visible = true;
            tb_jobId.Text = jobId;
            tb_firstName.Text = firstName;
            tb_lastName.Text = lastName;
            tb_jobTitle.Text = jobTitle;
            tb_jobDetails.Text = jobDetails;
            tb_Materials.Text = materials;
        }

        protected void submitJobChanges(object Sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            editJobPanel.Controls.Clear();
            editJobPanel.Visible = false;

            //Re-enable DropDown to be edited
            if (moldProDropDownList.Visible == true)
                moldProDropDownList.Enabled = true;
            else if (otrDropDownList.Visible == true)
                otrDropDownList.Enabled = true;
            else if (othsDropDownList.Visible == true)
                othsDropDownList.Enabled = true;
            //Re-enable Submit Button
            Button1.Visible = true;

            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                cmd.CommandText = "UPDATE JobInfo SET jobTitle = @jobTitle, jobDetails = @jobDetails, materials = @materials WHERE jobId = @jobId";
                cmd.Parameters.AddWithValue("@jobId", tb_jobId.Text);
                cmd.Parameters.AddWithValue("@jobTitle", tb_jobTitle.Text);
                cmd.Parameters.AddWithValue("@jobDetails", tb_jobDetails.Text);
                cmd.Parameters.AddWithValue("@materials", tb_Materials.Text);
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
        }

        protected void clockInJob(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            //Get row we want to edit
            GridViewRow theRow = (GridViewRow)((Button)sender).NamingContainer;
            string jobId = theRow.Cells[0].Text;

            DataGridView1.Visible = false;

            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                cmd.CommandText = "INSERT INTO timecard(jobId,timeType,timeValue)VALUES(@jobId,@timeType,@timeValue)";
                cmd.Parameters.AddWithValue("@jobId", jobId);
                cmd.Parameters.AddWithValue("@timeType", 0);//Clock In is 0
                cmd.Parameters.AddWithValue("@timeValue", DateTime.Now);
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
        }

        protected void clockOutJob(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            //Get row we want to edit
            GridViewRow theRow = (GridViewRow)((Button)sender).NamingContainer;
            string jobId = theRow.Cells[0].Text;

            DataGridView1.Visible = false;

            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                cmd.CommandText = "INSERT INTO timecard(jobId,timeType,timeValue)VALUES(@jobId,@timeType,@timeValue)";
                cmd.Parameters.AddWithValue("@jobId", jobId);
                cmd.Parameters.AddWithValue("@timeType", 1);//Clock Out is 1
                cmd.Parameters.AddWithValue("@timeValue", DateTime.Now);
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
        }

        protected void closeJob(object sender, EventArgs e)
        {
            MySqlConnection connection = new MySqlConnection(myConnectionString);
            MySqlCommand cmd;

            //Get row we want to edit
            GridViewRow theRow = (GridViewRow)((Button)sender).NamingContainer;
            string jobId = theRow.Cells[0].Text;

            DataGridView1.Visible = false;

            try
            {
                connection.Open();
                cmd = connection.CreateCommand();
                cmd.CommandText = "UPDATE JobInfo SET jobComplete = @jobComplete WHERE jobId = @jobId";
                cmd.Parameters.AddWithValue("@jobId", jobId);
                cmd.Parameters.AddWithValue("@jobComplete", 1);
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
        }
    }
}