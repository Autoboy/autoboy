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
            GetSupplierID();
            GetSpecificID();
            GetPOItem();
            //GetPrice();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    void GetSupplierID()
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

    void GetSpecificID()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "select SpecificTbl.SpecificID, PartTbl.PartName + ', ' + ModelTbl.ModelName AS Specific, SpecificTbl.EstPrice FROM SpecificTbl " +
            "INNER JOIN PartTbl ON SpecificTbl.PartID = PartTbl.PartID " +
            "INNER JOIN ModelTbl ON SpecificTbl.ModelID = ModelTbl.ModelID";
        SqlDataReader data = cmd.ExecuteReader();
        ddlSpecific.DataSource = data;
        ddlSpecific.DataTextField = "Specific";
        ddlSpecific.DataValueField = "SpecificID";
        ddlSpecific.DataBind();
        con.Close();

    }

    double GetTotalAmount()
    {
        double amount = 0;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT EstPrice FROM SpecificTbl WHERE SpecificID=@SpecificID";
        cmd.Parameters.AddWithValue("@SpecificID", ddlSpecific.SelectedValue);
        decimal price = (decimal)cmd.ExecuteScalar();
        con.Close();
        amount = double.Parse(price.ToString());
        int qty = int.Parse(txtQty.Text);
        return amount * qty;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        double totalAmount = GetTotalAmount();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO PurchaseOrderTbl VALUES (@PONumber, @Date, @SpecificID, " +
            "@Qty, @TotalPrice, @SupplierID, @Status)";
        cmd.Parameters.AddWithValue("@PONumber", txtPONo.Text);
        cmd.Parameters.AddWithValue("@Date", DateTime.Now);
        cmd.Parameters.AddWithValue("@SpecificID", ddlSpecific.SelectedValue);
        cmd.Parameters.AddWithValue("@Qty", txtQty.Text);
        cmd.Parameters.AddWithValue("@TotalPrice", totalAmount);
        cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
        cmd.Parameters.AddWithValue("@Status", "Pending");
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Add.aspx");

        GetPOItem();
    }

    protected void lvPurchaseOrderItem_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteitem")
        {
            Literal ltRefID = (Literal)e.Item.FindControl("ltRefID");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "DELETE FROM SupplierPartsTbl WHERE RefID=@RefID";
            cmd.Parameters.AddWithValue("@RefID", ltRefID.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        GetPOItem();

    }

    void GetPOItem()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT dbo.PartTbl.PartName, dbo.ModelTbl.ModelName, dbo.PurchaseOrderTbl.Qty, dbo.PurchaseOrderTbl.TotalPrice " +
            "FROM dbo.PurchaseOrderTbl INNER JOIN " +
            "dbo.SpecificTbl ON dbo.PurchaseOrderTbl.SpecificID = dbo.SpecificTbl.SpecificID INNER JOIN " +
            "dbo.PartTbl ON dbo.SpecificTbl.PartID = dbo.PartTbl.PartID INNER JOIN " +
            "dbo.ModelTbl ON dbo.SpecificTbl.ModelID = dbo.ModelTbl.ModelID " +
            "WHERE PONumber = @PONumber";
        cmd.Parameters.AddWithValue("@PONumber", txtPONo.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "PurchaseOrderTbl");
        lvPurchaseOrderItem.DataSource = ds;
        lvPurchaseOrderItem.DataBind();
        con.Close();
    }

    protected void btnComplete_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "update PurchaseOrderTbl SET Date=@Date WHERE PONumber=@PONumber";
        cmd.Parameters.AddWithValue("@PONumber", txtPONo.Text);
        cmd.Parameters.AddWithValue("@Date", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");

        GetPOItem();
    }
}