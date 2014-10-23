using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class BookOnlineSupplierParts_Add : System.Web.UI.Page
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
        txtTransactionNumber.Text = GetTransactionNumber().ToString();        
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
        cmd.CommandText = "SELECT TOP 1 ChassisNo FROM CarTbl ORDER BY CarID DESC";
        SqlDataReader dr = cmd.ExecuteReader();
        ddlChassisNo.DataSource = dr;
        ddlChassisNo.DataTextField = "ChassisNo";
        ddlChassisNo.DataValueField = "ChassisNo";
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
                         "PartTbl ON SpecificTbl.PartID = PartTbl.PartID WHERE SpecificTbl.ServiceTypeID = @ServiceTypeID";
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
        "WHERE (TransactionTbl.TransactionNumber = @UID) ";
        cmd.Parameters.AddWithValue("@UID", Session["bookingid"].ToString());
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
        "WHERE (TransactionTbl.TransactionNumber = @UID) ";
        cmd.Parameters.AddWithValue("@UID", Session["bookingid"].ToString());
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
                cmd.CommandText = "INSERT INTO ServiceTbl (SpecificID,PaintID,Description) VALUES (@SpecificID, @PaintID, @Description); " +
                    "SELECT TOP 1 ServiceID FROM ServiceTbl ORDER BY ServiceID DESC;";
                cmd.Parameters.AddWithValue("@SpecificID", ltSpecificID.Text);
                cmd.Parameters.AddWithValue("@PaintID", DBNull.Value);
                cmd.Parameters.AddWithValue("@Description", ddlServiceType.SelectedValue);
                int serviceID = (int)cmd.ExecuteScalar();
                cmd.CommandText = "INSERT INTO TransactionTbl (TransactionNumber,ServiceID) VALUES (@TransactionNumber, @ServiceID)";
                cmd.Parameters.AddWithValue("@TransactionNumber", Session["bookingid"].ToString());
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
        "WHERE TransactionTbl.TransactionNumber = @UID AND SpecificTbl.SpecificID=@SpecificID ";
        cmd.Parameters.AddWithValue("@SpecificID", SpecificID);
        cmd.Parameters.AddWithValue("@UID", Session["bookingid"].ToString());
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    string GetTransactionNumber()
    {
        string TransactionNumber = "";
        string date = "";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 LEFT(TransactionNumber,8) AS Number FROM TransactionTbl ORDER BY TID DESC";     
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                date = data["Number"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            date = "0";
        }
        if (date == DateTime.Now.ToString("yyyyMMdd"))
        {
            
            con.Open();
            SqlCommand command = new SqlCommand();
            command.Connection = con;
            command.CommandText = "SELECT TOP 1 TransactionNumber + 1 AS TransactionNumber FROM TransactionTbl " +
                                  "ORDER BY TransactionNumber DESC";
            SqlDataReader dt = command.ExecuteReader();
            if (dt.HasRows)
            {
                while(dt.Read())
                {
                    TransactionNumber = dt["TransactionNumber"].ToString();                    
                }
                con.Close();
            }
            
        }
        else
        {
            TransactionNumber = DateTime.Now.ToString("yyyyMMdd") + "01";
        }
        return TransactionNumber;
    }

    protected void btnCreateJO_Click(object sender, EventArgs e)
    {
        //int EstTime = int.Parse(txtTotalEstimatedTime.Text);
        int EstTime = 1;
        //decimal EstPrice = Decimal.Parse(txtTotalEstimatedPrice.Text);
        decimal EstPrice = Decimal.Parse("1000.00");
        DateTime date = DateTime.Now;
        string TransactionNumber = GetTransactionNumber();
        con.Open();
        SqlCommand com = new SqlCommand();
        com.Connection = con;
        com.CommandText = "UPDATE TransactionTbl SET TransactionNumber = @TransactionNumber WHERE TransactionNumber = @UID";
        com.Parameters.AddWithValue("@TransactionNumber", txtTransactionNumber.Text);
        com.Parameters.AddWithValue("@UID", 1);
        com.ExecuteNonQuery();
        con.Close();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO BookingTbl (TransactionNumber, ChassisNo, UID, BookingDate, EstTime, EstCost, DateEntry, Status) " +
                            "VALUES (@TransactionNumber, @ChassisNo, @UID, @BookingDate, @EstTime, @EstCost, @DateEntry, @Status)";
        cmd.Parameters.AddWithValue("@TransactionNumber", txtTransactionNumber.Text);
        cmd.Parameters.AddWithValue("@ChassisNo", ddlChassisNo.SelectedValue);
        cmd.Parameters.AddWithValue("@UID", ddlCustomer.SelectedValue);
        cmd.Parameters.AddWithValue("@BookingDate", DateTime.Now);
        cmd.Parameters.AddWithValue("@EstTime", EstTime);
        cmd.Parameters.AddWithValue("@EstCost", EstPrice);
        cmd.Parameters.AddWithValue("@DateEntry", calEntryDate.Text);
        cmd.Parameters.AddWithValue("@Status", "Pending");
        cmd.ExecuteNonQuery();
        con.Close();        

        Response.Redirect("Default.aspx");
    }

    protected void ddlServiceType_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCarParts();
    }
}