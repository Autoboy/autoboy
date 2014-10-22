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
        }
        con.Close();

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
        }
        con.Close();
        
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
        cmd.CommandText = "SELECT ServiceTypeTbl.ServiceType, PartTbl.PartName, SpecificTbl.EstPrice, " +
            "SpecificTbl.EstTime, TransactionTbl.FinalPrice FROM TransactionTbl INNER JOIN " + 
        "ServiceTbl ON TransactionTbl.ServiceID = ServiceTbl.ServiceID INNER JOIN " + 
        "SpecificTbl ON ServiceTbl.SpecificID = SpecificTbl.SpecificID INNER JOIN " +
        "PartTbl ON SpecificTbl.PartID = PartTbl.PartID INNER JOIN " + 
        "ServiceTypeTbl ON SpecificTbl.ServiceTypeID = ServiceTypeTbl.ServiceTypeID " + 
        "WHERE (TransactionTbl.TransactionNumber = @TransactionNumber) ";
        cmd.Parameters.AddWithValue("@TransactionNumber", txtTransactionNumber.Text);
        SqlDataReader da = cmd.ExecuteReader();
        lvJobOrderParts.DataSource = da;
        lvJobOrderParts.DataBind();
        con.Close();
    
    }



}