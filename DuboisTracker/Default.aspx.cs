using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    // String variables
    String moldProString = "moldPro";
    String OTHSString = "OTHS";
    String OTRString = "OTR";

    public static RadioButton rb_existingJob;
    public static RadioButton rb_newJob;

    public static Label lbl_selectCompany;
    public static ImageButton MoldPro;
    public static ImageButton OTR;
    public static ImageButton OTHS;

    protected void Page_Load(object sender, EventArgs e)
    {
        rb_existingJob = (RadioButton)LoginView1.FindControl("rb_existingJob");
        rb_newJob = (RadioButton)LoginView1.FindControl("rb_newJob");

        lbl_selectCompany = (Label)LoginView1.FindControl("lbl_selectYourCompany");
        MoldPro = (ImageButton)LoginView1.FindControl("MoldPro");
        OTR = (ImageButton)LoginView1.FindControl("OTR");
        OTHS = (ImageButton)LoginView1.FindControl("OTHS");


    }

    protected void rb_selectionChanged(object sender, EventArgs e)
    {
        if (rb_existingJob.Checked || rb_newJob.Checked)
        {
            lbl_selectCompany.Visible = true;
            MoldPro.Visible = true;
            OTR.Visible = true;
            OTHS.Visible = true;
        }
        else
        {
            lbl_selectCompany.Visible = true;
            MoldPro.Visible = false;
            OTR.Visible = false;
            OTHS.Visible = false;
        }
    }

    protected void btnNewEntry_Click(object sender, EventArgs e)
    {
        if (sender == MoldPro && rb_newJob.Checked)
        {
            // moldProIsSelected = true;
            Response.Redirect("NewJob.aspx?Name=" + moldProString);
        }
        else if (sender == OTHS && rb_newJob.Checked)
        {
            //OTHSIsSelected = true;
            Response.Redirect("NewJob.aspx?Name=" + OTHSString); ;
        }
        else if (sender == OTR && rb_newJob.Checked)
        {
            //OTRIsSelected = true;
            Response.Redirect("NewJob.aspx?Name=" + OTRString);
        }
        else if (sender == MoldPro && rb_existingJob.Checked)
        {
            //OTHSIsSelected = true;
            Response.Redirect("ExistingJob.aspx?Name=" + moldProString); ;
        }
        else if (sender == OTHS && rb_existingJob.Checked)
        {
            //OTRIsSelected = true;
            Response.Redirect("ExistingJob.aspx?Name=" + OTHSString);
        }
        else if (sender == OTR && rb_existingJob.Checked)
        {
            //OTRIsSelected = true;
            Response.Redirect("ExistingJob.aspx?Name=" + OTRString);
        }

    }

}