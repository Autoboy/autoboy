<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Parts_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Car Parts & Car Models
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
        </div>
        <div class="col-lg-6">
            <h2>Add Car Model</h2>
            <div class="form-group">
                <label class="control-label col-lg-3">Model Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtModel" runat="server" class="form-control" MaxLength="50" />
                </div>
            </div>
            <div class="form-group">
                <div class ="col-lg-offset-3 col-lg-8">
                    
                    <span class="pull-right">
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                        PostBackUrl="~/Parts/Default.aspx" formnovalidate />
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add Model" OnClick="btnAdd_Click" />
                    </span>
                </div>
            </div>
        </div>
        <div class ="col-lg-6">
            <table class="table table-hover">
                <h2>Car Model</h2>
                <thead>
                    <th>#</th>
                    <th>Model Name</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvModels" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ModelID") %></td>
                                <td><%# Eval("ModelName") %></td>
                                <td>
                                    <a href='Delete.aspx?ID1=<%# Eval("ModelID") %>' onclick='return confirm("Delete record?")'>
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
        
        <div class="col-lg-6">
            <h2>Add Car Part</h2>
            <div class="form-group">
                <label class="control-label col-lg-3">Part Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPart" runat="server" class="form-control" MaxLength="50" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-3">Description</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtDesc" runat="server" class="form-control" MaxLength="200" />
                </div>
            </div>

            <div class ="form-group">
                <div class ="col-lg-offset-3 col-lg-8">
                    <span class="pull-right">
                        <asp:Button ID="btnCancel1" runat="server" class="btn btn-default" Text="Cancel" 
                        PostBackUrl="~/Parts/Default.aspx" formnovalidate />
                        <asp:Button ID="btnAdd1" runat="server" class="btn btn-success" Text="Add Part" OnClick="btnAdd1_Click" />
                    </span>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            
            <table class="table table-hover">
                <h2>Car Part</h2>
                <thead>
                    <th>#</th>
                    <th>Part Name</th>
                    <th>Description</th>
                    <th></th>
                </thead>
                <tbody>
                    <asp:ListView ID="lvParts" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("PartID") %></td>
                                <td><%# Eval("PartName") %></td>
                                <td><%# Eval("Description") %></td>
                                <td>
                                    <a href='Delete.aspx?ID=<%# Eval("PartID") %>' onclick='return confirm("Delete record?")'>
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

