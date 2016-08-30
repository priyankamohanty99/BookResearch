<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Advertisement.ascx.cs" Inherits="BookReSearch.Advertisement.Advertisement" %>
  <div>
<%--       <asp:ScriptManager ID="ScriptManager1" runat="server" />--%>
       <asp:Timer ID="timer1" Interval="2500" runat="server" />
       <asp:UpdatePanel ID="updatepanel1" runat="server">
           <Triggers>
               <asp:AsyncPostBackTrigger ControlID="timer1" EventName="Tick" />
           </Triggers>
           <ContentTemplate>
               <p style="margin:0;padding:0;font-size:8px;color:lightblue; text-align:left">ADVERTISEMENT</p>
               <asp:AdRotator ID="AdRotator1" Height="300" Width="211" AdvertisementFile="~/Advertisement/Advertisement.xml" KeywordFilter="small"
                   runat="server" />
           </ContentTemplate>
       </asp:UpdatePanel>
   </div>
