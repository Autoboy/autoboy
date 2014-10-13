<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Car_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Cars
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
                    <th>Chassis Number</th>
                    <th>Plate Number</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>EmailAddress</th>
                    <th>Status</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvCars" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ChassisNo") %></td>
                                <td><%# Eval("PlateNo") %></td>
                                <td><%# Eval("ModelName") %></td>
                                <td><%# Eval("Year") %></td>
                                <td><%# Eval("LastName") %>, <%# Eval("FirstName") %></td>
                                <td><%# Eval("Status") %></td>
                                <td>
                                    <a href='Details.aspx?ID=<%# Eval("ChassisNo") %>'><i class="fa fa-search"></i></a>&nbsp;
                                    <a href='Delete.aspx?ID=<%# Eval("ChassisNo") %>' onclick='return confirm("Delete record?")'>
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

