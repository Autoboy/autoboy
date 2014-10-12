using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class PurchaseOrder_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetPurchaseOrder();
        }
    }

    void GetPurchaseOrder()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT DISTINCT PurchaseOrderTbl.PONumber, PurchaseOrderTbl.Date, SupplierTbl.Supplier " +
             "FROM PurchaseOrderTbl INNER JOIN " +
             "SupplierTbl ON PurchaseOrderTbl.SupplierID = SupplierTbl.SupplierID INNER JOIN " +
             "SpecificTbl ON PurchaseOrderTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
             "ModelTbl ON SpecificTbl.ModelID = ModelTbl.ModelID INNER JOIN " +
             "PartTbl ON SpecificTbl.PartID = PartTbl.PartID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "PurchaseOrderTbl");
        lvCars.DataSource = ds;
        lvCars.DataBind();
        con.Close();
    }
    
}