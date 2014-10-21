<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="ChangePass.aspx.cs" Inherits="Accounts_ChangePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Change Password
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-4">

        </div>
        <div class="col-lg-4">

            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" type="email" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Old Password</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">New Password</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtNPass" runat="server" class="form-control" TextMode="Password" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Re-type Password</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtRPass" runat="server" class="form-control" TextMode="Password" MaxLength="50" required />
                </div>
            </div>

        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="Button1" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Accounts/Default.aspx" formnovalidate />
                <asp:Button ID="Button2" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
            </span>
        </div>
        </div>
        

    </form>
</asp:Content>

