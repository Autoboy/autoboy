﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Suppliers_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Suppliers
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
                    <span class="input-group-addon">Search By:</span>
                    <asp:DropDownList ID="ddlTypes" runat="server" class="form-control"
                        OnSelectedIndexChanged="ddlTypes_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem>Keyword</asp:ListItem>
                        <asp:ListItem>Status</asp:ListItem>    
                    </asp:DropDownList>
                </div>
            </div>
            <div id="keyword" runat="server" class="col-lg-4" visible="true">
                <div class="input-group">
                    <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Keyword..."
                        OnTextChanged="txtSearch_TextChanged" AutoPostBack="true" />
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                </div>
            </div>
            <div id="status" runat="server" class="col-lg-4" visible="false">
                <asp:DropDownList ID="ddlStatus" runat="server" class="form-control"
                    OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>
                    <asp:ListItem>Blocked</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br /><br />
            <table class="table table-hover">
                <thead>
                    <th>#</th>
                    <th>Supplier</th>
                    <th>Address</th>
                    <th>Email Address</th>
                    <th>Mobile Number</th>
                    
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSuppliers" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("SupplierID") %></td>
                                <td><%# Eval("Supplier") %></td>
                                <td><%# Eval("Street") %> <%# Eval("Municipality") %>, <%# Eval("City") %></td>
                                <td><%# Eval("EmailAddress") %></td>
                                <td><%# Eval("MobileNo") %></td>
                                <td>
                                    <a href='Details.aspx?ID=<%# Eval("SupplierID") %>'><i class="fa fa-search"></i></a>&nbsp;
                                    <a href='Delete.aspx?ID=<%# Eval("SupplierID") %>' onclick='return confirm("Delete record?")'>
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

