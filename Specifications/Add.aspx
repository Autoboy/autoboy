<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Parts_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Specific Part
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <h2>Summary</h2>
            <div class="form-group">
                    <label class="control-label col-lg-3">Part Name</label>
                    <div class="col-lg-9">
                        <asp:DropDownList ID="ddlPartName" runat="server" CssClass="form-control"/>
                    </div>
                </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Model</label>
                <div class="col-lg-9">
                    <asp:DropDownList ID="ddlModels" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Year</label>
                <div class="col-lg-9">
                    <asp:TextBox ID="txtYear" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Estimated Price</label>
                <div class="col-lg-9">
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" type="number" min="0.01" max="100000.00" step="0.01" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Estimate time</label>
                <div class="col-lg-9">
                    <asp:TextBox ID="txtTime" runat="server" CssClass="form-control" type="number" min="1" max="10" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-offset-3 col-lg-8">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-success" Text="Add Spec" OnClick="btnAdd_Click" />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <h2>Specifications</h2>
            <table  class="table table-hover">
                <thead>
                    <th>Part Name</th>
                    <th>Model</th>
                    <th>Year</th>
                    <th>Estimated Price</th>
                    <th>Time</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSpecs" runat="server" OnItemCommand="lvSpecs_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td><asp:Literal id="ltSpecificID" runat="server" Text='<%# Eval("SpecificID") %>' Visible="false" /><%# Eval("ModelName") %></td>
                                <%--<td><%#Eval("PartName") %></td>--%>
                                <td><%# Eval("Year") %></td>
                                <td><%# Eval("EstPrice", "{0: #,###.00}") %></td>
                                <td><%# Eval("EstTime") %></td>
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
            <asp:Panel ID="pnlParts" runat="server" Visible="false">
                
                <div class="pull-right">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" 
                        OnClientClick='return confirm("Submit record?")' Visible="true" OnClick="btnSubmit_Click" />
                </div>
            </asp:Panel>
            
        </div>
    </form>
</asp:Content>

