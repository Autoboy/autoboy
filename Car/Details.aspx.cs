using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Car_Details : System.Web.UI.Page
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
                    GetUserTypes();
                    GetInfo(userID);
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }

    void GetUserTypes()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TypeID, UserType FROM UserTypeTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlTypes.DataSource = dr;
        ddlTypes.DataTextField = "UserType";
        ddlTypes.DataValueField = "TypeID";
        ddlTypes.DataBind();
        con.Close();
    }

    void GetInfo(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UID, TypeID, EmailAddress, FirstName, LastName, Street, " +
            "Address, City, MobileNo, Status FROM AccountTbl WHERE UID=@UID";
        cmd.Parameters.AddWithValue("@UID", ID);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                ltID.Text = dr["UID"].ToString();
                ddlStatus.SelectedValue = dr["Status"].ToString();
                ddlTypes.SelectedValue = dr["TypeID"].ToString();
                txtEmail.Text = dr["EmailAddress"].ToString();
                txtFN.Text = dr["FirstName"].ToString();
                txtLN.Text = dr["LastName"].ToString();
                txtStreet.Text = dr["Street"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtCity.Text = dr["City"].ToString();
                txtMobile.Text = dr["MobileNo"].ToString();
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
        if (txtPassword.Text == "")
        {
            cmd.CommandText = "UPDATE AccountTbl SET TypeID=@TypeID, EmailAddress=@EmailAddress, " +
                "FirstName=@FirstName, LastName=@LastName, Street=@Street, " +
                "Address=@Address, City=@City, MobileNo=@MobileNo, Status=@Status " +
                "WHERE UID=@UID";
        }
        else
        {
            cmd.CommandText = "UPDATE AccountTbl SET TypeID=@TypeID, EmailAddress=@EmailAddress, Password=@Password, " +
                "FirstName=@FirstName, LastName=@LastName, Street=@Street, " +
                "Address=@Address, City=@City, MobileNo=@MobileNo, Status=@Status " +
                "WHERE UID=@UID";
        }
        cmd.Parameters.AddWithValue("@TypeID", ddlTypes.SelectedValue);
        cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
        cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
        cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
        cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
        cmd.Parameters.AddWithValue("@Street", txtStreet.Text);
        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@City", txtCity.Text);
        cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
        cmd.Parameters.AddWithValue("@UID", Request.QueryString["ID"].ToString());
        cmd.ExecuteNonQuery();
        con.Close();
        Session["update"] = "yes";
        Response.Redirect("Default.aspx");
    }
}