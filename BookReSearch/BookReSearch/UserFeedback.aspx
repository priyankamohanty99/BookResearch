<%@ Page Title="Book ReSearch - User Feedback" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="UserFeedback" Codebehind="UserFeedback.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3><i class="fa fa-envelope-o" aria-hidden="true"></i>&nbsp;&nbsp;User Feedback</h3>
    <table>
        <tr>
            <td>
                <p style="font-weight:bold"><asp:Label ID="Label1" runat="server" Text="Label">We would love to hear from you!</asp:Label></p>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblFeedback" runat="server" Text="" Font-Bold="True" ForeColor="#009900"></asp:Label>
                <asp:Label ID="lblEmailCaption" runat="server" Text="Your email address:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email address is required" Text="*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessageCaption" runat="server" Text="Your feedback:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtMessage" TextMode="MultiLine" Width="600" MaxLength="400" Height="200" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ErrorMessage="Feedback is required" Text="*" ControlToValidate="txtMessage"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Submit" OnCommand="Submit_Command" CommandName="Submit" runat="server" Text="Submit" />
            </td>
        </tr>
        <tr>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#CC0000" />
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="AboutUs.aspx">About Us</a></li>
        </ul>
    </div>
</asp:Content>
