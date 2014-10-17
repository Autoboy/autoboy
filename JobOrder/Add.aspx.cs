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
            GetModels();
            GetSuppliers();
            GetSpecs();
            GetSupplierPart();
            GetUserType();


        }
    }
    void GetUserType()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TypeID, UserType FROM UserTypeTbl WHERE TypeID = 3 OR TypeID = 6";
        SqlDataReader data = cmd.ExecuteReader();
        ddlCustomerType.DataSource = data;
        ddlCustomerType.DataTextField = "UserType";
        ddlCustomerType.DataValueField = "TypeID";
        ddlCustomerType.DataBind();
        con.Close();
    }
    
    void GetSuppliers()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "Select SupplierID, Supplier FROM SupplierTbl";
        SqlDataReader data = cmd.ExecuteReader();
        ddlSupplier.DataSource = data;
        ddlSupplier.DataTextField = "Supplier";
        ddlSupplier.DataValueField = "SupplierID";
        ddlSupplier.DataBind();
        con.Close();

    }
    void GetModels()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT ModelID, ModelName FROM ModelTbl";
        SqlDataReader data = cmd.ExecuteReader();
        ddlModels.DataSource = data;
        ddlModels.DataTextField = "ModelName";
        ddlModels.DataValueField = "ModelID";
        ddlModels.DataBind();
        con.Close();

    }

    void GetSpecs()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SpecificTbl.SpecificId, PartTbl.PartID, PartTbl.PartName, SpecificTbl.Year, SpecificTbl.EstPrice, SpecificTbl.EstTime " +
                            "FROM SpecificTbl INNER JOIN PartTbl " +
                            "ON SpecificTbl.PartID = PartTbl.PartID " +
                            "WHERE SpecificTbl.ModelID = @ModelID";
        cmd.Parameters.AddWithValue("@ModelID", ddlModels.SelectedValue);
        SqlDataReader data = cmd.ExecuteReader();
        lvSpecView.DataSource = data;
        lvSpecView.DataBind();
        con.Close();
    }

    

    void GetSupplierPart()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierPartsTbl.RefID, PartTbl.PartID, PartTbl.PartName, SpecificTbl.Year, SpecificTbl.EstPrice, SpecificTbl.EstTime " + 
                          "FROM SupplierPartsTbl INNER JOIN SpecificTbl ON SupplierPartsTbl.SpecificID = SpecificTbl.SpecificID " + 
                          "INNER JOIN PartTbl ON SpecificTbl.PartID = PartTbl.PartID WHERE SpecificTbl.ModelID = @ModelID";
        cmd.Parameters.AddWithValue("@ModelID", ddlModels.SelectedValue);
        SqlDataReader data = cmd.ExecuteReader();
        lvSupplierPart.DataSource = data;
        lvSupplierPart.DataBind();
        con.Close();


    }

    protected void btnAddLink_Click(object sender, EventArgs e)
    {

        
    }

    bool IsExisting(string partID)
    {
        bool existing = true;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT SupplierPartsTbl.RefID FROM SupplierPartsTbl " +
            "INNER JOIN SpecificTbl ON SupplierPartsTbl.SpecificID = SpecificTbl.SpecificID " +
            "INNER JOIN PartTbl ON SpecificTbl.PartID = PartTbl.PartID " +
            "WHERE SupplierPartsTbl.SupplierID = @SupplierID AND PartTbl.PartID=@PartID";
        cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
        cmd.Parameters.AddWithValue("@PartID", partID);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            existing = true;
        else
            existing = false;
        con.Close();
        return existing;
    }

    protected void lvSpecView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "addLink")
        {
            Literal ltSpecificID = (Literal)e.Item.FindControl("ltSpecificID");
            Literal ltPartID = (Literal)e.Item.FindControl("ltPartID");

            bool existing = IsExisting(ltPartID.Text);

            if (existing)
                error.Visible = true;
            else
            {
                error.Visible = false;
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "INSERT INTO SupplierPartsTbl VALUES (@SupplierID, @SpecificID)";
                cmd.Parameters.AddWithValue("@SupplierID", ddlSupplier.SelectedValue);
                cmd.Parameters.AddWithValue("@SpecificID", ltSpecificID.Text);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
        GetSpecs();
        GetSupplierPart();
    }

    protected void lvSpecs_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
       
    }
    protected void ddlModels_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetSpecs();
    }

    protected void lvSupplierPart_ItemCommand(object sender, ListViewCommandEventArgs e)
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
        GetSupplierPart();
        
    }
    protected void lvSpecView_DataBound(object sender, EventArgs e)
    {
         
    }
}