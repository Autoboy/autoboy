<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Suppliers_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Supplier #<asp:Literal ID="ltID" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            
            <div class="form-group">
                <label class="control-label col-lg-4">Supplier Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierName" runat="server" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Street</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierStreet" runat="server" class="form-control" MaxLength="80" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Municipality</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierMunicipality" runat="server" class="form-control" MaxLength="20" />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">City</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierCity" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Email</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierEmail" runat="server" type="email" class="form-control" MaxLength="100" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile No</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierMobileNo" runat="server" class="form-control" MaxLength="50" />
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Suppliers/Default.aspx" formnovalidate />
                <asp:Button ID="btnUpdate" runat="server" class="btn btn-success" Text="Update" OnClick="btnUpdate_Click" />
            </span>
        </div>
    </form>
</asp:Content>

