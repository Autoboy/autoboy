using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Parts_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //GetUserTypes();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO ModelTbl VALUES (@ModelName)";
        cmd.Parameters.AddWithValue("@ModelName", txtModel.Text);

        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }

    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO PartTbl VALUES (@PartName, @Description)";
        cmd.Parameters.AddWithValue("@PartName", txtPart.Text);
        cmd.Parameters.AddWithValue("@Description", txtDesc.Text);
        
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}