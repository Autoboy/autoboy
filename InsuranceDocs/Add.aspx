<<<<<<< HEAD
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="InsuranceDocs_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Upload Insurance Documents
=======
﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Accounts_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Add an Account
>>>>>>> origin/master
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
        <div class="col-lg-6">
            <div class="form-group">
<<<<<<< HEAD
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
=======
                <label class="control-label col-lg-4">Full Name</label>
                <div class="col-lg-8">
                    <asp:DropDownList ID="ddlUID" runat="server" class="form-control" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">License</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtLicense" runat="server" class="form-control" type="email" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Password</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password" MaxLength="20" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">First Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtFN" runat="server" class="form-control" MaxLength="80" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Last Name</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtLN" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group">
                <label class="control-label col-lg-4">Street</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtStreet" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Municipality</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtAddress" runat="server" class="form-control" MaxLength="100" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">City</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtCity" runat="server" class="form-control" MaxLength="50" required />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-lg-4">Mobile</label>
                <div class="col-lg-8">
                    <asp:TextBox ID="txtMobile" runat="server" class="form-control" MaxLength="12" />
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <span class="pull-right">
                <asp:Button ID="btnCancel" runat="server" class="btn btn-default" Text="Cancel" 
                    PostBackUrl="~/Accounts/Default.aspx" formnovalidate />
                <asp:Button ID="btnAdd" runat="server" class="btn btn-success" Text="Add" OnClick="btnAdd_Click" />
            </span>
>>>>>>> origin/master
        </div>
    </form>
</asp:Content>

