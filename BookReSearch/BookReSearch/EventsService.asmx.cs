using BookReSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml.Linq;

namespace BookReSearch
{
    /// <summary>
    /// Summary description for EventsService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class EventsService : System.Web.Services.WebService
    {
        XElement root;

        public EventsService()
        {
            this.root = XElement.Load(HttpContext.Current.Server.MapPath("/Content/events.xml"));
        }

        [WebMethod]
        public List<Event> GetAllEvents()
        {
            IEnumerable<XElement> libraryEvents =
                from el in this.root.Elements("event")
                select el;

            return GetEventsAsList(libraryEvents);
        }

        [WebMethod]
        public List<Event> GetWeekEvents()
        {
            IEnumerable<XElement> libraryEvents =
                from el in this.root.Elements("event")
                where (Convert.ToDateTime((string)el.Element("date")) - DateTime.Now).TotalDays < 7
                && (Convert.ToDateTime((string)el.Element("date")) - DateTime.Now).TotalDays >= 0
                select el;

            return GetEventsAsList(libraryEvents);
        }

        private List<Event> GetEventsAsList(IEnumerable<XElement> libraryEvent)
        {
            var libraryEvents = new List<Event>();

            foreach (XElement el in libraryEvent)
                libraryEvents.Add(new Event
                {
                    Date = Convert.ToDateTime((string)el.Element("date")),
                    Location = (string)el.Element("location"),
                    Title = (string)el.Element("title")
                });

            return libraryEvents.OrderBy(x => x.Date).ToList();
        }
    }
}
