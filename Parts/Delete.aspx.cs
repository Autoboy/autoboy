﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;

public partial class Parts_Delete : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            int PartID = 0;
            
            bool validProduct = int.TryParse(Request.QueryString["ID"].ToString(), out PartID);
            if (validProduct)
            {
                DeleteRecord(PartID);
            }
  
            else
                Response.Redirect("Default.aspx");
        }
        else if (Request.QueryString["ID1"] != null)
        {
            int ModelID = 0;
            bool validModel = int.TryParse(Request.QueryString["ID1"].ToString(), out ModelID);
            if (validModel)
            {
                DeleteModel(ModelID);
            }

        }
        else
            Response.Redirect("Default.aspx");
    }

    void DeleteRecord(int ID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "DELETE FROM PartTbl WHERE PartID=@PartID";
        cmd.Parameters.AddWithValue("@PartID", ID);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["delete"] = "yes";
        Response.Redirect("Default.aspx");
    }

    void DeleteModel(int ID1)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "DELETE FROM ModelTbl WHERE ModelID=@ModelID";
        cmd.Parameters.AddWithValue("@ModelID", ID1);
        cmd.ExecuteNonQuery();
        con.Close();
        Session["delete"] = "yes";
        Response.Redirect("Default.aspx");
    }
}