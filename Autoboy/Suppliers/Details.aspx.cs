using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Suppliers_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int userID = 0;
            bool validUser = int.TryParse(Request.QueryString["ID"].ToString(), out userID);

            if (validUser)
            {
                if (!IsPostBack)
                {
                    GetInfo(userID);
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }


    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierID, Supplier, Street, Municipality, City, EmailAddress, MobileNo FROM SupplierTbl WHERE SupplierID='" + ID + "'";
        cmd.Parameters.AddWithValue("@SupplierID", ID);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                ltID.Text = dr["SupplierID"].ToString();
                txtSupplierName.Text = dr["Supplier"].ToString();
                txtSupplierStreet.Text = dr["Street"].ToString();
                txtSupplierMunicipality.Text = dr["Municipality"].ToString();
                txtSupplierCity.Text = dr["City"].ToString();
                txtSupplierEmail.Text = dr["EmailAddress"].ToString();
                txtSupplierMobileNo.Text = dr["MobileNo"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Default.aspx");
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE SupplierTbl SET Supplier=@SupplierName, Street=@Street, Municipality=@Municipality, City=@City, EmailAddress=@EmailAddress, MobileNo=@MobileNo WHERE SupplierID=@SupplierID";
        cmd.Parameters.AddWithValue("@SupplierName", txtSupplierName.Text);
        cmd.Parameters.AddWithValue("@Street", txtSupplierStreet.Text);
        cmd.Parameters.AddWithValue("@Municipality", txtSupplierMunicipality.Text);
        cmd.Parameters.AddWithValue("@City", txtSupplierCity.Text);
        cmd.Parameters.AddWithValue("@EmailAddress", txtSupplierEmail.Text);
        cmd.Parameters.AddWithValue("@MobileNo", txtSupplierMobileNo.Text);
        cmd.Parameters.AddWithValue("@SupplierID", Request.QueryString["ID"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        Session["update"] = "yes";
        Response.Redirect("Default.aspx");
    }
}