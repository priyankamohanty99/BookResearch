using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookReSearch.Business;
using BookReSearch.Models;

public partial class BrowseResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var books = new List<BookTitleResult>();

            var referrer = HttpContext.Current.Request.UrlReferrer;
            string refPage = (referrer == null) ? "" : referrer.AbsolutePath.TrimStart('/');

            if (Session["BookBrowseSubcats"] != null && refPage == "BookBrowse.aspx")
            {
                var fetchedSubcats = (List<string>)Session["BookBrowseSubcats"];

                ReservationSvc svc = new ReservationSvc();
                var bookTitles = svc.GetBookTitleResults();
                books = bookTitles.Where(b => fetchedSubcats.Contains(b.SubCategoryID.ToString())).ToList();
                hlBack.NavigateUrl = "~/BookBrowse.aspx";
            }
            else {
                if (Session["BookSearchStr"] != null && refPage == "BookSearch.aspx")
                {
                    var searchQuery = Session["BookSearchStr"].ToString().ToLower();
                
                    ReservationSvc svc = new ReservationSvc();
                    var bookTitles = svc.GetBookTitleResults();
                    books = bookTitles.Where(b => 
                        b.Author.ToLower().Contains(searchQuery) ||
                        b.Title.ToLower().Contains(searchQuery) ||
                        b.SubCategoryName.ToLower().Contains(searchQuery) ||
                        b.SubCatMeta.ToLower().Contains(searchQuery)
                    ).ToList();

                    hlBack.NavigateUrl = "~/BookSearch.aspx";
                }
            }

            if (books.Count > 0)
            {
                grvBookBrowseResults.DataSource = books;
                grvBookBrowseResults.DataBind();
            }
            else
            {
                lblError.Text = "No matches found.<br/>";
                btnReserve.Visible = false;
            }
        }
    }

    protected void btnReserve_Click(object sender, EventArgs e)
    {
        var selectedBooks = new List<String>();

        foreach(GridViewRow bookRow in grvBookBrowseResults.Rows)
        {
            CheckBox chk = (CheckBox)bookRow.FindControl("selectBook");
            if (chk != null && chk.Checked)
            {
                var bookTitleId = grvBookBrowseResults.DataKeys[bookRow.RowIndex].Value.ToString();
                selectedBooks.Add(bookTitleId);
            }
        }

        if (selectedBooks.Count > 0)
        {
            Session["BookReserve"] = selectedBooks;
            Response.Redirect("BookReservation.aspx");
        }
        else
        {
            lblError.Text = "You must select at least one book.<br/>";
        }
    }
}