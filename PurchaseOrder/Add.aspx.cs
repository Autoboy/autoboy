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
            GetCarParts();
            GetTranNo();
            GetSupplier();
            GetFoo();
            
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


    protected void lvCarParts_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "addLink")
        {
            
            Literal ltSpecificID = (Literal)e.Item.FindControl("ltSpecificID");
            bool existing = IsExisting(ltSpecificID.Text);

            if (!existing)
            {
                TextBox txtfoo = (TextBox)e.Item.FindControl("txtPrice");
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO PurchaseOrderTbl (PONumber, SpecificID, Price, SupplierID, Status) " +
                    "VALUES (@PONumber, @SpecificID, @Price, @SupplierID, @Status);";
                cmd.Parameters.AddWithValue("@PONumber", 0);
                cmd.Parameters.AddWithValue("@SpecificID", ltSpecificID.Text);
                cmd.Parameters.AddWithValue("@Price", txtfoo.Text);
                cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
                cmd.Parameters.AddWithValue("@Status", "Pending");
                cmd.ExecuteNonQuery();
                con.Close();

                ddlSupplier.Enabled = false;
                
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
            Literal ltPOID = (Literal)e.Item.FindControl("ltPOID");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "DELETE FROM PurchaseOrderTbl where POID = @POID; ";
            cmd.Parameters.AddWithValue("@POID", ltPOID.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        GetPOItems();
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

    string GetPONUmber()
    {
        string PONumber = "";
        string foo = "";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 LEFT(PONumber,8) AS Number FROM PurchaseOrderTbl ORDER BY POID DESC";
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                foo = data["Number"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            foo = "0";
        }
        if (foo == DateTime.Now.ToString("yyyyMMdd"))
        {

            con.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandText = "SELECT TOP 1 PONumber + 1 AS PONumber FROM PurchaseOrderTbl " +
                                  "ORDER BY PONumber DESC";
            SqlDataReader dt = command.ExecuteReader();
            if (dt.HasRows)
            {
                while (dt.Read())
                {
                    PONumber = dt["PONumber"].ToString();

                }
                con.Close();
            }

        }
        else
        {
            PONumber = DateTime.Now.ToString("yyyyMMdd") + "01";

        }
        return PONumber;
    }

    protected void btnCreatePO_Click(object sender, EventArgs e)
    {
        String PONum = GetPONUmber();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE PurchaseOrderTbl SET PONumber = @PONumber, DATE = @Date WHERE PONumber = 0";
        cmd.Parameters.AddWithValue("@PONumber", txtfoo.Text);
        cmd.Parameters.AddWithValue("@Date", DateTime.Now);

        cmd.ExecuteNonQuery();
        con.Close();

        //Response.Redirect("Default.aspx");

        ddlSupplier.Enabled = true;
        GetPOItems();
        GetCarParts();
        GetFoo();

    }

    protected void ddlSupplier_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCarParts();
    }

    void GetFoo()
    {
        string asda = GetPONUmber();
        txtfoo.Text = asda;
    }

}