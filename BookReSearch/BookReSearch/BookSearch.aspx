<%@ Page Title="Book ReSearch - Search Books" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="BookSearch" Codebehind="BookSearch.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3><i class="fa fa-search" aria-hidden="true"></i>&nbsp;&nbsp;Book Search</h3>
    <table style="width:100%;margin-top:15px">
        <tr>
            <td style="width:220px; vertical-align:top">
                <span>Enter Title, Author, or Topic</span>
            </td>
            <td>
                <asp:TextBox ID="txtSearch" runat="server" Width="100%" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a search term" ControlToValidate="txtSearch" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="BookBrowse.aspx">Browse Books</a></li>
        </ul>
    </div>
</asp:Content>

