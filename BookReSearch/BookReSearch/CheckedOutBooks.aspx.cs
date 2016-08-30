using BookReSearch.Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReSearch
{
    public partial class CheckedOutBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ReservationSvc svc = new ReservationSvc();
                var books = svc.GetCheckedOutBooks(User.Identity.Name);

                gvCheckedOut.DataSource = books;
                gvCheckedOut.DataBind();

                lblCount.Text = "You have " + (books.Count > 0 ? books.Count.ToString() : "no") + " book(s) checked out.";
            }
        }
    }
}