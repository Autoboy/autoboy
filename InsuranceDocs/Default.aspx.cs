using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

<<<<<<< HEAD
public partial class InsuranceDocs_Default : System.Web.UI.Page
=======
public partial class Accounts_Default : System.Web.UI.Page
>>>>>>> origin/master
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
<<<<<<< HEAD
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
            GetInsurance();
        }
    }

    void GetInsurance()
=======
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
            GetAccounts();
        }
    }

    void GetAccounts()
>>>>>>> origin/master
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
<<<<<<< HEAD
        cmd.CommandText = "SELECT dbo.InsuranceDocumentTbl.InsuranceDocID, dbo.InsuranceDocumentTbl.UID, dbo.AccountTbl.FirstName, dbo.AccountTbl.LastName, dbo.InsuranceDocumentTbl.Status " + 
            "FROM dbo.AccountTbl INNER JOIN dbo.InsuranceDocumentTbl ON dbo.AccountTbl.UID = dbo.InsuranceDocumentTbl.UID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "InsuranceDocumentTbl");
        lvInsuranceDocs.DataSource = ds;
        lvInsuranceDocs.DataBind();
        con.Close();
    }
    
    protected void ddlTypes_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {

    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddlStatus_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }

    protected void lvInsuranceDocs_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
    {
        dpInsuranceDocs.SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
        GetInsurance();
    }
    protected void lvInsuranceDocs_DataBound(object sender, EventArgs e)
    {
        dpInsuranceDocs.Visible = dpInsuranceDocs.TotalRowCount > dpInsuranceDocs.PageSize;
=======
        cmd.CommandText = "SELECT AccountTbl.UID, UserTypeTbl.UserType, AccountTbl.EmailAddress, " +
            "AccountTbl.FirstName, AccountTbl.LastName, AccountTbl.Street, AccountTbl.Address, AccountTbl.City, " +
            "AccountTbl.MobileNo, AccountTbl.Status FROM AccountTbl " +
            "INNER JOIN UserTypeTbl ON AccountTbl.TypeID = UserTypeTbl.TypeID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "AccountTbl");
        lvUsers.DataSource = ds;
        lvUsers.DataBind();
        con.Close();
    }

    void GetAccounts(string keyword)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT AccountTbl.UID, UserTypeTbl.UserType, AccountTbl.EmailAddress, " +
            "AccountTbl.FirstName, AccountTbl.LastName, AccountTbl.Street, AccountTbl.Address, AccountTbl.City, " +
            "AccountTbl.MobileNo, AccountTbl.Status FROM AccountTbl " +
            "INNER JOIN UserTypeTbl ON AccountTbl.TypeID = UserTypeTbl.TypeID " +
            "WHERE AccountTbl.UID LIKE '%" + keyword + "%' OR " +
            "UserTypeTbl.UserType LIKE '%" + keyword + "%' OR " +
            "AccountTbl.EmailAddress LIKE '%" + keyword + "%' OR " +
            "AccountTbl.FirstName LIKE '%" + keyword + "%' OR " +
            "AccountTbl.LastName LIKE '%" + keyword + "%' OR " +
            "AccountTbl.Street LIKE '%" + keyword + "%' OR " +
            "AccountTbl.Address LIKE '%" + keyword + "%' OR " +
            "AccountTbl.City LIKE '%" + keyword + "%' OR " +
            "AccountTbl.MobileNo LIKE '%" + keyword + "%'";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "AccountTbl");
        lvUsers.DataSource = ds;
        lvUsers.DataBind();
        con.Close();
    }

    void GetAccountsByStatus()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT AccountTbl.UID, UserTypeTbl.UserType, AccountTbl.EmailAddress, " +
            "AccountTbl.FirstName, AccountTbl.LastName, AccountTbl.Street, AccountTbl.Address, AccountTbl.City, " +
            "AccountTbl.MobileNo, AccountTbl.Status FROM AccountTbl " +
            "INNER JOIN UserTypeTbl ON AccountTbl.TypeID = UserTypeTbl.TypeID " +
            "WHERE AccountTbl.Status=@Status";
        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "AccountTbl");
        lvUsers.DataSource = ds;
        lvUsers.DataBind();
        con.Close();
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
            GetAccounts();
        else
            GetAccounts(txtSearch.Text);
    }
    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetAccountsByStatus();
>>>>>>> origin/master
    }
}