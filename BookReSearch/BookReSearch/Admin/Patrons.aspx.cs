using BookReSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookReSearch.Admin
{
    public partial class Patrons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindToPatronList();
            }            
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {            
            var username = gvPatrons.DataKeys[e.RowIndex].Value.ToString();
            Membership.DeleteUser(username);
            BindToPatronList();
        }

        protected void BindToPatronList()
        {
            var patronUsers = Roles.GetUsersInRole("Patron").ToList();
            var patrons = UserProfile.GetAllProfiles().Where(p => patronUsers.Contains(p.UserName));
            gvPatrons.DataSource = patrons;
            gvPatrons.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvPatrons.EditIndex = e.NewEditIndex;
            BindToPatronList();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvPatrons.EditIndex = -1;
            BindToPatronList();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var username = gvPatrons.DataKeys[e.RowIndex].Value.ToString();
            UserProfile user = UserProfile.GetUserProfile(username);
            user.FirstName = (gvPatrons.Rows[e.RowIndex].FindControl("FirstName") as TextBox).Text;
            user.LastName = (gvPatrons.Rows[e.RowIndex].FindControl("LastName") as TextBox).Text;
            user.Phone = (gvPatrons.Rows[e.RowIndex].FindControl("Phone") as TextBox).Text;
            user.Save();

            gvPatrons.EditIndex = -1;
            BindToPatronList();
        }
    }
}