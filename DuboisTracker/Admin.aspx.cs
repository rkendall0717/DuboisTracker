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
        public static GridView GridView1;
        public static Label lbl_password;
        public static TextBox tb_password;
        public static Button btn_submit;
        public static DropDownList ddl_task;

        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1 = (GridView)LoginView1.FindControl("GridView1");
            lbl_password = (Label)LoginView1.FindControl("lbl_password");
            tb_password = (TextBox)LoginView1.FindControl("tb_password");
            btn_submit = (Button)LoginView1.FindControl("btn_submit");
            ddl_task = (DropDownList)LoginView1.FindControl("ddl_task");
        }

        protected void btnSubmit_Clicked(object sender, EventArgs e)
        {
            string strSQLconnection = "Data Source=SQL5007.Smarterasp.net;Initial Catalog=DB_9E00E3_rkendall0717;User Id=DB_9E00E3_rkendall0717_admin;Password=Password1.;";
            SqlConnection sqlConnection = new SqlConnection(strSQLconnection);
            SqlCommand sqlCommand = new SqlCommand("select Email from AspNetUsers", sqlConnection);

            if (tb_password.Text == "Password1.")
            {
                lbl_password.Visible = false;
                tb_password.Visible = false;
                btn_submit.Visible = false;

                if (GridView1 != null)
                {
                    GridView1.Visible = true;
                    sqlConnection.Open();
                    SqlDataReader reader = sqlCommand.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }
            }
            else
            {
                GridView1.Visible = false;
            }
            sqlConnection.Close();
        }
    }
}
