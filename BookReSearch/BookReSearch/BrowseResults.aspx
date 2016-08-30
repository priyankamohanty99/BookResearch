<%@ Page Title="Book ReSearch - Results" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="BrowseResults" Codebehind="BrowseResults.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3>Results</h3>
    <table style="width:100%;margin-top:15px">
        <tr>
            <td style="width:220px" colspan="2">
                <asp:GridView ID="grvBookBrowseResults" runat="server" AllowPaging="true" DataKeyNames="BookTitleID" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="selectBook" runat="server" Visible='<%# (int)Eval("AvailCopies")>0 %>' />
                                <asp:Label ID="lblDash" runat="server" Text="-" Visible='<%# (int)Eval("AvailCopies")<=0 %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Title" HeaderText="Title" ReadOnly="True" />
                        <asp:BoundField DataField="Author" HeaderText="Author" ReadOnly="True" />
                        <asp:BoundField DataField="CategoryName" HeaderText="Type" ReadOnly="True" />
                        <asp:BoundField DataField="SubCategoryName" HeaderText="Topic" ReadOnly="True" />
                        <asp:BoundField DataField="ShelfLocation" HeaderText="Shelf Location" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Available">
                            <ItemTemplate>
                               <asp:Label ID="lblCopies" runat="server" Text='<%#string.Format("{0} of {1}",Eval("AvailCopies"),Eval("TotalCopies")) %>'
                                   ForeColor='<%# (int)Eval("AvailCopies") > 0 ? System.Drawing.Color.FromName("Black"): System.Drawing.ColorTranslator.FromHtml("#CC0000") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Text="" ForeColor="#CC0000"></asp:Label>
                <asp:Button ID="btnReserve" runat="server" Text="Reserve Selected" OnClick="btnReserve_Click" />
                <asp:HyperLink ID="hlBack" runat="server" NavigateUrl="~/BookSearch.aspx">Back</asp:HyperLink>
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
