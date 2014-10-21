using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class BookOnline_Add : System.Web.UI.Page
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
        GetSupplierPart2();
    }
}