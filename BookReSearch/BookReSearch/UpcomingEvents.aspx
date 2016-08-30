<%@ Page Title="Book ReSearch - Upcoming Events" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" Inherits="UpcomingEvents" Codebehind="UpcomingEvents.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h3><i class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;&nbsp;Upcoming Events</h3>
    <asp:Xml ID="Xml1" runat="server" DocumentSource="~/Content/events.xml" TransformSource="~/Content/events.xslt"></asp:Xml>       
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="AboutUs.aspx">About Us</a></li>
            <li><a href="UserFeedback.aspx">User Feedback</a></li>
        </ul>
    </div>
</asp:Content>

