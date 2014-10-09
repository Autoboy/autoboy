<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Query_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Send An Inquiry
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Subject</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtSubject" runat="server" AutoComplete="Off" class="form-control" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtEmail" runat="server" AutoComplete="Off" class="form-control" Type="email" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Description</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtDescription" runat="server" AutoComplete="Off" TextMode="MultiLine" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Upload Photo(s)</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuPic1" runat="server" class="form-control" />
                    <asp:FileUpload ID="fuPic2" runat="server" class="form-control" />
                    <asp:FileUpload ID="fuPic3" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Upload Document</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuDoc1" runat="server" class="form-control" />
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Accounts/Default.aspx" formnovalidate />
                <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Send Inquiry" OnClick="btnAdd_Click" />
            </span>
        </div>
    </form>
</asp:Content>

