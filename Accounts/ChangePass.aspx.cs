using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Accounts_ChangePass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            
            

        }
    }

    bool IsExisting(string email)
    {
        bool existing = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Password FROM AccountTbl " +
            "WHERE EmailAddress = @Email";
        cmd.Parameters.AddWithValue("@Email", email);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        bool existing = IsExisting(Helper.CreateSHAHash(txtEmail.Text));

        if (existing)
        {
            //error.Visible = true;
        }
            
        else
        {
            //error.Visible = false;
             if (txtNPass.Text == txtRPass.Text) 
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "UPDATE AccountTbl SET Password = @Password WHERE EmailAddress = @Email";
                cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtNPass.Text));
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Session["update"] = "yes";
                Response.Redirect("Default.aspx");
            }
        }
       
        
    }
}