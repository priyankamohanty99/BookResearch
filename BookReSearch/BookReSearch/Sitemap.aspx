<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeBehind="Sitemap.aspx.cs" Inherits="BookReSearch.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3><i class="fa fa-map-o" aria-hidden="true"></i>&nbsp;&nbsp;Sitemap</h3>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1" SkinID="tvSkin">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="Default.aspx">Home</a></li>
            <li><a href="AboutUs.aspx">About Us</a></li>
        </ul>
    </div>
</asp:Content>
