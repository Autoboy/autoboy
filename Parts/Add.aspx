<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Parts_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add Parts & Model
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
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
<<<<<<< HEAD

=======
>>>>>>> origin/master
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Model Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtModel" runat="server" class="form-control" MaxLength="50" />
                </div>
            </div>
            <div class="form-group">
                <div class ="col-lg-offset-4 col-lg-8">
                    <span class="pull-right">
                    <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                        PostBackUrl="~/Parts/Default.aspx" formnovalidate />
                        <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add Model" OnClick="btnAdd_Click" />
                </span>
                        </div>
                
                </div>
            
        </div>
    </form>
</asp:Content>

