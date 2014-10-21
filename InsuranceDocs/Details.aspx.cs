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

    /*void GetUserTypes()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TypeID, UserType FROM UserTypeTbl";
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
            }
            con.Close();
        }
        else
        {
           con.Close();
           Response.Redirect("Default.aspx");
        }
    }
    protected void cbORCR_CheckedChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Update InsuranceDocumentTbl Set ORCR = 'yes' WHERE UID=@UID";
        cmd.Parameters.AddWithValue("@UID", Request.QueryString["ID"].ToString());
        SqlDataReader dr = cmd.ExecuteReader();
        con.Close();
    }
    protected void cbInsurance_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void cbAffidavit_CheckedChanged(object sender, EventArgs e)
    {

    }
    protected void cbPhotos_CheckedChanged(object sender, EventArgs e)
    {

    }
}