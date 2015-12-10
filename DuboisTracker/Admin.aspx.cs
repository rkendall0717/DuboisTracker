using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Data.Sql;
using System.Data.SqlClient;

namespace DuboisTracker
{
    public partial class Admin : Page
    {
        public static Panel panel_passwordSubmit;
        public static Panel panel_ddlTask;
        public static Panel panel_viewUpdateUsers;
        public static GridView dgv_jobInfo;
        public static GridView GridView1;
        public static TextBox tb_password;
        public static DropDownList ddl_userToDelete;
        public static DropDownList ddl_task;


        protected void Page_Load(object sender, EventArgs e)
        {
            panel_passwordSubmit = (Panel)LoginView1.FindControl("panel_passwordSubmit");
            panel_ddlTask = (Panel)LoginView1.FindControl("panel_ddlTask");
            panel_viewUpdateUsers = (Panel)LoginView1.FindControl("panel_viewUpdateUsers");
            dgv_jobInfo = (GridView)LoginView1.FindControl("dgv_jobInfo");
            GridView1 = (GridView)LoginView1.FindControl("GridView1");
            tb_password = (TextBox)LoginView1.FindControl("tb_password");
            ddl_userToDelete = (DropDownList)LoginView1.FindControl("ddl_userToDelete");
            ddl_task = (DropDownList)LoginView1.FindControl("ddl_task");
        }

        protected void btnSubmit_Clicked(object sender, EventArgs e)
        {
            if (tb_password.Text == "Password1.")
            {
                panel_passwordSubmit.Attributes.Add("style", "display:none");
                panel_ddlTask.Attributes.Add("style", "display:block");
            }
        }

        protected void btnSubmitView_Clicked(object sender, EventArgs e)
        {
            if (ddl_task.SelectedValue == "View/Update Users")
            {
                // toggle information views
                dgv_jobInfo.Visible = false;
                panel_viewUpdateUsers.Attributes.Add("style", "display:block");

                ViewUpdateUsers();
            }
            else if (ddl_task.SelectedValue == "View Jobs")
            {
                panel_viewUpdateUsers.Attributes.Add("style", "display:none");

                LoadData();
            }
        }

        protected void ViewUpdateUsers()
        {
            ddl_userToDelete.DataSourceID = "UserInfo";
            ddl_userToDelete.DataTextField = "Email";
            ddl_userToDelete.DataValueField = "Email";

            string strSQLconnection = "Data Source=SQL5007.Smarterasp.net;Initial Catalog=DB_9E00E3_rkendall0717;User Id=DB_9E00E3_rkendall0717_admin;Password=Password1.;";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
            SqlCommand sqlCommand = new SqlCommand("select Email from AspNetUsers", sqlConnection);


            if (GridView1 != null)
            {
                sqlConnection.Open();
                SqlDataReader reader = sqlCommand.ExecuteReader();
                GridView1.DataSource = reader;
                GridView1.DataBind();
            }
            sqlConnection.Close();
        }

        protected void LoadData()
        {
            String myConnectionString = "Server=MYSQL5013.Smarterasp.net;Database=db_9e00e3_info;Uid=9e00e3_info;Pwd=Password1.;";

            dgv_jobInfo.Visible = true;
            MySqlConnection connection = new MySqlConnection(myConnectionString);

            try
            {
                connection.Open();
                MySqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT * FROM JobInfo";
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);

                foreach (GridViewRow theRows in dgv_jobInfo.Rows)
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

        protected void DeleteUser(object sender, EventArgs e)
        {
            string strSQLconnection = "Data Source=SQL5007.Smarterasp.net;Initial Catalog=DB_9E00E3_rkendall0717;User Id=DB_9E00E3_rkendall0717_admin;Password=Password1.;";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DELETE FROM AspNetUsers WHERE email= '" + ddl_userToDelete.SelectedValue + "'";
            cmd.Connection = sqlConnection;
            sqlConnection.Open();
            cmd.ExecuteNonQuery();
            sqlConnection.Close();

            ViewUpdateUsers();
        }
    }
}
