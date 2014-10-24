<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="JobOrder_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Job Order List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <table class="table table-hover">
                <thead>
                    <th>Transaction Number</th>
                    <th>Full Name</th>
                    <th>Plate Number</th>
                    <th>Car</th>
                    <th>Date Ordered</th>
                    <th>Status</th>

                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvJO" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("TransactionNumber") %></td>
                                <td><%# Eval("FullName") %></td>
                                <td><%# Eval("PlateNo") %></td>
                                <td><%# Eval("ModelName")  %> <%# Eval("Year")%></td>
                                <td><%# Eval("OrderDate") %></td>
                                <td><%# Eval("Status") %></td>
                                
                                <td>
                                    <a href='JobOrderDetails.aspx?JOID=<%# Eval("OrderID") %>'><i class="fa fa-search"></i></a>&nbsp;
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
       
    </form>
</asp:Content>

