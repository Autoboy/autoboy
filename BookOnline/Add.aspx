<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="BookOnline_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Purchase Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtEAdd" runat="server" class="form-control" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">ServiceType</label>
                <div class="col-lg-6">
                    <td>
                        <asp:DropDownList ID="ddlServiceType" runat="server" CssClass="form-control" />
                            <asp:ListItem>Repair</asp:ListItem>
                            <asp:ListItem>Replace</asp:ListItem>
                            <asp:ListItem>Paint</asp:ListItem>
                        </asp:DropDownList></td>
                    </td>
                </div>
            </div>
            
            <div class="col-lg-6">
                <span class="col-lg-10">
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                        PostBackUrl="~/PurchaseOrder/Default.aspx" formnovalidate />
                    <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
                </span>
            </div>
            
            <table  class="table table-hover">
                        <thead>
                            <th>Part Name</th>
                            <th>Year</th>
                            <th>Estimated Price</th>
                            <th>Estimated Time</th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvSpecView" runat="server" OnItemCommand="lvSpecView_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                
                                        <td><%# Eval("Specific") %><asp:Literal id="ltSpecificID" runat="server" Text='<%# Eval("SpecificID") %>' Visible="false" /></td>
                                        <td><%# Eval("Year") %></td>
                                        <td><%# Eval("EstPrice", "{0: #,###.00}") %></td>
                                        <td><%# Eval("EstTime") %></td>
                                        <td><asp:LinkButton ID="btnAddLink" runat="server" CommandName="addLink"><i class="fa fa-plus-circle"></i></asp:LinkButton></td>
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


        </div>
            </table>
             <div class="col-lg-12">
                <span class="pull-right">
                    <asp:Button ID="btnComplete" runat="server" class="btn btn-success" Text="Complete" OnClick="btnComplete_Click" />
                </span>
            </div>
            </div>
           
        
    </form>
</asp:Content>

