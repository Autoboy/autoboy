<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Log2.aspx.cs" Inherits="Reports_Log2" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="txtStart" runat="server" CssClass="form-control col-lg-3" type="date" />
            <asp:TextBox ID="txtEnd" runat="server" CssClass="form-control col-lg-3" type="date" />
            <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-default" Text="Generate" OnClick="btnGenerate_Click" />
            
        <CR:CrystalReportViewer ID="crvLogs" runat="server" ToolPanelView="None" 
                EnableDatabaseLogonPrompt="False" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="350px" />
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="Reports\rptLogs.rpt">
            </Report>
        </CR:CrystalReportSource>
    </div>
    </form>
</body>
</html>
