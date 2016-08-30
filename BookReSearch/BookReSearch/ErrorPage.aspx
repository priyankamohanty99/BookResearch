<%@ Page Title="Book ReSearch - Error" Language="C#" MasterPageFile="~/Error.master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="BookReSearch.ErrorPage" %>

<%@ OutputCache Duration="60" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Error</h3>
    <p>Error processing your request. Please contact the site administrator.</p>
    <p>Please click <a href="Default.aspx">here</a> to go to the home page.</p>
</asp:Content>
