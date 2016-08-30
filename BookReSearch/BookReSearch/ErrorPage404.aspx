<%@ Page Title="Book ReSearch - Not Found" Language="C#" MasterPageFile="~/Error.master" AutoEventWireup="true" CodeBehind="ErrorPage404.aspx.cs" Inherits="BookReSearch.ErrorPage404" %>

<%@ OutputCache Duration="60" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Page Not Found</h3>
    <p>The page you requested could not be found. Please contact the site administrator.</p>
    <p>Please click <a href="Default.aspx">here</a> to go to the home page.</p>
</asp:Content>
