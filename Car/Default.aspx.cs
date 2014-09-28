using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Car_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["add"] != null)
        //{
        //    add.Visible = true;
        //    Session.Remove("add");
        //}
        //else if (Session["update"] != null)
        //{
        //    update.Visible = true;
        //    Session.Remove("update");
        //}
        //else if (Session["delete"] != null)
        //{
        //    delete.Visible = true;
        //    Session.Remove("delete");
        //}
        //else
        //{
        //    add.Visible = false;
        //    update.Visible = false;
        //    delete.Visible = false;
        //}

        if (!IsPostBack)
        {
            GetCars();
        }
    }

    void GetCars()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT CarTbl.ChassisNo, CarTbl.PlateNo, ModelTbl.ModelName, " +
        "CarTbl.[Year], AccountTbl.FirstName, AccountTbl.LastName, CarTbl.Status FROM CarTbl " +
        "INNER JOIN AccountTbl ON CarTbl.UID = AccountTbl.UID " +
        "INNER JOIN ModelTbl ON CarTbl.ModelID = ModelTbl.ModelID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "CarTbl");
        lvCars.DataSource = ds;
        lvCars.DataBind();
        con.Close();
    }
    //
    //void GetAccounts(string keyword)
    //{
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandText = "SELECT AccountTbl.UID, UserTypeTbl.UserType, AccountTbl.EmailAddress, " +
    //        "AccountTbl.FirstName, AccountTbl.LastName, AccountTbl.Street, AccountTbl.Address, AccountTbl.City, " +
    //        "AccountTbl.MobileNo, AccountTbl.Status FROM AccountTbl " +
    //        "INNER JOIN UserTypeTbl ON AccountTbl.TypeID = UserTypeTbl.TypeID " +
    //        "WHERE AccountTbl.UID LIKE '%" + keyword + "%' OR " +
    //        "UserTypeTbl.UserType LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.EmailAddress LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.FirstName LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.LastName LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.Street LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.Address LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.City LIKE '%" + keyword + "%' OR " +
    //        "AccountTbl.MobileNo LIKE '%" + keyword + "%'";
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds, "AccountTbl");
    //    lvUsers.DataSource = ds;
    //    lvUsers.DataBind();
    //    con.Close();
    //}
    //
    //void GetAccountsByStatus()
    //{
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandText = "SELECT AccountTbl.UID, UserTypeTbl.UserType, AccountTbl.EmailAddress, " +
    //        "AccountTbl.FirstName, AccountTbl.LastName, AccountTbl.Street, AccountTbl.Address, AccountTbl.City, " +
    //        "AccountTbl.MobileNo, AccountTbl.Status FROM AccountTbl " +
    //        "INNER JOIN UserTypeTbl ON AccountTbl.TypeID = UserTypeTbl.TypeID " +
    //        "WHERE AccountTbl.Status=@Status";
    //    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
    //    SqlDataAdapter da = new SqlDataAdapter(cmd);
    //    DataSet ds = new DataSet();
    //    da.Fill(ds, "AccountTbl");
    //    lvUsers.DataSource = ds;
    //    lvUsers.DataBind();
    //    con.Close();
    //}
    //
    //protected void ddlTypes_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    txtSearch.Text = string.Empty;
    //
    //    if (ddlTypes.SelectedIndex == 0)
    //    {
    //        keyword.Visible = true;
    //        status.Visible = false;
    //    }
    //    else
    //    {
    //        keyword.Visible = false;
    //        status.Visible = true;
    //    }
    //}
    //protected void txtSearch_TextChanged(object sender, EventArgs e)
    //{
    //    if (txtSearch.Text.Trim() == "")
    //        GetAccounts();
    //    else
    //        GetAccounts(txtSearch.Text);
    //}
    //protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    GetAccountsByStatus();
    //}
}