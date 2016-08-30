<%@ Page Title="Book ReSearch - Book Reservation" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="BookReservation" Codebehind="BookReservation.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Book Reservation</h3>
    <table>
        <tr>
            <td>
                <h5 style="margin-bottom:0"><asp:Label ID="lblSelected" runat="server" Text="Label">Books You've Chosen</asp:Label></h5>
                <asp:GridView ID="grvBookReservation" runat="server" DataKeyNames="BookTitleID" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" />
                        <asp:BoundField DataField="Author" HeaderText="Author" ReadOnly="True" />
                        <asp:BoundField DataField="ShelfLocation" HeaderText="Shelf Location" ReadOnly="True" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                                
                <h5 style="margin-bottom:0; margin-top:0.5em"><asp:Label ID="lblSelectDate" runat="server" Text="Label">Your Pickup Date</asp:Label></h5>
                <asp:Calendar ID="calPickupDate" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Reserve" OnCommand="Reserve_Command" CommandName="Reserve" runat="server" Text="Reserve" />
            </td>
        </tr>        
    </table>
    <p><asp:Label ID="lblError" runat="server" Text="" ForeColor="#CC0000" Visible="False"></asp:Label></p>
    <p><asp:Label ID="lblMessage" runat="server" Text="" Visible="False" Font-Bold="True" ForeColor="#006600"></asp:Label></p>
    <p><asp:HyperLink ID="hlReturn" runat="server" NavigateUrl="~/CheckedOutBooks.aspx" Visible="False">View your checked out books</asp:HyperLink><br /></p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="CheckedOutBooks.aspx">Checked Out Books</a></li>
            <li><a href="BookSearch.aspx">Search Books</a></li>
            <li><a href="BookBrowse.aspx">Browse Books</a></li>
        </ul>
    </div>
</asp:Content>

