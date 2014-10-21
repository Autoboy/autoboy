using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class InsuranceDocs_Default : System.Web.UI.Page
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
            GetInsurance();
        }
    }

    void GetInsurance()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
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
    }
}