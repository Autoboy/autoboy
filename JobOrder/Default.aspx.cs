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
        cmd.CommandText = "SELECT OrderTbl.OrderID, OrderTbl.TransactionNumber, AccountTbl.FirstName + ' ' + AccountTbl.LastName AS FullName, " +
            "CarTbl.PlateNo, ModelTbl.ModelName, CarTbl.Year, " + 
            "OrderTbl.OrderDate, OrderTbl.Status " +
            "FROM AccountTbl INNER JOIN " +
            "CarTbl ON AccountTbl.UID = CarTbl.UID INNER JOIN " +
            "ModelTbl ON CarTbl.ModelID = ModelTbl.ModelID INNER JOIN " +
            "OrderTbl ON AccountTbl.UID = OrderTbl.UID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "OrderTbl");
        lvJO.DataSource = ds;
        lvJO.DataBind();
        con.Close();
    }
    
}