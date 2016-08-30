using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookReSearch.Business;

public partial class SearchResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(! IsPostBack)
        {
            if (Session["BookSearchStr"] == null)
            {
                Session["BookSearchStr"] = "";
            }
            LoadSearchResults();
        }
    }

    private void LoadSearchResults()
    {
        BookReSearchEntities dbContext = new BookReSearchEntities();        
        var dt = dbContext.sp_SearchBooks(Session["BookSearchStr"].ToString()).ToList();

        if (dt.Count > 0)
        {
            grvBookSearchResults.DataSource = dt;
            grvBookSearchResults.DataBind();
            lblNotFound.Visible = false;
        }
        else
        {
            lblNotFound.Visible = true;
        }
        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("BookSearch.aspx");
    }
}