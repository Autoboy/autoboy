using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Suppliers_Default : System.Web.UI.Page
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
            GetSuppliers();
        }
    }

    void GetSuppliers()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierID, Supplier, Street, Municipality, City, EmailAddress, MobileNo " +
                          "FROM SupplierTbl";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "SupplierTbl");
        lvSuppliers.DataSource = ds;
        lvSuppliers.DataBind();
        con.Close();
    }

    void GetAccounts(string keyword)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierID, Supplier, Street, Municipality, City, EmailAddress, MobileNo " +
            "FROM SupplierTbl " +
            "WHERE SupplierID LIKE '%" + keyword + "%' OR " +
            "Supplier LIKE '%" + keyword + "%' OR " +
            "Street LIKE '%" + keyword + "%' OR " +
            "Municipality LIKE '%" + keyword + "%' OR " +
            "City LIKE '%" + keyword + "%' OR " +
            "EmailAddress LIKE '%" + keyword + "%' OR " +
            "MobileNo LIKE '%" + keyword + "%'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "AccountTbl");
        lvSuppliers.DataSource = ds;
        lvSuppliers.DataBind();
        con.Close();
    }

    void GetAccountsByStatus()
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "SELECT AccountTbl.UID, UserTypeTbl.UserType, AccountTbl.EmailAddress, " +
        //    "AccountTbl.FirstName, AccountTbl.LastName, AccountTbl.Street, AccountTbl.Address, AccountTbl.City, " +
        //    "AccountTbl.MobileNo, AccountTbl.Status FROM AccountTbl " +
        //    "INNER JOIN UserTypeTbl ON AccountTbl.TypeID = UserTypeTbl.TypeID " +
        //    "WHERE AccountTbl.Status=@Status";
        //cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataSet ds = new DataSet();
        //da.Fill(ds, "AccountTbl");
        //lvUsers.DataSource = ds;
        //lvUsers.DataBind();
        //con.Close();
    }

    protected void ddlTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtSearch.Text = string.Empty;

        if (ddlTypes.SelectedIndex == 0)
        {
            keyword.Visible = true;
            status.Visible = false;
        }
        else
        {
            keyword.Visible = false;
            status.Visible = true;
        }
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        if (txtSearch.Text.Trim() == "")
            GetSuppliers();
        else
            GetAccounts(txtSearch.Text);
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetAccountsByStatus();
    }
}