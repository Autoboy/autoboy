<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="JobOrderDetails.aspx.cs" Inherits="JobOrder_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Viewing Job Order
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
            
            <h4>Job Order Parts</h4>

      <table  class="table table-hover">
                <thead>
                    <th>Service Type</th>
                    <th>Part Name</th>    
                    <th>Estimated Price</th>
                    <th>Estimated Time</th>
                    <th>Enter Final Price</th>

                    
                </thead>
                <tbody>
                    <asp:ListView ID="lvJobOrderParts" runat="server" >
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ServiceType") %><asp:Literal id="ltServiceID" runat="server" Text='<%# Eval("ServiceID") %>' Visible="false" /></td>
                                <td><asp:Literal id="ltRefID" runat="server" Text='<%# Eval("TID") %>' Visible="false" /><%# Eval("PartName") %></td>
                                <td><%# Eval("EstPrice", "{0: #,###.00}") %></td>
                                <td><%# Eval("EstTime") %></td>
                                <td><%# Eval("FinalPrice") %></td>
                                
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
                <label class="control-label col-lg-3">Enter Final Price:</label>
                <div class="col-lg-3">
                    <asp:DropDownList ID="ddlPart" runat="server" class="form-control" />
                </div>
                <div class="col-lg-6">
                    <asp:TextBox ID="txtFinalPrice" runat="server" class="form-control" />
                </div>
            </div>


             
            <asp:Panel ID="pnlParts" runat="server" Visible="false">
                
              
            </asp:Panel>
            
        </div>
            
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-3">Car Model:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtCarModel" runat="server" class="form-control" ReadOnly="true"/>
                </div>
            </div>
            <div id="error" runat="server" class="alert alert-danger" visible="false">
                Part is already existing.
            </div>
            
            
            <div class="form-group">
                <label class="control-label col-lg-7">Estimated Time</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTotalEstimatedTime" runat="server" class="form-control" MaxLength="80" Enabled="false" />
                </div>
                <label class="control-label col-lg-7">Estimated Cost</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTotalEstimatedPrice" runat="server" class="form-control"  MaxLength="80" Enabled="false"/>
                </div>
                <label class="control-label col-lg-7">TransactionNumber</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTransactionNumber" runat="server" class="form-control"  MaxLength="80" Enabled="false"/>
                </div>
                
            </div>
            <div class="col-lg-10">
                <span class="pull-right">
                    <asp:Button ID="btnCreateJO" runat="server" class="btn btn-success" Text="Finalize Job Order" />
                    <asp:Button ID="btnCancelJO" runat="server" class="btn btn-default" Text="Cancel" />
                </span>
             </div>

            </div>
                                  
          
    </form>
</asp:Content>

