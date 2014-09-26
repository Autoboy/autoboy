using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

using System.Security.Cryptography;
using System.Data.SqlClient;

public class Helper
{
	public Helper()
	{
        
	}

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    }

    public static string CreateSHAHash(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }

    public static void AddLog(string userID, string type, string desc)
    {
        SqlConnection con = new SqlConnection(GetCon());
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO AuditTbl VALUES (@UID, @LogType, @Description, @LogDate)";
        cmd.Parameters.AddWithValue("@UID", userID);
        cmd.Parameters.AddWithValue("@LogType", type);
        cmd.Parameters.AddWithValue("@Description", desc);
        cmd.Parameters.AddWithValue("@LogDate", DateTime.Now);
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
