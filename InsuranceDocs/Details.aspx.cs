using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class InsuranceDocs_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int UID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out UID);

            if (validUser)
            {
                if (!IsPostBack)
                {
                    GetInsurance(UID);                    
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");

    }

    /*void GetLiteral()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UID FROM InsuranceDocumentTbl ";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlTypes.DataSource = dr;
        ddlTypes.DataTextField = "UserType";
        ddlTypes.DataValueField = "TypeID";
        ddlTypes.DataBind();
        con.Close();
    }*/

    void GetInsurance(int UID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT InsuranceDocID, UID, License, PicLicense, ORCR, PicORCR, " +
            "Affidavit, PicAffidavit, DateSubmitted, DateModified, Photos, " + 
            "Photo1, Photo2, Photo3, Status FROM InsuranceDocumentTbl WHERE UID=@UID";
        cmd.Parameters.AddWithValue("@UID", UID);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                hlkLicense.NavigateUrl = "~/Images/InsuranceDocs/License/" + dr["PicLicense"].ToString();
                hlkORCR.NavigateUrl = "~/Images/InsuranceDocs/ORCR/" + dr["PicORCR"].ToString();
                hlkAffidavit.NavigateUrl = "~/Images/InsuranceDocs/Affidavit/" + dr["PicAffidavit"].ToString();
                hlkPhoto1.NavigateUrl = "~/Images/InsuranceDocs/Photos/" + dr["Photo1"].ToString();
                hlkPhoto1.NavigateUrl = "~/Images/InsuranceDocs/Photos/" + dr["Photo2"].ToString();
                hlkPhoto1.NavigateUrl = "~/Images/InsuranceDocs/Photos/" + dr["Photo3"].ToString();

                if (dr["License"].ToString() == "Yes")
                    cbLicense.Checked = true;
                else
                    cbLicense.Checked = false;
                if (dr["PicLicense"].ToString() == "")
                    hlkLicense.Visible = false;
                else
                    hlkLicense.Visible = true;
                
                if (dr["ORCR"].ToString() == "Yes")
                    cbORCR.Checked = true;
                else
                    cbORCR.Checked = false;
                if (dr["PicORCR"].ToString() == "")
                    hlkORCR.Visible = false;
                else
                    hlkORCR.Visible = true;
                
                if (dr["Affidavit"].ToString() == "Yes")
                    cbAffidavit.Checked = true;
                else
                    cbAffidavit.Checked = false;
                if (dr["PicAffidavit"].ToString() == "")
                    hlkAffidavit.Visible = false;
                else
                    hlkAffidavit.Visible = true;

                if (dr["Photos"].ToString() == "Yes")
                    cbPhotos.Checked = true;
                else
                    cbPhotos.Checked = false;
                if (dr["Photo1"].ToString() == "")
                    hlkPhoto1.Visible = false;
                else
                    hlkPhoto1.Visible = true;
                if (dr["Photo2"].ToString() == "")
                    hlkPhoto2.Visible = false;
                else
                    hlkPhoto2.Visible = true;
                if (dr["Photo3"].ToString() == "")
                    hlkPhoto3.Visible = false;
                else
                    hlkPhoto3.Visible = true;
            }
            con.Close();
        }
        else
        {
           con.Close();
           Response.Redirect("Default.aspx");
        }
    }
    protected void UpdateChecklist(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Update InsuranceDocumentTbl Set License = @License, ORCR = @ORCR, Affidavit = @Affidavit, Photos = @Photos, Status=@Status " +
            "WHERE UID=@UID";

        if (cbLicense.Checked && cbORCR.Checked && cbAffidavit.Checked && cbPhotos.Checked)
            cmd.Parameters.AddWithValue("@Status", "Complete");
        else
            cmd.Parameters.AddWithValue("@Status", "Incomplete");

        if (cbLicense.Checked)
        {
            cmd.Parameters.AddWithValue("@License", "Yes");
        }
        else
        {
            cmd.Parameters.AddWithValue("@License", "Yes");
        }
        if (cbORCR.Checked)
        {
            cmd.Parameters.AddWithValue("@ORCR", "Yes");
        }
        else
        {
            cmd.Parameters.AddWithValue("@ORCR", "No");
        }
        if (cbAffidavit.Checked)
        {
            cmd.Parameters.AddWithValue(@"Affidavit", "Yes");
        }
        else
        {
            cmd.Parameters.AddWithValue("@Affidavit", "No");
        }
        if (cbPhotos.Checked)
        {
            cmd.Parameters.AddWithValue("@Photos", "Yes");
        }
        else
        {
            cmd.Parameters.AddWithValue("@Photos", "No");
        }
        cmd.Parameters.AddWithValue("@UID", Request.QueryString["ID"].ToString());
        SqlDataReader dr = cmd.ExecuteReader();
        con.Close();
    }
}