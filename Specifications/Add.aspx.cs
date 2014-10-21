using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class Parts_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetModels();
            GetSpecs();
            GetParts();
            GetServiceType();

        }
    }
    void GetServiceType()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT ServiceTypeID, ServiceType FROM ServiceTypeTbl";
        SqlDataReader data = cmd.ExecuteReader();
        ddlServiceType.DataSource = data;
        ddlServiceType.DataTextField = "ServiceType";
        ddlServiceType.DataValueField = "ServiceTypeID";
        ddlServiceType.DataBind();
        con.Close();

    }
    void GetParts()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT PartID, PartName FROM PartTbl";
        SqlDataReader data = cmd.ExecuteReader();
        ddlPartName.DataSource = data;
        ddlPartName.DataTextField = "PartName";
        ddlPartName.DataValueField = "PartID";
        ddlPartName.DataBind();
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
        cmd.CommandText = "SELECT spt.SpecificID, stt.ServiceType, mdt.ModelName, prt.PartName, spt.Year, spt.EstPrice, spt.EstTime " + 
                            "FROM SpecificTbl spt INNER JOIN ModelTbl mdt ON spt.ModelID = mdt.ModelID " +
                            "INNER JOIN PartTbl prt ON spt.PartID = prt.PartID " +
                            "INNER JOIN ServiceTypeTbl stt ON stt.ServiceTypeID = spt.ServiceTypeID WHERE spt.ModelID =@ModelID";
        cmd.Parameters.AddWithValue("@ModelID", ddlModels.SelectedValue);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
            pnlParts.Visible = true;
        else
            pnlParts.Visible = false;
        lvSpecs.DataSource = data;
        lvSpecs.DataBind();
        con.Close();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO SpecificTbl (PartID,ModelID,Year,EstPrice,EstTime,ServiceTypeID) VALUES (@PartID, @ModelID, @Year, @EstPrice, @EstTime, @ServiceTypeID)";
        cmd.Parameters.AddWithValue("@PartID", ddlPartName.SelectedValue);
        cmd.Parameters.AddWithValue("@ModelID", ddlModels.SelectedValue);
        cmd.Parameters.AddWithValue("@Year", txtYear.Text);
        cmd.Parameters.AddWithValue("@EstPrice", txtPrice.Text);
        cmd.Parameters.AddWithValue("@EstTime", txtTime.Text);
        cmd.Parameters.AddWithValue("@ServiceTypeID", ddlServiceType.SelectedValue);
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog("1", "Add", "Added a specification");
        GetSpecs();
    }
    protected void lvSpecs_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "deleteitem")
        {
            Literal ltSpecificID = (Literal)e.Item.FindControl("ltSpecificID");
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "DELETE FROM SpecificTbl WHERE SpecificID=@SpecificID";
            cmd.Parameters.AddWithValue("@SpecificID", ltSpecificID.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        GetSpecs();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        //cmd.CommandText = "INSERT INTO PartTbl VALUES (@PartName, @Description); " +
        //    "SELECT TOP 1 PartID FROM PartTbl ORDER BY PartID DESC;";
        //cmd.Parameters.AddWithValue("@PartName", txtName.Text);
        //cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

        int partID = (int)cmd.ExecuteScalar();
        cmd.CommandText = "UPDATE SpecificTbl SET PartID=@PartID WHERE PartID=0";
        cmd.Parameters.AddWithValue("@PartID", partID);
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog("1", "Add", "Added a part");
        Response.Redirect("Default.aspx");
    }
}