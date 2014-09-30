using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Query_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int QueryID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out QueryID);

            if (validUser)
            {
                if (!IsPostBack)
                {
                    GetQuery(QueryID);
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }

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

    void GetQuery(int QueryID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT QueryID, Subject, Query, Pic1, Pic2, Pic3, " +
            "Docs, QueryDate, QueryReadDate, EmailAddress, Status FROM QueryTbl WHERE QueryID=@QueryID";
        cmd.Parameters.AddWithValue("@QueryID", QueryID);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                lblID.Text = dr["QueryID"].ToString();
                lblSubject.Text = dr["Subject"].ToString();
                lblQuery.Text = dr["Query"].ToString();
                btnPic1.PostBackUrl = "~/Images/" + dr["Pic1"].ToString();
                btnPic2.PostBackUrl = "~/Images/" + dr["Pic2"].ToString();
                btnPic3.PostBackUrl = "~/Images/" + dr["Pic3"].ToString();
                btnDoc.PostBackUrl = "~/Images/" + dr["Docs"].ToString();
                lblQueryDate.Text = dr["QueryDate"].ToString();
                lblQueryReadDate.Text = dr["QueryReadDate"].ToString();
                lblEmail.Text = dr["EmailAddress"].ToString();
                lblStatus.Text = dr["Status"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Default.aspx");
        }
    }
}