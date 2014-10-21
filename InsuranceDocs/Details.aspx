<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="InsuranceDocs_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Insurance Documents Checklist<asp:Literal ID="ltID" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" Runat="Server">
    <form runat="server" class="form-horizontal">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
       <asp:UpdatePanel ID="upInsuranceChecklist" runat="server">
            <ContentTemplate>
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="control-label col-lg-8">
                            <h4><asp:CheckBox ID="cbLicense" runat="server" Text="License and Official Receipt&nbsp" TextAlign="Left" OnCheckedChanged="cbInsurance_CheckedChanged" /></h4>
                            <asp:Literal ID="litLicense" runat="server" Visible="false"></asp:Literal>
                            <div id="picInsurance" runat="server" class="form-group">
                                <div class="col-lg-12">
                                    <asp:HyperLink ID="hlkLicense" runat="server" Target="_blank" class="btn btn-info" Text="View Document" />
                                </div>
                            </div>
                        </div>
                        <div class="control-label col-lg-8">
                            <h4><asp:CheckBox ID="cbORCR" runat="server" Text="ORCR&nbsp" TextAlign="Left" OnCheckedChanged="cbORCR_CheckedChanged" /></h4>
                            <div id="picORCR" runat="server" class="form-group">
                                <div class="col-lg-12">
                                    <asp:HyperLink ID="hlkORCR" runat="server" Target="_blank" class="btn btn-info" Text="View Document" />
                                </div>
                            </div>
                        </div>
                        <div class="control-label col-lg-8">
                            <h4><asp:CheckBox ID="cbAffidavit" runat="server" Text="Letter of Affidavit&nbsp" TextAlign="Left" OnCheckedChanged="cbAffidavit_CheckedChanged" /></h4>
                            <div id="picAffidavit" runat="server" class="form-group">
                                <div class="col-lg-12">
                                    <asp:HyperLink ID="hlkAffidavit" runat="server" Target="_blank" class="btn btn-info" Text="View Document" />
                                </div>
                            </div>
                        </div>
                        <div class="control-label col-lg-8">
                            <h4><asp:CheckBox ID="cbPhotos" runat="server" Text="Photos of Damage&nbsp" TextAlign="Left" OnCheckedChanged="cbPhotos_CheckedChanged" /></h4>
                            <div id="picPhotos" runat="server" class="form-group">
                                <div class="col-lg-12">
                                    <asp:HyperLink ID="hlkPhoto1" runat="server" Target="_blank" class="btn btn-info" Text="View Photo 1" />
                                    <asp:HyperLink ID="hlkPhoto2" runat="server" Target="_blank" class="btn btn-info" Text="View Photo 2" />
                                    <asp:HyperLink ID="hlkPhoto3" runat="server" Target="_blank" class="btn btn-info" Text="View Photo 3" />
                                </div>
                            </div>
                        </div>
                        <div class="control-label col-lg-8">

                        </div>
                    </div>
                 </div>

            </ContentTemplate>
        </asp:UpdatePanel> 
    </form>
</asp:Content>

