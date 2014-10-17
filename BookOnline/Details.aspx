<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="PurchaseOrder_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Purchase Order Number: <asp:Literal ID="ltID" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">

    <form runat="server" class="form-horizontal">
        <div class="col-lg-12">
            <div id="add" runat="server" class="alert alert-success" visible="false">
                Record added.
            </div>
            <div id="update" runat="server" class="alert alert-success" visible="false">
                Record updated.
            </div>
            <div id="delete" runat="server" class="alert alert-success" visible="false">
                Record deleted.
            </div>

            <br /><br />
            <table class="table table-hover">
                <thead>
                    <th>Specific Part</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>

                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvPOItems" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("Specific") %></td>
                                <td><%# Eval("EstPrice") %></td>
                                <td><%# Eval("Qty") %></td>
                                <td><%# Eval("TotalPrice") %></td>
                                
                                <td>
                                    <%--<a href='Details.aspx?ID=<%# Eval("PONumber") %>'><i class="fa fa-search"></i></a>&nbsp;--%>
                                    <a href='delete.aspx?id=<%# Eval("POID") %>' onclick='return confirm("delete record?")'>
                                        <i class="fa fa-trash-o"></i>
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="8"><h2 class="text-center">No records found.</h2></td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                </tbody>
            </table>
        </div>
    </form>
</asp:Content>

