<%@ Page Title="Book ReSearch - About Us" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="AboutUs" Codebehind="AboutUs.aspx.cs" 
    Culture="auto" UICulture="auto"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;About Us</h3>
    <table style="width:100%">
        <tr>
            <td style="text-align:right" colspan="2">
               <i class="fa fa-globe" aria-hidden="true"></i>&nbsp;Select Language: 
                <asp:DropDownList ID="DrpLanguages" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="en-us">English</asp:ListItem>
                    <asp:ListItem Value="es-MX">Español</asp:ListItem>
                </asp:DropDownList>                       
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <img src="Images/AboutUs.jpg" alt="About US" style="width:100%;height:150px;"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <span>
                    <asp:Label ID="lblAboutUsContent" runat="server" meta:resourcekey="lblAboutUsContent" Text=""></asp:Label>
                </span>
            </td>
        </tr>
        <tr>
            <td style="padding-top:30px;width:50%">
                <span>
                    <asp:Label ID="Label1" runat="server" meta:resourcekey="lblAboutUsContact" Text=""></asp:Label>
                </span>
            </td>
            <td style="padding-top:30px">
                <asp:Label ID="Label2" runat="server" meta:resourcekey="lblAboutUsLocation" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="padding-top:30px">
                <asp:Label ID="Label3" runat="server" meta:resourcekey="lblAboutUsHours" Text=""></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="UpcomingEvents.aspx">Upcoming Events</a></li>
            <li><a href="UserFeedback.aspx">User Feedback</a></li>
        </ul>
    </div>
</asp:Content>

