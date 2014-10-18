<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddSupplierParts.aspx.cs" Inherits="SupplierParts_Add"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Manage Supplier-Part Link
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <asp:ScriptManager runat="server" />
            <asp:UpdatePanel ID="upParts" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlModels" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="lvSupplierPart" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="lvSpecView" EventName="ItemCommand" />
                </Triggers>
                <ContentTemplate>
        <div class="col-lg-6">
            <h4>Select A Supplier</h4>
            <div class="form-group">
                    <label class="control-label col-lg-3">Supplier</label>
                    <div class="col-lg-4">
                        <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-control"/>
                    </div>
                </div>
            <h4>Select A Model</h4>
               <div class="form-group">
                <label class="control-label col-lg-3">Model</label>
                <div class="col-lg-4">
                    <asp:DropDownList ID="ddlModels" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlModels_SelectedIndexChanged" />
                </div>
            </div>
            <h4>Select a Part</h4>

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
                                
                                        <td><asp:Literal id="ltPartID" runat="server" Text='<%# Eval("PartID") %>' Visible="false" /><%# Eval("PartName") %><asp:Literal id="ltSpecificID" runat="server" Text='<%# Eval("SpecificID") %>' Visible="false" /></td>
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

             
            <asp:Panel ID="pnlParts" runat="server" Visible="false">
                
                <div class="pull-left">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" 
                        OnClientClick='return confirm("Submit record?")' Visible="true" />
                </div>
            </asp:Panel>
        </div>
        <div class="col-lg-6">
            <div id="error" runat="server" class="alert alert-danger" visible="false">
                Part is already existing.
            </div>
            <h3>Parts to be Added to: </h3>
            <table  class="table table-hover">
                <thead>
                    <th>Part Name</th>
                    <th>Year</th>
                    <th>Estimated Price</th>
                    <th>Estimated Time</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvSupplierPart" runat="server" OnItemCommand="lvSupplierPart_ItemCommand" >
                        <ItemTemplate>
                            <tr>
                                <td><asp:Literal id="ltRefID" runat="server" Text='<%# Eval("RefID") %>' Visible="false" /></td>
                                
                                <td><%# Eval("PartName") %></td>
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
            
            
        </div>
                                    </ContentTemplate>
            </asp:UpdatePanel>
    </form>
</asp:Content>

