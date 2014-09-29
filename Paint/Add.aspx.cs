using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Paint_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSupplier();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    void GetSupplier()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierID, Supplier FROM SupplierTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlSupplier.DataSource = dr;
        ddlSupplier.DataTextField = "Supplier";
        ddlSupplier.DataValueField = "SupplierID";
        ddlSupplier.DataBind();
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO PaintTbl VALUES (@Color, @SupplierID)";
        
        cmd.Parameters.AddWithValue("@Color", txtColor.Text);
        cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
        
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}