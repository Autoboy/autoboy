using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Suppliers_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

    

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO SupplierTbl VALUES (@Supplier, @Street, @Municipality, " +
            "@City, @EmailAddress, @MobileNo)";
        cmd.Parameters.AddWithValue("@Supplier", txtSupplierName.Text);
        cmd.Parameters.AddWithValue("@Street", txtSupplierStreet.Text);
        cmd.Parameters.AddWithValue("@Municipality", txtSupplierMunicipality.Text);
        cmd.Parameters.AddWithValue("@City", txtSupplierCity.Text);
        cmd.Parameters.AddWithValue("@EmailAddress", txtSupplierEmail.Text);
        cmd.Parameters.AddWithValue("@MobileNo", txtSupplierMobile.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}