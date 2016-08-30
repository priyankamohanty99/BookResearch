<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobilePatronsList.aspx.cs" Inherits="BookReSearch.Admin.MobilePatronsList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Book ReSearch - Mobile Patrons List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="../Content/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../Content/css/normalize.css" rel="stylesheet" />
    <link href="../Content/css/skeleton.css" rel="stylesheet" />
    <link href="http://fonts.googleapis.com/css?family=Raleway:400,300,600" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="row">
            <div class="twelve columns">
                <h3>Book ReSearch Admin</h3>
                <h5>Mobile Patrons List</h5>
            </div>            
        </div>
        <div class="row">
            <div class="twelve columns">
                <asp:GridView ID="GridView1" runat="server"></asp:GridView>
            </div>            
        </div>
    </div>
    </form>
</body>
</html>
