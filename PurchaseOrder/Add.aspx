<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="PurchaseOrder_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Purchase Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Purchase Order Number</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtPONo" runat="server" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Supplier</label>
                <div class="col-lg-6">
                    <asp:DropDownList ID="ddlSupplier" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Part</label>
                <div class="col-lg-6">
                    <asp:DropDownList ID="ddlSpecific" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Quantity</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtQty" runat="server" class="form-control" MaxLength="4" required />
                    <asp:TextBox ID="txtPrice" Type="Hidden" runat="server"/>
                </div>
            </div>
            <div class="col-lg-6">
                <span class="col-lg-10">
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                        PostBackUrl="~/PurchaseOrder/Default.aspx" formnovalidate />
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
                </span>
            </div>
            
        </div>
         <div class="col-lg-6">
            <div id="error" runat="server" class="alert alert-danger" visible="false">
                Specific part is already existing.
            </div>
              <h3>Purchase Order Item: </h3>
            <table  class="table table-hover">
                <thead>
                    <th>Specific Part Name</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvPurchaseOrderItem" runat="server" OnItemCommand="lvPurchaseOrderItem_ItemCommand" >
                        <ItemTemplate>
                            <tr>
                                <%--<td><asp:Literal id="ltRefID" runat="server" Text='<%# Eval("POID") %>' Visible="false" /><%# Eval("Specific") %></td>--%>
                                <td><%# Eval("Specific") %></td>
                                <td><%# Eval("Qty") %></td>
                                <td><%# Eval("TotalPrice", "{0: #,###.00}") %></td>
                                <td><asp:LinkButton ID="btnDelete" runat="server" CommandName="deleteitem"
                                    OnClientClick='return confirm("Delete spec?");'><i class="fa fa-trash-o"></i></asp:LinkButton></td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="5">
                                    <h2 class="text-center">No records found.</h2>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
             <div class="col-lg-12">
                <span class="pull-right">
                    <asp:Button ID="btnComplete" runat="server" class="btn btn-success" Text="Complete" OnClick="btnComplete_Click" />
                </span>
            </div>
            </div>
           
        
    </form>
</asp:Content>

