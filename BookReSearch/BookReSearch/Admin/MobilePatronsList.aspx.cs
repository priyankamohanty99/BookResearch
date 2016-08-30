using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReSearch.Admin
{
    public partial class MobilePatronsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new PatronsService.PatronsClient();
            var patrons = client.ListPatrons();

            GridView1.DataSource = patrons;
            GridView1.DataBind();
        }
    }
}