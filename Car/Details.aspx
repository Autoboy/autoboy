<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Car_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Cars<asp:Literal ID="ltID" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Status</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                        <asp:ListItem>Blocked</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">User Type</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlTypes" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Email</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" type="email" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Password</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" MaxLength="20" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">First Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtFN" runat="server" class="form-control" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Last Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtLN" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Street</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtStreet" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Municipality</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="100" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">City</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="12" />
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Accounts/Default.aspx" formnovalidate />
                <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
            </span>
        </div>
    </form>
</asp:Content>

