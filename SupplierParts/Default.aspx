<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Supplier and Parts
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
            <div class="col-lg-4">
                <div class="input-group">
                    <span class="input-group-addon">Select Supplier: </span>
                    <asp:DropDownList ID="ddlSupplier" runat="server" class="form-control" />        
                </div>
            </div>
            <div id="keyword" runat="server" class="col-lg-4" visible="true">
                <div class="input-group">
                    <asp:TextBox ID="txtSearchCar" runat="server" class="form-control" placeholder="Search Car..."/>
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                </div>
            </div>
            <br /><br />
            <table class="table table-hover">
                <thead>
                    <th>Model Name</th>
                    <th>Part Name</th>
                    <th>Year</th>
                    <th>Estimated Price</th>
                    <th>Estimated Time</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSpecific" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("SpecificID") %></td>
                                <td><%# Eval("PartName") %></td>
                                <td><%# Eval("ModelName") %></td>
                                <td><%# Eval("Year") %></td>
                                <td><%# Eval("EstPrice") %> </td>
                                <td><%# Eval("EstTime") %></td>
                                <td>
                                    <a href='Details.aspx?ID=<%# Eval("SpecificID") %>'><i class="fa fa-search"></i></a>&nbsp;
                                    <a href='Delete.aspx?ID=<%# Eval("SpecificID") %>' onclick='return confirm("Delete record?")'>
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

