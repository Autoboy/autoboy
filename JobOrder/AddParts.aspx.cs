using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class SupplierParts_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetEmail();
            GetChassisNo();
            GetCar();
            GetJobOrderParts();
            GetJobOrderTotal();
            GetServiceType();
            GetCarParts();
            GetTranNo();
            


        }
    }
    void GetTranNo()
    {
        TextBox1.Text = GetTransactionNumber().ToString();
        
    }
    void GetCar()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 a.CarID, b.ModelName FROM CarTbl a INNER JOIN ModelTbl b ON a.ModelID = b.ModelID ORDER BY CarID DESC";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlCar.DataSource = dr;
        ddlCar.DataTextField = "ModelName";
        ddlCar.DataValueField = "CarID";
        ddlCar.DataBind();
        con.Close();
    
    
    }
    void GetEmail()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 UID, EmailAddress FROM AccountTbl ORDER BY UID DESC";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlCustomer.DataSource = dr;
        ddlCustomer.DataTextField = "EmailAddress";
        ddlCustomer.DataValueField = "UID";
        ddlCustomer.DataBind();
        con.Close();
    }
    void GetChassisNo()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 CarID, ChassisNo FROM CarTbl ORDER BY CarID DESC";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlChassisNo.DataSource = dr;
        ddlChassisNo.DataTextField = "ChassisNo";
        ddlChassisNo.DataValueField = "CarID";
        ddlChassisNo.DataBind();
        con.Close();
    }

    void GetServiceType()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT ServiceTypeID, ServiceType FROM ServiceTypeTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlServiceType.DataSource = dr;
        ddlServiceType.DataTextField = "ServiceType";
        ddlServiceType.DataValueField = "ServiceTypeID";
        ddlServiceType.DataBind();
        con.Close();
    }

    void GetCarParts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SpecificTbl.SpecificID, PartTbl.PartName, SpecificTbl.EstPrice, SpecificTbl.EstTime, SpecificTbl.ServiceTypeID " +
                         "FROM SupplierPartsTbl INNER JOIN " +
                         "SpecificTbl ON SupplierPartsTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
                         "PartTbl ON SpecificTbl.PartID = PartTbl.PartID ";
                         //"WHERE ServiceTypeID = @ServiceTypeID";
        cmd.Parameters.AddWithValue("@ServiceTypeID", ddlServiceType.SelectedValue);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            pnlParts.Visible = true;
        else
            pnlParts.Visible = false;
        lvCarParts.DataSource = data;
        lvCarParts.DataBind();
        con.Close();
    }


    void GetJobOrderParts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TransactionTbl.TID, ServiceTypeTbl.ServiceType, PartTbl.PartName, SpecificTbl.EstPrice, " +
            "SpecificTbl.EstTime, ServiceTbl.ServiceID FROM TransactionTbl INNER JOIN " + 
        "ServiceTbl ON TransactionTbl.ServiceID = ServiceTbl.ServiceID INNER JOIN " + 
        "SpecificTbl ON ServiceTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
        "PartTbl ON SpecificTbl.PartID = PartTbl.PartID INNER JOIN " + 
        "ServiceTypeTbl ON SpecificTbl.ServiceTypeID = ServiceTypeTbl.ServiceTypeID " + 
        "WHERE (TransactionTbl.TransactionNumber = 0) ";
        SqlDataReader da = cmd.ExecuteReader();
        lvJobOrderParts.DataSource = da;
        lvJobOrderParts.DataBind();
        con.Close();
    }

    void GetJobOrderTotal()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SUM(SpecificTbl.EstPrice) AS TotalPrice, " +
            "SUM(SpecificTbl.EstTime) AS TotalTime FROM TransactionTbl INNER JOIN " +
        "ServiceTbl ON TransactionTbl.ServiceID = ServiceTbl.ServiceID INNER JOIN " +
        "SpecificTbl ON ServiceTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
        "PartTbl ON SpecificTbl.PartID = PartTbl.PartID INNER JOIN " +
        "ServiceTypeTbl ON SpecificTbl.ServiceTypeID = ServiceTypeTbl.ServiceTypeID " + 
        "WHERE (TransactionTbl.TransactionNumber = 0) ";
        SqlDataReader da = cmd.ExecuteReader();
        if (da.HasRows)
        {
            while (da.Read())
            {
                txtTotalEstimatedTime.Text = da["TotalTime"].ToString();
                txtTotalEstimatedPrice.Text = da["TotalPrice"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            txtTotalEstimatedTime.Text = "";
            txtTotalEstimatedPrice.Text = "";

        }
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
                cmd.CommandText = "INSERT INTO ServiceTbl VALUES (@SpecificID, @PaintID, @Description); " +
                    "SELECT TOP 1 ServiceID FROM ServiceTbl ORDER BY ServiceID DESC;";
                cmd.Parameters.AddWithValue("@SpecificID", ltSpecificID.Text);
                cmd.Parameters.AddWithValue("@PaintID", DBNull.Value);
                cmd.Parameters.AddWithValue("@Description", ddlServiceType.SelectedValue);
                int serviceID = (int)cmd.ExecuteScalar();
                cmd.CommandText = "INSERT INTO TransactionTbl VALUES (@TransactionNumber, @ServiceID)";
                cmd.Parameters.AddWithValue("@TransactionNumber", 0);
                cmd.Parameters.AddWithValue("@ServiceID", serviceID);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                // display error
            }
        }
        GetJobOrderParts();
        GetJobOrderTotal();
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
        GetJobOrderParts();
        GetJobOrderTotal();
    }

    bool IsExisting(String SpecificID)
    {
        bool existing = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SpecificTbl.SpecificID FROM TransactionTbl INNER JOIN " +
        "ServiceTbl ON TransactionTbl.ServiceID = ServiceTbl.ServiceID INNER JOIN " +
        "SpecificTbl ON ServiceTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
        "PartTbl ON SpecificTbl.PartID = PartTbl.PartID INNER JOIN " +
        "ServiceTypeTbl ON SpecificTbl.ServiceTypeID = ServiceTypeTbl.ServiceTypeID " +
        "WHERE TransactionTbl.TransactionNumber = 0 AND SpecificTbl.SpecificID=@SpecificID ";
        cmd.Parameters.AddWithValue("@SpecificID", SpecificID);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    int GetTransactionNumber()
    {
        int number = 0;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TransactionNumber + 1 AS Number FROM TransactionTbl " +
                            "WHERE TransactionNumber = 0";
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                number = int.Parse(data["Number"].ToString());
                number = int.Parse(DateTime.Now.ToString("yyyMMdd") + "01");
            }
            con.Close();
        }
        else
        {
            con.Close();
            number = int.Parse(DateTime.Now.ToString("yyyMMdd") + "01");
        }
        return number;
    }

    protected void btnCreateJO_Click(object sender, EventArgs e)
    {
        DateTime date = DateTime.Now;
        int TransactionNumber = GetTransactionNumber();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO OrderTbl (TransactionNumber,ChassisNo,UID,EstTime,EstCost,OrderDate)" +
                            "VALUES (@TransactionNumber,@ChassisNo,@UID,@EstTime,@EstCost,@OrderDate)";
        cmd.Parameters.AddWithValue("@TransactionNumber", TransactionNumber);
        cmd.Parameters.AddWithValue("@ChassisNo", ddlChassisNo.SelectedItem);
        cmd.Parameters.AddWithValue("@UID", ddlCustomer.SelectedValue);
        cmd.Parameters.AddWithValue("@EstTime", txtTotalEstimatedTime.Text);
        cmd.Parameters.AddWithValue("@EstCost", txtTotalEstimatedPrice.Text);
        cmd.Parameters.AddWithValue("@OrderDate", date);
        cmd.ExecuteNonQuery();
        con.Close();


    }
}