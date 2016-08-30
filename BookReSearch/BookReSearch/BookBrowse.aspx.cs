using BookReSearch.Business;
using BookReSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class BookBrowse : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                UserProfile user = UserProfile.GetUserProfile();
                if (user.FavoriteTopic != "")
                {
                    BookReSearchEntities dbContent = new BookReSearchEntities();
                    int subCatId;

                    if (int.TryParse(user.FavoriteTopic, out subCatId))
                    {
                        Label1.Text = dbContent.SubCategories.Where(s => s.SubCategoryID == subCatId).Select(s => s.SubCategoryName).Single();
                    }
                    else
                    {
                        Label1.Text = "unable to be determined";
                    }
                }
                else
                {
                    Label1.Text = "not set";
                }
            }
            else
            {
                Label1.Text = "unknown, because you aren't logged in.";
            }               
        }
    }

    protected void Browse_Click(object sender, EventArgs e)
    {
        var selectedSubcats = new List<string>();

        foreach (ListItem cat in cblBrowseCategory.Items)
        {
            if (cat.Selected) selectedSubcats.Add(cat.Value);
        }

        if (selectedSubcats.Count > 0)
        {
            Session["BookBrowseSubcats"] = selectedSubcats;
            Response.Redirect("BrowseResults.aspx");
        }
        else
        {
            lblError.Text = "You must select at least one topic.<br/>";
        }        

    }

    protected void Clear_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        foreach (ListItem cat in cblBrowseCategory.Items)
        {
            cat.Selected = false;
        }
    }

    protected void cblBrowseCategory_DataBound(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            UserProfile user = UserProfile.GetUserProfile();
            ListItem li = cblBrowseCategory.Items.FindByValue(user.FavoriteTopic);
            if (li != null) li.Selected = true;
        }
    }
 
}