using BookReSearch.BookReSearchEvents;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BookReSearch.BookReSearchEvents.EventsService ws = new BookReSearch.BookReSearchEvents.EventsService();
        List<Event> events = ws.GetWeekEvents().ToList();
        ListView1.DataSource = events;
        ListView1.DataBind();

        if (Roles.IsUserInRole("Admin") && Request.Url.AbsoluteUri.ToLower().Contains("/admin/")) 
        {
            ListView1.Visible = false;
            Advertisement.Visible = false;
            UsefulLinksTitle.Visible = false;
        }
    }
}
