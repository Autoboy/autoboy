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
            int JOID = 0;
            bool validID = int.TryParse(Request.QueryString["ID"].ToString(), out JOID);

            if (validID)
            {
                if (!IsPostBack)
                {

                }
            }
            else
                Response.Redirect("Default.aspx");
        }
        else
            Response.Redirect("Default.aspx");
    }





}