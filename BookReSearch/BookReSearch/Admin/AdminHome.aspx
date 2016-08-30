<%@ Page Title="Book ReSearch Admin -Home" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="Admin_AdminHome" Codebehind="AdminHome.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Admin Home</h3>
    <h5>Inventory Admin</h5>
    <p>
        <a href="/Admin/Categories/List.aspx">Manage categories</a></p>
    <p>
        <a href="/Admin/SubCategories/List.aspx">Manage subcategories</a></p>
    <p>
        <a href="/Admin/Books/List.aspx">Manage books</a></p>
    <p>
        <a href="/Admin/BookTitles/List.aspx">Manage book titles</a></p>
    <h5>Patron Admin</h5>
    <p>
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Admin/Patrons.aspx">Manage patrons</asp:HyperLink></p>
    <p>
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Admin/MobilePatronsList.aspx">View patrons list (mobile)</asp:HyperLink></p>
</asp:Content>

