using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class PurchaseOrder_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetPOItems();
            GetJobOrderTotal();
            GetCarParts();
            GetTranNo();
            GetSupplier();         


        }
    }
    void GetTranNo()
    {
        //TextBox1.Text = GetTransactionNumber().ToString();
        
    }

 
    void GetSupplier()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT DISTINCT dbo.SupplierTbl.SupplierID, dbo.SupplierTbl.Supplier FROM dbo.SupplierTbl " + 
            "INNER JOIN dbo.SupplierPartsTbl ON dbo.SupplierTbl.SupplierID = dbo.SupplierPartsTbl.SupplierID " + 
            "INNER JOIN dbo.TransactionTbl " + 
            "INNER JOIN dbo.SpecificTbl " + 
            "INNER JOIN dbo.PartTbl ON dbo.SpecificTbl.PartID = dbo.PartTbl.PartID " + 
            "INNER JOIN dbo.ServiceTbl ON dbo.SpecificTbl.SpecificID = dbo.ServiceTbl.SpecificID ON dbo.TransactionTbl.ServiceID = dbo.ServiceTbl.ServiceID ON " +
            "dbo.SupplierPartsTbl.SpecificID = dbo.SpecificTbl.SpecificID " +
            "WHERE (dbo.SpecificTbl.ServiceTypeID = @ServiceTypeID) AND (dbo.TransactionTbl.TransactionNumber = @tNum)";
        cmd.Parameters.AddWithValue("@ServiceTypeID", "2");
        cmd.Parameters.AddWithValue("tNum", "2014101801");                                   
        SqlDataReader dr = cmd.ExecuteReader();
        ddlSupplier.DataSource = dr;
        ddlSupplier.DataTextField = "Supplier";
        ddlSupplier.DataValueField = "SupplierID";
        ddlSupplier.DataBind();
        con.Close();
    }

    void GetCarParts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT dbo.SpecificTbl.ServiceTypeID, dbo.SpecificTbl.SpecificID, dbo.PartTbl.PartName, dbo.SpecificTbl.EstPrice " +
            "FROM dbo.SupplierTbl INNER JOIN " +
            "dbo.SupplierPartsTbl ON dbo.SupplierTbl.SupplierID = dbo.SupplierPartsTbl.SupplierID INNER JOIN " +
            "dbo.TransactionTbl INNER JOIN " +
            "dbo.SpecificTbl INNER JOIN  " +
            "dbo.PartTbl ON dbo.SpecificTbl.PartID = dbo.PartTbl.PartID INNER JOIN " +
            "dbo.ServiceTbl ON dbo.SpecificTbl.SpecificID = dbo.ServiceTbl.SpecificID ON dbo.TransactionTbl.ServiceID = dbo.ServiceTbl.ServiceID ON " +
            "dbo.SupplierPartsTbl.SpecificID = dbo.SpecificTbl.SpecificID " +
            "WHERE (dbo.SpecificTbl.ServiceTypeID = @ServiceTypeID) AND (dbo.TransactionTbl.TransactionNumber = @tNum) AND (dbo.SupplierTbl.SupplierID = @Supplier)";                                        
        cmd.Parameters.AddWithValue("@ServiceTypeID", "2");                                                                                
        cmd.Parameters.AddWithValue("tNum", "2014101801");
        cmd.Parameters.AddWithValue("@Supplier", ddlSupplier.SelectedValue);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            pnlParts.Visible = true;
        else
            pnlParts.Visible = false;
        lvCarParts.DataSource = data;
        lvCarParts.DataBind();
        con.Close();
    }


    void GetPOItems()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT dbo.PurchaseOrderTbl.POID, dbo.PurchaseOrderTbl.PONumber, dbo.PurchaseOrderTbl.Date, " +
            "dbo.PartTbl.PartName, dbo.PurchaseOrderTbl.Price, dbo.SupplierTbl.Supplier, dbo.PurchaseOrderTbl.Status " +
            "FROM dbo.PurchaseOrderTbl " +
            "INNER JOIN dbo.SpecificTbl ON dbo.PurchaseOrderTbl.SpecificID = dbo.SpecificTbl.SpecificID " +
            "INNER JOIN dbo.ServiceTbl ON dbo.SpecificTbl.SpecificID = dbo.ServiceTbl.SpecificID " +
            "INNER JOIN dbo.TransactionTbl ON dbo.ServiceTbl.ServiceID = dbo.TransactionTbl.ServiceID " +
            "INNER JOIN dbo.PartTbl ON dbo.SpecificTbl.PartID = dbo.PartTbl.PartID " +
            "INNER JOIN dbo.SupplierTbl ON dbo.PurchaseOrderTbl.SupplierID = dbo.SupplierTbl.SupplierID " + 
            "WHERE (dbo.PurchaseOrderTbl.PONumber = 0) ";
        SqlDataReader da = cmd.ExecuteReader();
        lvPOItems.DataSource = da;
        lvPOItems.DataBind();
        con.Close();
    }

    void GetJobOrderTotal()
    {
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "SELECT SUM(SpecificTbl.EstPrice) AS TotalPrice, " +
        //    "SUM(SpecificTbl.EstTime) AS TotalTime FROM TransactionTbl INNER JOIN " +
        //"ServiceTbl ON TransactionTbl.ServiceID = ServiceTbl.ServiceID INNER JOIN " +
        //"SpecificTbl ON ServiceTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
        //"PartTbl ON SpecificTbl.PartID = PartTbl.PartID INNER JOIN " +
        //"ServiceTypeTbl ON SpecificTbl.ServiceTypeID = ServiceTypeTbl.ServiceTypeID " + 
        //"WHERE (TransactionTbl.TransactionNumber = 0) ";
        //SqlDataReader da = cmd.ExecuteReader();
        //if (da.HasRows)
        //{
        //    while (da.Read())
        //    {
        //        txtTotalEstimatedTime.Text = da["TotalTime"].ToString();
        //        txtTotalEstimatedPrice.Text = da["TotalPrice"].ToString();
        //    }
        //    con.Close();
        //}
        //else
        //{
        //    con.Close();
        //    txtTotalEstimatedTime.Text = "";
        //    txtTotalEstimatedPrice.Text = "";

        //}
    }



    protected void lvCarParts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "addLink")
        {
            
            Literal ltSpecificID = (Literal)e.Item.FindControl("ltSpecificID");
            bool existing = IsExisting(ltSpecificID.Text);

            if (!existing)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "insert into servicetbl values (@specificid, @paintid, @description); " +
                    "select top 1 serviceid from servicetbl order by serviceid desc;";
                //cmd.parameters.addwithvalue("@specificid", ltspecificid.text);
                //cmd.parameters.addwithvalue("@paintid", dbnull.value);
                //cmd.parameters.addwithvalue("@description", ddlservicetype.selectedvalue);
                //int serviceid = (int)cmd.executescalar();
                //cmd.commandtext = "insert into transactiontbl values (@transactionnumber, @serviceid)";
                //cmd.parameters.addwithvalue("@transactionnumber", 0);
                //cmd.parameters.addwithvalue("@serviceid", serviceid);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                // display error
            }
        }
        GetPOItems();
    }
    protected void lvJobOrderParts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteitem")
        {
            Literal ltRefID = (Literal)e.Item.FindControl("ltRefID");
            Literal ltServiceID = (Literal)e.Item.FindControl("ltServiceID");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "delete from TransactionTbl where TID = @TID; " +
                "DELETE FROM ServiceTbl WHERE ServiceID=@ServiceID; ";
            cmd.Parameters.AddWithValue("@TID", ltRefID.Text);
            cmd.Parameters.AddWithValue("@ServiceID", ltServiceID.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        //GetJobOrderParts();
        GetJobOrderTotal();
    }

    bool IsExisting(String SpecificID)
    {
        bool existing = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT dbo.SpecificTbl.SpecificID " +
            "FROM dbo.PurchaseOrderTbl " +
            "INNER JOIN dbo.SpecificTbl ON dbo.PurchaseOrderTbl.SpecificID = dbo.SpecificTbl.SpecificID " +
            "INNER JOIN dbo.ServiceTbl ON dbo.SpecificTbl.SpecificID = dbo.ServiceTbl.SpecificID " +
            "INNER JOIN dbo.TransactionTbl ON dbo.ServiceTbl.ServiceID = dbo.TransactionTbl.ServiceID " +
            "INNER JOIN dbo.PartTbl ON dbo.SpecificTbl.PartID = dbo.PartTbl.PartID " +
            "INNER JOIN dbo.SupplierTbl ON dbo.PurchaseOrderTbl.SupplierID = dbo.SupplierTbl.SupplierID " +
            "WHERE (dbo.PurchaseOrderTbl.PONumber = 0) AND (dbo.PurchaseOrderTbl.SpecificID = @SpecificID)";
        cmd.Parameters.AddWithValue("@SpecificID", SpecificID);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    int GetPONumber()
    {
        int number = 0;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT PONumber + 1 AS Number FROM PurchaseOrderTbl " +
                            "WHERE PONumber = 0";
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                number = int.Parse(data["Number"].ToString());
                number = int.Parse(DateTime.Now.ToString("yyMMdd") + "01");
            }
            con.Close();
        }
        else
        {
            con.Close();
            number = int.Parse(DateTime.Now.ToString("yyMMdd") + "01");
        }
        return number;
    }

    protected void btnCreatePO_Click(object sender, EventArgs e)
    {
        //int EstTime = int.Parse(txtTotalEstimatedTime.Text);
        //decimal EstPrice = Decimal.Parse(txtTotalEstimatedPrice.Text);
        //DateTime date = DateTime.Now;
        //int TransactionNumber = GetTransactionNumber();
        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;
        //cmd.CommandText = "INSERT INTO OrderTbl (TransactionNumber,ChassisNo,UID,EstTime,EstCost,OrderDate) " +
        //                    "VALUES (@TransactionNumber,@ChassisNo,@UID,@EstTime,@EstCost,@OrderDate)";
        //cmd.Parameters.AddWithValue("@TransactionNumber", TransactionNumber);
        //cmd.Parameters.AddWithValue("@ChassisNo", ddlChassisNo.SelectedValue);
        //cmd.Parameters.AddWithValue("@UID", ddlCustomer.SelectedValue);
        //cmd.Parameters.AddWithValue("@EstTime", EstTime);
        //cmd.Parameters.AddWithValue("@EstCost", EstPrice);
        //cmd.Parameters.AddWithValue("@OrderDate", date);
        //cmd.ExecuteNonQuery();
        //con.Close();

        //con.Open();
        //    SqlCommand com = new SqlCommand();
        //com.Connection = con;
        //com.CommandText = "UPDATE TransactionTbl SET TransactionNumber = @TransactionNumber WHERE TransactionNumber = 0";
        //com.Parameters.AddWithValue("@TransactionNumber", TransactionNumber);
        //com.ExecuteNonQuery();
        //con.Close();

        //Response.Redirect("Default.aspx");


    }

    protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCarParts();
    }
}