<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="BookOnline_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Accounts
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
                    <th>Purchase Order Number</th>
                    <th>Date</th>
                    <th>Supplier</th>

                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvCars" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PONumber") %></td>
                                <td><%# Eval("Date") %></td>
                                <td><%# Eval("Supplier") %></td>
                                
                                <td>
                                    <a href='Details.aspx?PONumber=<%# Eval("PONumber") %>'><i class="fa fa-search"></i></a>&nbsp;
                                    <%--<a href='Delete.aspx?ID=<%# Eval("POID") %>' onclick='return confirm("Delete record?")'>--%>
                                        <%--<i class="fa fa-trash-o"></i>--%>
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

