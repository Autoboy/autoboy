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

        }
    }

    //void GetUserTypes()
    //{
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandText = "SELECT TypeID, UserType FROM UserTypeTbl";
    //    SqlDataReader dr = cmd.ExecuteReader();
    //    ddlTypes.DataSource = dr;
    //    ddlTypes.DataTextField = "UserType";
    //    ddlTypes.DataValueField = "TypeID";
    //    ddlTypes.DataBind();
    //    con.Close();
    //}

    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    con.Open();
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.Connection = con;
    //    cmd.CommandText = "INSERT INTO AccountTbl VALUES (@EmailAddress, @Password, @TypeID, " +
    //        "@FirstName, @LastName, @MobileNo, @Street, @Address, @City, @Status)";
    //    cmd.Parameters.AddWithValue("@TypeID", ddlTypes.SelectedValue);
    //    cmd.Parameters.AddWithValue("@EmailAddress", txtEmail.Text);
    //    cmd.Parameters.AddWithValue("@Password", Helper.CreateSHAHash(txtPassword.Text));
    //    cmd.Parameters.AddWithValue("@FirstName", txtFN.Text);
    //    cmd.Parameters.AddWithValue("@LastName", txtLN.Text);
    //    cmd.Parameters.AddWithValue("@MobileNo", txtMobile.Text);
    //    cmd.Parameters.AddWithValue("@Street", txtStreet.Text);
    //    cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
    //    cmd.Parameters.AddWithValue("@City", txtCity.Text);
    //    cmd.Parameters.AddWithValue("@Status", "Active");
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    Session["add"] = "yes";
    //    Response.Redirect("Default.aspx");
    //}

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
        cmd.CommandText = "SELECT SpecificTbl.SpecificID, ModelTbl.ModelName, SpecificTbl.Year, SpecificTbl.EstPrice, SpecificTbl.EstTime " +
            "FROM SpecificTbl INNER JOIN ModelTbl ON SpecificTbl.ModelID = ModelTbl.ModelID " +
            "WHERE SpecificTbl.PartID = 0";
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
        cmd.CommandText = "INSERT INTO SpecificTbl VALUES (@PartID, @ModelID, @Year, @EstPrice, @EstTime)";
        cmd.Parameters.AddWithValue("@PartID", 0);
        cmd.Parameters.AddWithValue("@ModelID", ddlModels.SelectedValue);
        cmd.Parameters.AddWithValue("@Year", txtYear.Text);
        cmd.Parameters.AddWithValue("@EstPrice", txtPrice.Text);
        cmd.Parameters.AddWithValue("@EstTime", txtTime.Text);
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
        cmd.CommandText = "INSERT INTO PartTbl VALUES (@PartName, @Description); " +
            "SELECT TOP 1 PartID FROM PartTbl ORDER BY PartID DESC;";
        cmd.Parameters.AddWithValue("@PartName", txtName.Text);
        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

        int partID = (int)cmd.ExecuteScalar();
        cmd.CommandText = "UPDATE SpecificTbl SET PartID=@PartID WHERE PartID=0";
        cmd.Parameters.AddWithValue("@PartID", partID);
        cmd.ExecuteNonQuery();
        con.Close();
        Helper.AddLog("1", "Add", "Added a part");
        Response.Redirect("Default.aspx");
    }
}