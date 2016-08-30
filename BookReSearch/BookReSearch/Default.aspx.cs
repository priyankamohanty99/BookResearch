using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookReSearch.BookReSearchEvents;

namespace BookReSearch
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SiteMapPath smp = (SiteMapPath)Master.FindControl("SiteMapPath1");
            smp.Visible = false;
            BookReSearch.BookReSearchEvents.EventsService ws = new BookReSearch.BookReSearchEvents.EventsService();
            List<Event> events = ws.GetWeekEvents().ToList();
            ListView1.DataSource = events;
            ListView1.DataBind();
        }
    }
}