<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Logs.aspx.cs" Inherits="Reports_Logs" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-12">
            <asp:TextBox ID="txtStart" runat="server" CssClass="form-control col-lg-3" type="date" />
            <asp:TextBox ID="txtEnd" runat="server" CssClass="form-control col-lg-3" type="date" />
            <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-default" Text="Generate" OnClick="btnGenerate_Click" />
            <div class="row"></div>
            <CR:CrystalReportViewer ID="crvLogs" runat="server" ToolPanelView="None" 
                EnableDatabaseLogonPrompt="False" AutoDataBind="true" />
        </div>
    </form>
</asp:Content>

