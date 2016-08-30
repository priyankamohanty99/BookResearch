<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeBehind="CheckedOutBooks.aspx.cs" Inherits="BookReSearch.CheckedOutBooks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3><i class="fa fa-book" aria-hidden="true"></i>&nbsp;&nbsp;Your Checked Out Books</h3>
    <p><asp:Label ID="lblCount" runat="server" Text="Label"></asp:Label></p>
    <asp:GridView ID="gvCheckedOut" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" />
            <asp:BoundField DataField="Author" HeaderText="Author" ReadOnly="True" />
            <asp:BoundField DataField="PickupDate" HeaderText="Pickup Date" ReadOnly="True" DataFormatString="{0:M/d/yyyy}" />
            <asp:BoundField DataField="ReturnDate" HeaderText="Due Date" ReadOnly="True" DataFormatString="{0:M/d/yyyy}" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="BookSearch.aspx">Search Books</a></li>
            <li><a href="BookBrowse.aspx">Browse Books</a></li>
        </ul>
    </div>
</asp:Content>
