<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Query_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    View Account #<asp:Literal ID="ltID" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Status</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlStatus" runat="server" class="form-control">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                        <asp:ListItem>Blocked</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">#</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblID" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Subject</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblSubject" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Description</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblQuery" runat="server" />
                </div>
            </div>
            <div id="Pic1" runat="server" class="form-group">
                <label class="control-label col-lg-4">Photo 1</label>
                <div class="col-lg-8">
                    <asp:Button ID="btnPic1" runat="server" class="btn btn-info" Text="View" />
                </div>
            </div>
            <div id="Pic2" runat="server" class="form-group">
                <label class="control-label col-lg-4">Photo 2</label>
                <div class="col-lg-8">
                    <asp:Button ID="btnPic2" runat="server" class="btn btn-info" Text="View" />
                </div>
            </div>
            <div id="Pic3" runat="server" class="form-group">
                <label class="control-label col-lg-4">Photo 3</label>
                <div class="col-lg-8">
                    <asp:Button ID="btnPic3" runat="server" class="btn btn-info" Text="View" />
                </div>
            </div>
            <div id="Doc" runat="server" class="form-group">
                <label class="control-label col-lg-4">Document</label>
                <div class="col-lg-8">
                    <asp:Button ID="btnDoc" runat="server" class="btn btn-info" Text="View" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Date Submitted</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblQueryDate" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Date Read</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblQueryReadDate" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Email Address</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblEmail" runat="server" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Status</label>
                <div class="col-lg-8">
                    <asp:Label ID="lblStatus" runat="server" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>

