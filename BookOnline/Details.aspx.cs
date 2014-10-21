using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class PurchaseOrder_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["PONumber"] != null)
        {
            int PONO = 0;
            bool validPONumber = int.TryParse(Request.QueryString["PONumber"].ToString(), out PONO);

            if (validPONumber)
            {
                if (!IsPostBack)
                {
                    GetPOItem(PONO);
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }


    void GetPOItem(int PONO)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT dbo.PurchaseOrderTbl.POID, dbo.ModelTbl.ModelName + ', ' + dbo.PartTbl.PartName AS Specific, dbo.SpecificTbl.EstPrice, dbo.PurchaseOrderTbl.Qty, dbo.PurchaseOrderTbl.TotalPrice " +
            "FROM dbo.PurchaseOrderTbl INNER JOIN " +
            "dbo.SpecificTbl ON dbo.PurchaseOrderTbl.SpecificID = dbo.SpecificTbl.SpecificID INNER JOIN " +
            "dbo.ModelTbl ON dbo.SpecificTbl.ModelID = dbo.ModelTbl.ModelID INNER JOIN " +
            "dbo.PartTbl ON dbo.SpecificTbl.PartID = dbo.PartTbl.PartID " +
            "WHERE PONumber = @PONumber";
        cmd.Parameters.AddWithValue("@PONumber", PONO);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "PurchaseOrderTbl");
        lvPOItems.DataSource = ds;
        lvPOItems.DataBind();
        ltID.Text = PONO.ToString();
        con.Close();
    }

  
}