<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Accounts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Accounts
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
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
            <asp:UpdatePanel ID="upUsers" runat="server">
                <ContentTemplate>
                    <table class="table table-hover">
                        <thead>
                            <th>#</th>
                            <th>User Type</th>
                            <th>Email</th>
                            <th>User</th>
                            <th>Address</th>
                            <th>Mobile</th>
                            <th>Status</th>
                            <th></th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvUsers" runat="server" OnPagePropertiesChanging="lvUsers_PagePropertiesChanging" OnDataBound="lvUsers_DataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("UID") %></td>
                                        <td><%# Eval("UserType") %></td>
                                        <td><%# Eval("EmailAddress") %></td>
                                        <td><%# Eval("LastName") %>, <%# Eval("FirstName") %></td>
                                        <td><%# Eval("Street") %> <%# Eval("Address") %>, <%# Eval("City") %></td>
                                        <td><%# Eval("MobileNo") %></td>
                                        <td><%# Eval("Status") %></td>
                                        <td>
                                            <a href='Details.aspx?ID=<%# Eval("UID") %>'><i class="fa fa-search"></i></a>&nbsp;
                                            <a href='Delete.aspx?ID=<%# Eval("UID") %>' onclick='return confirm("Delete record?")'>
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
                    <center>
                        <asp:DataPager ID="dpUsers" runat="server" PageSize="10" PagedControlID="lvUsers">
                         <Fields>
                                <asp:NumericPagerField ButtonType="Button"
                                    CurrentPageLabelCssClass="btn btn-success"
                                    NumericButtonCssClass="btn btn-default"
                                    NextPreviousButtonCssClass="btn btn-default" />
                        </Fields>
                        </asp:DataPager>
                    </center>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</asp:Content>

