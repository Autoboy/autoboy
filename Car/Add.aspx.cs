using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Car_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetUserID();
            GetModel();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    void GetUserID()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT UID, EmailAddress FROM AccountTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlAccount.DataSource = dr;
        ddlAccount.DataTextField = "EmailAddress";
        ddlAccount.DataValueField = "UID";
        ddlAccount.DataBind();
        con.Close();
    }

    void GetModel()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT ModelID, ModelName FROM ModelTbl";
        SqlDataReader data = cmd.ExecuteReader();
        ddlModel.DataSource = data;
        ddlModel.DataTextField = "ModelName";
        ddlModel.DataValueField = "ModelID";
        ddlModel.DataBind();
        con.Close();

    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO CarTbl VALUES (@ChassisNo, @PlateNo, @ModelID, " +
            "@Year, @UID, @Status)";
        
        cmd.Parameters.AddWithValue("@ChassisNo", txtChassisNo.Text);
        cmd.Parameters.AddWithValue("@PlateNo", txtPlateNo.Text);
        cmd.Parameters.AddWithValue("@ModelID", ddlModel.SelectedValue);
        cmd.Parameters.AddWithValue("@Year", txtYear.Text);
        cmd.Parameters.AddWithValue("@UID", ddlAccount.SelectedValue);
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}