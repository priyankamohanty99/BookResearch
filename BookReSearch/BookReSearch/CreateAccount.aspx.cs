using BookReSearch.Business;
using BookReSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReSearch
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DropDownList ddl = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlFavoriteTopic");

                BookReSearchEntities dbContext = new BookReSearchEntities();
                var subCategories = dbContext.SubCategories.Select(x => new { SubCategoryID = x.SubCategoryID, SubCategoryName = x.SubCategoryName }).ToList();

                subCategories.Insert(0, new { SubCategoryID = -1, SubCategoryName = "-- Select a topic --" });
                ddl.DataSource = subCategories;
                ddl.DataValueField = "SubCategoryID";
                ddl.DataTextField = "SubCategoryName";
                ddl.DataBind();
            }
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "Patron");

            var user = new UserProfile();
            user.Initialize(CreateUserWizard1.UserName.ToString(), true);

            DropDownList ddl = (DropDownList)CreateUserWizardStep1.ContentTemplateContainer.FindControl("ddlFavoriteTopic");
            TextBox firstName = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("FirstName");
            TextBox lastName = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("LastName");
            TextBox phone = (TextBox)CreateUserWizardStep1.ContentTemplateContainer.FindControl("Phone");

            user.FavoriteTopic = ddl.SelectedValue;
            user.FirstName = firstName.Text;
            user.LastName = lastName.Text;
            user.Phone = phone.Text;
            user.Save();
        }
    }
}