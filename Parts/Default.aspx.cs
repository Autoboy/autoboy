using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Parts_Default : System.Web.UI.Page
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
            GetParts();
            GetModels();
        }
    }

    void GetParts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * from PartTbl";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "PartTbl");
        lvParts.DataSource = ds;
        lvParts.DataBind();
        con.Close();
    }

    void GetModels()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT * from ModelTbl";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "ModelTbl");
        lvModels.DataSource = ds;
        lvModels.DataBind();
        con.Close();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO ModelTbl VALUES (@ModelName)";
        cmd.Parameters.AddWithValue("@ModelName", txtModel.Text);

        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }

    protected void btnAdd1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO PartTbl VALUES (@PartName, @Description)";
        cmd.Parameters.AddWithValue("@PartName", txtPart.Text);
        cmd.Parameters.AddWithValue("@Description", txtDesc.Text);

        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }

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

    //protected void ddlTypes_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    txtSearch.Text = string.Empty;

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
    protected void lvModels_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpModels.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetModels();
    }
    protected void lvParts_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpParts.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetParts();
    }
    protected void lvModels_DataBound(object sender, EventArgs e)
    {
        dpModels.Visible = dpModels.TotalRowCount > dpModels.PageSize;
    }
    protected void lvParts_DataBound(object sender, EventArgs e)
    {
        dpParts.Visible = dpParts.TotalRowCount > dpParts.PageSize;
    }
}