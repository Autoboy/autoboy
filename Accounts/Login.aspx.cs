using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Security;


public partial class Accounts_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {            

        }
    }


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //String password = Membership.GeneratePassword(12, 1);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UID FROM AccountTbl " +
            "WHERE EmailAddress = @Email AND Password = @Password";
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPass.Text));
        SqlDataReader data = cmd.ExecuteReader();

        data.Read();

        if (data["UID"].ToString() != String.Empty)
        {
                Response.Redirect("Default.aspx");
        }

        con.Close();
    }
       
        
}