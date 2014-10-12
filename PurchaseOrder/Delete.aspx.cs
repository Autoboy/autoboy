using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class PurchaseOrder_Delete : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            String ChassisNo = "";
            bool validCar = Request.QueryString["ID"], out ChassisNo;

            if (validCar)
            {
                DeleteRecord(ChassisNo);
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }

    void DeleteRecord(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "DELETE FROM CarTbl WHERE ChassisNo=@ChassisNo";
        cmd.Parameters.AddWithValue("@ChassisNo", ID);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["delete"] = "yes";
        Response.Redirect("Default.aspx");
    }
}