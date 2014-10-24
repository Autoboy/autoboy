using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class SupplierParts_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["add"] != null)
        {
            add.Visible = true;
            Session.Remove("add");
        }
        else if (Session["update"] != null)
        {
            update.Visible = true;
            Session.Remove("update");
        }
        else if (Session["delete"] != null)
        {
            delete.Visible = true;
            Session.Remove("delete");
        }
        else
        {
            add.Visible = false;
            update.Visible = false;
            delete.Visible = false;
        }

        if (!IsPostBack)
        {
            GetSpecific();
            GetSupplier();
        }
    }

    void GetSupplier()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierID, Supplier FROM SupplierTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlSupplier.DataSource = dr;
        ddlSupplier.DataTextField = "Supplier";
        ddlSupplier.DataValueField = "SupplierID";
        ddlSupplier.DataBind();
        con.Close();


    }

    void GetSpecific()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierPartsTbl.RefID, SpecificTbl.SpecificID, PartTbl.PartName, ModelTbl.ModelName, SpecificTbl.[Year], " +
        "SpecificTbl.EstPrice, SpecificTbl.EstTime FROM SpecificTbl " +
        "INNER JOIN PartTbl ON SpecificTbl.PartID = PartTbl.PartID " +
        "INNER JOIN ModelTbl ON SpecificTbl.ModelID = ModelTbl.ModelID " +
        "INNER JOIN SupplierPartsTbl ON SupplierPartsTbl.SpecificID = SpecificTbl.SpecificID " +
        "WHERE SupplierPartsTbl.SupplierID = @SupplierID";
        cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
        SqlDataReader dr = cmd.ExecuteReader();
        lvSupplierParts.DataSource = dr;
        lvSupplierParts.DataBind();
        con.Close();
    }


    void GetParts(string keyword)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierPartsTbl.RefID, SpecificTbl.[Year] " +
        "FROM SpecificTbl " +
        "INNER JOIN SupplierPartsTbl ON SpecificTbl.SpecificID = SupplierPartTbl.SpecificID " + 
        "WHERE ModelTbl.ModelName LIKE '%" + keyword + "%' OR " + 
        "AND SupplierPartsTbl.SupplierID = @SupplierID";
        cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
        SqlDataReader dr = cmd.ExecuteReader();
        lvSupplierParts.DataSource = dr;
        lvSupplierParts.DataBind();
        con.Close();
        
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
    protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSpecific();
    }
    protected void txtSearchCar_TextChanged(object sender, EventArgs e)
    {
        if (txtSearchCar.Text.Trim() == "")
            GetSpecific();
        else
            GetParts(txtSearchCar.Text);
    }
}