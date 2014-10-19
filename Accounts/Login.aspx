<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Accounts_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        
        <div class="col-lg-12">
            <div class="form-group">
                Please enter your Email Address and Password. <a href="Add.aspx">Register</a> if you don't have an account.
            </div>
        </div>

        <div class="col-lg-4">

            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" type="email" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Password</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password" MaxLength="50" required />
                </div>
            </div>

            <div class="col-lg-12">
                <span class="pull-right">
                    <asp:Button ID="Button1" runat="server" class="btn btn-default" Text="Cancel" 
                        PostBackUrl="~/Accounts/Default.aspx" formnovalidate />
                    <asp:Button ID="Button2" runat="server" class="btn btn-success" Text="Login" OnClick="btnLogin_Click" />
                </span>
            </div>
        </div>
        

    </form>
</asp:Content>

