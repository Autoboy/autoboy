<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddDetails.aspx.cs" Inherits="BookOnlineDetails_Add"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Book Online
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">First Name:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control" AutoComplete="Off" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Last Name:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtLastName" runat="server" class="form-control" AutoComplete="Off" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Email Address:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" AutoComplete="Off" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile Number:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" AutoComplete="Off" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-12">
                <span class="pull-right">
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" />
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Next" OnClick="btnAdd_Click" />                    
                </span>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

