<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddDetails.aspx.cs" Inherits="JobOrderDetails_Add"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Create Job Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">

        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-3">First Name:</label>
          
                <div class="col-lg-8">
                    <asp:TextBox ID="txtFirstName" runat="server" class="form-control"  MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Last Name:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtLastName" runat="server" class="form-control"  MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Email Address:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control"  MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Customer Type:</label>
                <div class="col-lg-4">
                    <asp:DropDownList ID="ddlCustomerType" runat="server" class="form-control"  MaxLength="80" required />
                </div>
            </div>
            <div class="col-lg-10">
            <span class="pull-right">
                <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Next" OnClick="btnAdd_Click" />
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" />
            </span>
        </div>

            </div>
    </form>
</asp:Content>

