using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class JobOrderDetails_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUserType();
        }
    }
    void GetUserType()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TypeID, UserType FROM UserTypeTbl WHERE TypeID = 4 OR TypeID = 5";
        SqlDataReader data = cmd.ExecuteReader();
        ddlCustomerType.DataSource = data;
        ddlCustomerType.DataTextField = "UserType";
        ddlCustomerType.DataValueField = "TypeID";
        ddlCustomerType.DataBind();
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO AccountTbl (EmailAddress,TypeID,FirstName,LastName) VALUES (@EmailAddress,@TypeID,@FirstName,@LastName);";
        cmd.Parameters.AddWithValue("@EmailAddress",txtEmail.Text);
        cmd.Parameters.AddWithValue("@TypeID", ddlCustomerType.SelectedValue);
        cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
        cmd.ExecuteNonQuery();
        con.Close();
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "SELECT TOP 1 UID FROM AccountTbl ORDER BY UID DESC;";
        int userID = (int)com.ExecuteScalar();
        con.Close();
        Session["customerid"] = userID.ToString();
        Response.Redirect("AddCar.aspx");
    }

    
    


   

}