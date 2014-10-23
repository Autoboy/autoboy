using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class JobOrder_Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["JOID"] != "")
        {
            int id= 0;
            bool validID = int.TryParse(Request.QueryString["JOID"].ToString(), out id);

            if (validID)
            {
                if (!IsPostBack)
                {
                    GetTransactionNumber(id);
                    GetCustomer(id);
                    GetCarModel(id);
                    GetJobOrderParts();
                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }

    void GetCustomer(int id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT AccountTbl.UID, AccountTbl.EmailAddress FROM AccountTbl INNER JOIN OrderTbl ON OrderTbl.UID = AccountTbl.UID WHERE OrderID = @OrderID";
        cmd.Parameters.AddWithValue("@OrderID", id);
        SqlDataReader dr = cmd.ExecuteReader();
        ddlCustomer.DataSource = dr;
        ddlCustomer.DataTextField = "EmailAddress";
        ddlCustomer.DataValueField = "UID";
        ddlCustomer.DataBind();
        con.Close();
    }

    void GetCarModel(int id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT ModelTbl.ModelName, CarTbl.Year " +
                         "FROM OrderTbl INNER JOIN " +
                         "AccountTbl ON OrderTbl.UID = AccountTbl.UID INNER JOIN " +
                         "CarTbl ON AccountTbl.UID = CarTbl.UID INNER JOIN " +
                         "ModelTbl ON CarTbl.ModelID = ModelTbl.ModelID " +
                         "WHERE OrderTbl.OrderID = @OrderID";
        cmd.Parameters.AddWithValue("@OrderID", id);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            while (dr.Read())
            {
                txtCarModel.Text = dr["ModelName"].ToString() + " " + dr["Year"].ToString();
            }
            con.Close();
        }
        

    }

    void GetTransactionNumber(int id)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TransactionNumber FROM OrderTbl WHERE OrderID = @OrderID";
        cmd.Parameters.AddWithValue("@OrderID", id);
        SqlDataReader da = cmd.ExecuteReader();
        if (da.HasRows)
        {
            while (da.Read())
            {
                txtTransactionNumber.Text = da["TransactionNumber"].ToString();
                
            }
            con.Close();
        }
        
        
    }
    
    //void TransactionNumber()
    //{
    //    txtTransactionNumber.Text = GetTransactionNumber(id);
    //}

    

    void GetJobOrderParts()
    {
        
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TransactionTbl.TID, ServiceTypeTbl.ServiceType, PartTbl.PartName, SpecificTbl.EstPrice, " +
            "SpecificTbl.EstTime, TransactionTbl.FinalPrice FROM TransactionTbl INNER JOIN " + 
        "ServiceTbl ON TransactionTbl.ServiceID = ServiceTbl.ServiceID INNER JOIN " + 
        "SpecificTbl ON ServiceTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
        "PartTbl ON SpecificTbl.PartID = PartTbl.PartID INNER JOIN " + 
        "ServiceTypeTbl ON SpecificTbl.ServiceTypeID = ServiceTypeTbl.ServiceTypeID " + 
        "WHERE TransactionTbl.TransactionNumber = @TransactionNumber";
        cmd.Parameters.AddWithValue("@TransactionNumber", txtTransactionNumber.Text);
        SqlDataReader da = cmd.ExecuteReader();
        lvJobOrderParts.DataSource = da;
        lvJobOrderParts.DataBind();
        con.Close();
    
    }

    string GetPriorityNumber()
    {
        string PriorityNumber = "";
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 PriorityNo + 1 AS PriorityNumber FROM OrderTbl";
        SqlDataReader dr = cmd.ExecuteReader();
        if(dr.HasRows)
        {
            while(dr.Read())
            {
                PriorityNumber = dr["PriorityNumber"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            PriorityNumber = "1";
        }
        return PriorityNumber;
    }



    //protected void txtFinalPrice_TextChanged(object sender, EventArgs e)
    //{
    //    Literal ltTID = (Literal)e.Equals("ltTID");
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandText = "UPDATE TransactionTbl SET FinalPrice=@FinalPrice WHERE TID=@TID;";
    //    cmd.Parameters.AddWithValue("@FinalPrice", txtFinalPrice.Text);
    //    cmd.Parameters.AddWithValue("@TID", ltTID.);
    //}

    protected void btnFinalizeJO_Click(object sender, EventArgs e)
    {
        string prioritynumber = GetPriorityNumber();
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "UPDATE OrderTbl SET TimeStart=@TimeStart, Status=@Status, PriorityNo=@PriorityNo";
        cmd.Parameters.AddWithValue("@TimeStart", txtDateStart.Text);
        cmd.Parameters.AddWithValue("@Status", "Active");
        cmd.Parameters.AddWithValue("@PriorityNo", prioritynumber);
        cmd.ExecuteNonQuery();
        con.Close();

    }
}