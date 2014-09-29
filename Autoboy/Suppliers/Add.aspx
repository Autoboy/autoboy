<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Suppliers_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add a Supplier
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            
            
            <div class="form-group">
                <label class="control-label col-lg-4">Supplier Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierName" runat="server" class="form-control"  MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Street</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierStreet" runat="server" class="form-control"  MaxLength="100" required />
                </div>
            </div>

           <div class="form-group">
               <label class ="control-label col-lg-4">Municipality</label>
               <div class="col-lg-8">
                   <asp:TextBox ID="txtSupplierMunicipality" runat="server" CssClass="form-control" MaxLength="100" required />
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
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierEmail" runat="server" class="form-control" type="email" MaxLength="100" required />
                </div>
            </div>
            
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile Number</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSupplierMobile" runat="server" class="form-control" MaxLength="12" />
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

