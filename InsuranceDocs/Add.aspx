<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="InsuranceDocs_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Upload Insurance Documents
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">License and Official Receipt</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuLicense" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">ORCR</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuORCR" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Notarized Affidavit</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuAffidavit" runat="server" class="form-control" />                    
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Photos of Damaged Vehicle</label>
                <div class="col-lg-8">
                    <asp:FileUpload ID="fuPic1" runat="server" class="form-control" />
                    <asp:FileUpload ID="fuPic2" runat="server" class="form-control" /> 
                    <asp:FileUpload ID="fuPic3" runat="server" class="form-control" />                     
                </div>
            </div>
            <div class="form-group">
                <div class="control-label col-lg-12">
                <span class="pull-right">
                    <asp:Button ID="Button1" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/InsuranceDocs/Default.aspx" formnovalidate />
                    <asp:Button ID="Button2" runat="server" class="btn btn-success" Text="Upload Documents" OnClick="btnAdd_Click" />
                </span>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

