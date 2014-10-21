using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

public partial class InsuranceDocs_Add : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //GetUserID();
            //GetModel();
            //txtEmail.Text = DateTime.Now.ToString("yyyy-MM-dd");

        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO InsuranceDocumentTbl VALUES (@UID, @License, @PicLicense, " +
            "@ORCR, @PicORCR, @Affidavit, @PicAffidavit, @DateSubmitted, @DateModified, " +
            "@Photos, @Photo1, @Photo2, @Photo3, @Status)";

        cmd.Parameters.AddWithValue("@UID", 1);
        cmd.Parameters.AddWithValue("@License", DBNull.Value);

        if (fuLicense.HasFile)
        {
            cmd.Parameters.AddWithValue("@PicLicense", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuLicense.FileName);
            fuLicense.SaveAs(Server.MapPath("~/Images/InsuranceDocs/License/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuLicense.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@PicLicense", String.Empty);
        }

        cmd.Parameters.AddWithValue("@ORCR", DBNull.Value);

        if (fuORCR.HasFile)
        {
            cmd.Parameters.AddWithValue("@PicORCR", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuORCR.FileName);
            fuORCR.SaveAs(Server.MapPath("~/Images/InsuranceDocs/ORCR/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuORCR.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@PicORCR", String.Empty);
        }

        cmd.Parameters.AddWithValue("@Affidavit", DBNull.Value);

        if (fuAffidavit.HasFile)
        {
            cmd.Parameters.AddWithValue("@PicAffidavit", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuAffidavit.FileName);
            fuAffidavit.SaveAs(Server.MapPath("~/Images/InsuranceDocs/Affidavit/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuAffidavit.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@PicAffidavit", String.Empty);
        }

        cmd.Parameters.AddWithValue("@DateSubmitted", DateTime.Now);
        cmd.Parameters.AddWithValue("@DateModified", DBNull.Value);
        cmd.Parameters.AddWithValue("@Photos", DBNull.Value);

        if (fuPic1.HasFile)
        {
            cmd.Parameters.AddWithValue("@Photo1", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic1.FileName);
            fuPic1.SaveAs(Server.MapPath("~/Images/InsuranceDocs/Photos/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic1.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Photo1", String.Empty);
        }

        if (fuPic2.HasFile)
        {
            cmd.Parameters.AddWithValue("@Photo2", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic2.FileName);
            fuPic2.SaveAs(Server.MapPath("~/Images/InsuranceDocs/Photos/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic2.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Photo2", String.Empty);
        }

        if (fuPic3.HasFile)
        {
            cmd.Parameters.AddWithValue("@Photo3", DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic3.FileName);
            fuPic3.SaveAs(Server.MapPath("~/Images/InsuranceDocs/Photos/" + DateTime.Now.ToString("yyyyMMddHHmm") + "-" + fuPic3.FileName));
        }
        else
        {
            cmd.Parameters.AddWithValue("@Photo3", String.Empty);
        }

        cmd.Parameters.AddWithValue("@Status", "Incomplete");

        cmd.ExecuteNonQuery();
        con.Close();
        Session["add"] = "yes";
        Response.Redirect("Default.aspx");
    }
}