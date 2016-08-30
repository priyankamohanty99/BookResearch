<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookReSearch.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3><b>Welcome!</b></h3>
    <p>The mission of Book ReSearch is to create an environment of efficient book borrowing with a <b>personalized, intuitive, and interactive experience</b>, as well as reduce the time spent by library staff on inventory and patron management.</p>

    <p>The Book ReSearch website can help you:</p>
    
        <ul>
            <li>
                <a href="BookSearch.aspx">Search Books by Title, Author, or Topic</a>
            </li>
            <li>
                <a href="BookBrowse.aspx">Browse Books By Topic</a>
            </li>
            <li>
                <a href="UpcomingEvents.aspx">Find Upcoming Events</a>
            </li>
            
        </ul>
    <hr />
    <h4><i class="fa fa-calendar-o" aria-hidden="true"></i>&nbsp;&nbsp;Events This Week</h4>     
    <asp:ListView ID="ListView1" runat="server">
        <LayoutTemplate>
            <div class="right-box">                      
                <div id="itemPlaceHolder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="small-event">                            
                <p class="event-title"><i class="fa fa-calendar" aria-hidden="true"></i> <%# Eval("Title") %></p>
                <p class="event-date"><%# Eval("Date", "{0:d}") %></p>
                </div>
        </ItemTemplate>
    </asp:ListView>            
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Helpers" runat="server">
    <div class="helper-links">
        <ul>
            <li><a href="BookBrowse.aspx">Browse Books</a></li>
            <li><a href="BookSearch.aspx">Search Books</a></li>
            <li><a href="AboutUs.aspx">About Us</a></li>
        </ul>
    </div>
</asp:Content>
