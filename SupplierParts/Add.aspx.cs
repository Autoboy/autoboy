using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class SupplierParts_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSuppliers();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    void GetSuppliers()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierID, Supplier FROM SupplierTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlTypes.DataSource = dr;
        ddlTypes.DataTextField = "Supplier";
        ddlTypes.DataValueField = "SupplierID";
        ddlTypes.DataBind();
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO AccountTbl VALUES (@EmailAddress, @Password, @TypeID, " +
            "@FirstName, @LastName, @MobileNo, @Street, @Address, @City, @Status)";
        cmd.Parameters.AddWithValue("@TypeID", ddlTypes.SelectedValue);
        cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
        cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
        cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
        cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
        cmd.Parameters.AddWithValue("@Street", txtStreet.Text);
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@City", txtCity.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}