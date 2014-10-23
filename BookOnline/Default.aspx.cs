using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class BookOnline_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetBooking();
        }
    }

    void GetBooking()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT BookingTbl.BookingID, BookingTbl.TransactionNumber, " +
            "AccountTbl.FirstName + ' ' + AccountTbl.LastName AS FullName, " +
            "CarTbl.PlateNo, ModelTbl.ModelName, CarTbl.Year, " + 
            "BookingTbl.BookingDate, BookingTbl.Status " +
            "FROM AccountTbl INNER JOIN " +
            "CarTbl ON AccountTbl.UID = CarTbl.UID INNER JOIN " +
            "ModelTbl ON CarTbl.ModelID = ModelTbl.ModelID INNER JOIN " +
            "BookingTbl ON AccountTbl.UID = BookingTbl.UID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "BookingTbl");
        lvJO.DataSource = ds;
        lvJO.DataBind();
        con.Close();
    }    
}