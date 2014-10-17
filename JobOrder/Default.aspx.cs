using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class JobOrder_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetJO();
        }
    }

    void GetJO()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT     dbo.OrderTbl.TransactionNumber, dbo.AccountTbl.FirstName + ' ' + dbo.AccountTbl.LastName AS FullName, dbo.CarTbl.PlateNo, dbo.ModelTbl.ModelName + ' ' + dbo.CarTbl.Year AS Car, " +
            "dbo.OrderTbl.OrderDate, dbo.OrderTbl.Status " +
            "FROM dbo.AccountTbl INNER JOIN " +
            "dbo.OrderTbl ON dbo.AccountTbl.UID = dbo.OrderTbl.UID INNER JOIN " +
            "dbo.CarTbl ON dbo.AccountTbl.UID = dbo.CarTbl.UID INNER JOIN " +
            "dbo.ModelTbl ON dbo.CarTbl.ModelID = dbo.ModelTbl.ModelID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "PurchaseOrderTbl");
        lvJO.DataSource = ds;
        lvJO.DataBind();
        con.Close();
    }
    
}