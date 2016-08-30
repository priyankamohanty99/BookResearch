<%@ Page Title="Book ReSearch - Database Error" Language="C#" MasterPageFile="~/Error.master" AutoEventWireup="true" CodeBehind="ErrorDb.aspx.cs" Inherits="BookReSearch.WebForm2" %>

<%@ OutputCache Duration="60" VaryByParam="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Database error</h3>
    <p>Administrator has been notified of the issue. Please try again later.</p>
    <p>Please click <a href="Default.aspx">here</a> to go to the home page.</p>
</asp:Content>
