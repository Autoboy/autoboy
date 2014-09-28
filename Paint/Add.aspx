<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Paint_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Color
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Color</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtColor" runat="server" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Supplier</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlSupplier" runat="server" class="form-control" />
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Accounts/Default.aspx" formnovalidate />
                <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
            </span>
        </div>
    </form>
</asp:Content>

