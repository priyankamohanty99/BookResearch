<%@ Page Title="Book ReSearch - Browse Books" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="BookBrowse" Codebehind="BookBrowse.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3><i class="fa fa-folder-o" aria-hidden="true"></i>&nbsp;&nbsp;Book Browse</h3>
    <table>       
        <tr>
            <td>
                <p><strong>Your favorite topic is <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </strong></p>
            </td>
        </tr>
         <tr>
            <td>
                <asp:Label ID="BrowseCategoryLabel" runat="server" AssociatedControlID="cblBrowseCategory">Select topics to browse:</asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:CheckBoxList ID="cblBrowseCategory" runat="server" DataSourceID="EntityDataSource1" DataTextField="SubCategoryName" DataValueField="SubCategoryID" OnDataBound="cblBrowseCategory_DataBound" CssClass="browse-cbl"></asp:CheckBoxList>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=BookReSearchEntities" DefaultContainerName="BookReSearchEntities" EnableFlattening="False" EntitySetName="SubCategories" Select="it.[SubCategoryName], it.[SubCategoryID]"></asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                <asp:Button ID="Browse" OnClick="Browse_Click" CommandName="Browse" runat="server" Text="Browse" />
                <asp:Button ID="Clear" OnClick="Clear_Click" CommandName="Clear" runat="server" Text="Clear" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="BookSearch.aspx">Search Books</a></li>
        </ul>
    </div>
</asp:Content>

