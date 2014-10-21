using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Security;


public partial class Accounts_ChangePass : System.Web.UI.Page
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
        //String password = Membership.GeneratePassword(12, 1);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UID FROM AccountTbl " +
            "WHERE EmailAddress = @Email AND Password = @Password";
        cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPass.Text));
        SqlDataReader data = cmd.ExecuteReader();

        if (data.HasRows)
        {
            while (data.Read()) ;
            {
                if (data["UID"].ToString() != String.Empty)
                {
                    if (txtNPass.Text == txtRPass.Text)
                    {
                        data.Close();
                        cmd.CommandText = "UPDATE AccountTbl SET Password = @Passwrd WHERE EmailAddress = @foo";
                        cmd.Parameters.AddWithValue("@Passwrd", Helper.CreateSHAHash(txtNPass.Text));
                        cmd.Parameters.AddWithValue("@foo", txtEmail.Text);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        Session["update"] = "yes";
                        Response.Redirect("Default.aspx");
                    }
                    con.Close();
                    Response.Redirect("~/Accounts/Default.aspx");
                }
            }
        }
        
        else
        {
            con.Close();
        }
    }
       
        
}