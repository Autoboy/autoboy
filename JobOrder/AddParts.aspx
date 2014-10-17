<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="AddParts.aspx.cs" Inherits="SupplierParts_Add"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Create Job Order
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        
        
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-3">Customer Email:</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlCustomer" runat="server" class="form-control" ReadOnly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Car Model:</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlCar" runat="server" class="form-control" ReadOnly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Chassis No:</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlChassisNo" runat="server" class="form-control" ReadOnly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Service Type:</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlServiceType" runat="server" class="form-control" />
                </div>
            </div>
            <h4>Select Parts</h4>

                    <table  class="table table-hover">
                        <thead>
                            <th>Part Name</th>
                            <th>Estimated Price</th>
                            <th>Estimated Time</th>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvCarParts" runat="server" OnItemCommand="lvCarParts_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                
                                        <td>
                                            <asp:Literal id="ltSpecificID" runat="server" Text='<%# Eval("SpecificID") %>' Visible="false" />
                                            <%# Eval("PartName") %></td>
                                        <td><asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" type="number"
                                            min="1.00" max="1000000.00" step="0.01" Text='<%# Eval("EstPrice") %>' /></td>
                                        <td>
                                            <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                            </asp:DropDownList></td>
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
                
              
            </asp:Panel>
        </div>
            
        <div class="col-lg-6">
            <div id="error" runat="server" class="alert alert-danger" visible="false">
                Part is already existing.
            </div>
            <h3>Parts to be Added to: </h3>
            <table  class="table table-hover">
                <thead>
                    <th>Service Type</th>
                    <th>Part Name</th>    
                    <th>Estimated Price</th>
                    <th>Estimated Time</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvJobOrderParts" runat="server" OnItemCommand="lvJobOrderParts_ItemCommand" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ServiceType") %><asp:Literal id="ltServiceID" runat="server" Text='<%# Eval("ServiceID") %>' Visible="false" /></td>
                                <td><asp:Literal id="ltRefID" runat="server" Text='<%# Eval("TID") %>' Visible="false" /><%# Eval("PartName") %></td>
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
            <div class="form-group">
                <label class="control-label col-lg-7">Estimated Time</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTotalEstimatedTime" runat="server" class="form-control" MaxLength="80" Enabled="false" />
                </div>
                <label class="control-label col-lg-7">Estimated Cost</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTotalEstimatedPrice" runat="server" class="form-control"  MaxLength="80" Enabled="false"/>
                </div>
                <label class="control-label col-lg-7">Ito yung Tran Num</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control"  MaxLength="80" Enabled="false"/>
                </div>
                
            </div>
            <div class="col-lg-10">
                <span class="pull-right">
                    <asp:Button ID="btnCreateJO" runat="server" class="btn btn-success" Text="Create Job Order" OnClick="btnCreateJO_Click"/>
                    <asp:Button ID="btnCancelJO" runat="server" class="btn btn-default" Text="Cancel" />
                </span>
             </div>

            </div>
                                  
          
    </form>
</asp:Content>

