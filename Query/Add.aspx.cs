using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Query_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //GetUserID();
            //GetModel();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    /*void GetUserID()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UID, EmailAddress FROM AccountTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlAccount.DataSource = dr;
        ddlAccount.DataTextField = "EmailAddress";
        ddlAccount.DataValueField = "UID";
        ddlAccount.DataBind();
        con.Close();
    }

    void GetModel()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT ModelID, ModelName FROM ModelTbl";
        SqlDataReader data = cmd.ExecuteReader();
        ddlModel.DataSource = data;
        ddlModel.DataTextField = "ModelName";
        ddlModel.DataValueField = "ModelID";
        ddlModel.DataBind();
        con.Close();

    }*/

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO QueryTbl VALUES (@Subject, @Query, @Pic1, " +
            "@Pic2, @Pic3, @Docs, @QueryDate, @QueryReadDate, @EmailAddress, @Status)";
        
        cmd.Parameters.AddWithValue("@Subject", txtSubject.Text);
        cmd.Parameters.AddWithValue("@QueryDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Query", txtDescription.Text);
        if (fuPic1.HasFile)
        {
            cmd.Parameters.AddWithValue("@Pic1", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic1.FileName);
            fuPic1.SaveAs(Server.MapPath("~/Images/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic1.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Pic1", String.Empty);
        }
        if (fuPic2.HasFile)
        {
            cmd.Parameters.AddWithValue("@Pic2", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic2.FileName);
            fuPic2.SaveAs(Server.MapPath("~/Images/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic2.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Pic2", String.Empty);
        }
        if (fuPic3.HasFile)
        {
            cmd.Parameters.AddWithValue("@Pic3", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic3.FileName);
            fuPic3.SaveAs(Server.MapPath("~/Images/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic3.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Pic3", String.Empty);
        }
        if (fuDoc1.HasFile)
        {
            cmd.Parameters.AddWithValue("@Docs", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuDoc1.FileName);
            fuDoc1.SaveAs(Server.MapPath("~/Images/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuDoc1.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Docs", String.Empty);
        }
        cmd.Parameters.AddWithValue("@Status", "Pending");
        cmd.Parameters.AddWithValue("@QueryReadDate", DBNull.Value);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}