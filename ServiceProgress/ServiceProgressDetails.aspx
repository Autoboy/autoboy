<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <h2>Job Order Progress</h2>
        
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-3">Customer Email:</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlCustomer" runat="server" class="form-control" ReadOnly="true"/>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Date Start:</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtDateStart" runat="server" class="form-control" type="date" />
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
                                <td><%# Eval("ServiceType") %></td>
                                <td><%# Eval("PartName") %></td>
                                <td><%# Eval("EstPrice", "{0: #,###.00}") %></td>
                                <td><%# Eval("EstTime") %></td>
                                <td><asp:Literal ID="ltTID" runat="server" Text='<%# Eval("TID") %>' Visible="false" />
                                    <asp:TextBox ID="txtFinalPrice" runat="server" class="form-control" type="number"
                                            min="1.00" max="1000000.00" step="0.01" Text='<%# Eval("FinalPrice") %>'/>
                                </td>
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
                <label class="control-label col-lg-7">Final Cost</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTotalEstimatedPrice" runat="server" class="form-control"  MaxLength="80" Enabled="false"/>
                </div>
                <label class="control-label col-lg-7">Transaction Number</label>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtTransactionNumber" runat="server" class="form-control"  MaxLength="80" Enabled="false"/>
                </div>




           
            
                
            </div>
            <div class="col-lg-10">
                <span class="pull-right">
                    <asp:Button ID="btnFinalizeJO" runat="server" class="btn btn-success" Text="Finalize Job Order" />
                    <asp:Button ID="btnCancelJO" runat="server" class="btn btn-default" Text="Cancel" />
                </span>
             </div>

            </div>
                                  
          
    </form>
</asp:Content>

