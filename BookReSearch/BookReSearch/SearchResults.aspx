<%@ Page Title="Book ReSearch - Results" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="SearchResults" Codebehind="SearchResults.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table style="width:100%;margin-top:15px">
        <tr>
            <td style="width:220px" colspan="2">
                <asp:GridView ID="grvBookSearchResults" runat="server" AutoGenerateColumns="False"
                     >
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" 
                            SortExpression="Title"></asp:BoundField>
                        <asp:BoundField DataField="Author" HeaderText="Author" ReadOnly="True" 
                            SortExpression="Author" ItemStyle-Width="200px"></asp:BoundField>
                        <asp:BoundField DataField="Category" HeaderText="Type" ReadOnly="True" 
                            SortExpression="Category" ItemStyle-Width="100px"></asp:BoundField>
                        <asp:BoundField DataField="SubCategory" HeaderText="Topic" ReadOnly="True" 
                            SortExpression="SubCategory" ItemStyle-Width="100px"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:Label ID="lblNotFound" runat="server" Text="No books found" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td style="padding-top:15px">
                <asp:Button ID="btnBack" runat="server" Text="Back to Search" OnClick="btnBack_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="BookSearch.aspx">Search Books</a></li>
            <li><a href="BookBrowse.aspx">Browse Books</a></li>
        </ul>
    </div>
</asp:Content>

