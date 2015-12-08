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
        public static GridView DataGridView1;
        public static GridView GridView1;
        public static Label lbl_password;
        public static Label lbl_deleteUser;
        public static TextBox tb_password;
        public static DropDownList ddl_userToDelete;
        public static Button btn_submit;
        public static Button btn_submitView;
        public static Button btn_deleteUser;
        public static DropDownList ddl_task;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataGridView1 = (GridView)LoginView1.FindControl("DataGridView1");
            GridView1 = (GridView)LoginView1.FindControl("GridView1");
            lbl_password = (Label)LoginView1.FindControl("lbl_password");
            lbl_deleteUser = (Label)LoginView1.FindControl("lbl_deleteUser");
            tb_password = (TextBox)LoginView1.FindControl("tb_password");
            ddl_userToDelete = (DropDownList)LoginView1.FindControl("ddl_userToDelete");
            btn_deleteUser = (Button)LoginView1.FindControl("btn_deleteUser");
            btn_submit = (Button)LoginView1.FindControl("btn_submit");
            btn_submitView = (Button)LoginView1.FindControl("btn_submitView");
            ddl_task = (DropDownList)LoginView1.FindControl("ddl_task");
        }

        protected void btnSubmit_Clicked(object sender, EventArgs e)
        {
            if (tb_password.Text == "Password1.")
            {
                lbl_password.Visible = false;
                tb_password.Visible = false;
                btn_submit.Visible = false;

                ddl_task.Visible = true;
                btn_submitView.Visible = true;
            }
        }

        protected void btnSubmitView_Clicked(object sender, EventArgs e)
        {         
            if (ddl_task.SelectedValue == "View/Update Users")
            {
                // toggle information views
                DataGridView1.Visible = false;
                lbl_deleteUser.Visible = true;
                ddl_userToDelete.Visible = true;
                btn_deleteUser.Visible = true;

                ViewUpdateUsers();
            }
            else if (ddl_task.SelectedValue == "View Jobs")
            {
                GridView1.Visible = false;
                lbl_deleteUser.Visible = false;
                ddl_userToDelete.Visible = false;
                btn_deleteUser.Visible = false;
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
                GridView1.Visible = true;
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

            DataGridView1.Visible = true;
            MySqlConnection connection = new MySqlConnection(myConnectionString);

            try
            {
                connection.Open();
                MySqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT * FROM JobInfo";
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);

                foreach (GridViewRow theRows in DataGridView1.Rows)
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
