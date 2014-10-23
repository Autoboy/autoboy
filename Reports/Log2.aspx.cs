using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class Reports_Log2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    void GetLogs(DateTime start, DateTime end)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT AuditTbl.LogID, AccountTbl.LastName, AccountTbl.FirstName, " +
            "AuditTbl.LogType, AuditTbl.Description, AuditTbl.LogDate FROM AuditTbl " +
            "INNER JOIN AccountTbl ON AuditTbl.UID = AccountTbl.UID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "LogsReport");

        ReportDocument report = new ReportDocument();
        report.Load(Server.MapPath("~/Reports/rptLogs.rpt"));
        report.SetDatabaseLogon("sa", "benilde", @"JOHNEDWARD-PC\SA", "Autoboy");
        report.SetDataSource(ds);
        report.SetParameterValue("Start", start.ToString("yyyy-MM-dd") + " 0:00:00");
        report.SetParameterValue("End", end.AddDays(1).AddMilliseconds(-1)); // 23:59:59

        crvLogs.ReportSource = report;
        crvLogs.DataBind();
        con.Close();
    }


    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        Response.Redirect("Logs.aspx?start=" + txtStart.Text + "&end=" + txtEnd.Text);
    }
}