<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Car_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add an Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Chassis Number</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtChassisNo" runat="server" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Plate Number</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPlateNo" runat="server" class="form-control" MaxLength="7" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Model</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlModel" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Year</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtYear" runat="server" class="form-control" MaxLength="4" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">User Account</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlAccount" runat="server" class="form-control" />
                </div>
            </div>
           
        </div>
        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Car/Default.aspx" formnovalidate />
                <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
            </span>
        </div>
    </form>
</asp:Content>

