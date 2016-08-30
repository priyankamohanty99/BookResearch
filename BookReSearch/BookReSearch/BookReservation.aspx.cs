using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BookReSearch.Business;
using System.Web.Security;

public partial class BookReservation : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack && Session["BookReserve"] != null)
        {
            if (Session["BookReserve"] != null)
            {
                var bookIDsToReserve = ((List<string>)Session["BookReserve"]).Select(int.Parse).ToList();

                BookReSearchEntities dbContent = new BookReSearchEntities();
                var books = dbContent.BookTitles.Where(b => bookIDsToReserve.Contains(b.BookTitleID)).ToList();

                if (books.Count > 0)
                {
                    grvBookReservation.DataSource = books;
                    grvBookReservation.DataBind();
                }
                else
                {
                    ShowNoBooks();
                }
            }
            else
            {
                ShowNoBooks();
            }
        }
        else
        {
            if (Session["BookReserve"] == null) ShowNoBooks();
        }
    }    

    private void ShowNoBooks()
    {
        lblError.Text = "You have no books selected for reservation.";
        lblError.Visible = true;
        lblSelected.Visible = false;
        lblSelectDate.Visible = false;
        calPickupDate.Visible = false;
        grvBookReservation.Visible = false;
        Reserve.Visible = false;
    }

    protected void Reserve_Command(object sender, CommandEventArgs e)
    {
        if (calPickupDate.SelectedDate < DateTime.Today)
        {
            lblError.Text = "You must select a pickup date greater than or equal to today's date.";
            lblError.Visible = true;
        }
        else
        {
            var bookIDsToReserve = ((List<string>)Session["BookReserve"]).Select(int.Parse).ToList();
            ReservationSvc svc = new ReservationSvc();
            int numReserved = svc.ReserveBooks(bookIDsToReserve, User.Identity.Name, calPickupDate.SelectedDate);

            if (numReserved > 0)
            {
                lblMessage.Text = "Successfully reserved " + numReserved + " books.";
                lblMessage.Visible = true;
                lblError.Visible = false;
            }
            else
            {
                lblError.Text = "Error reserving books. Please try again later.";
                lblError.Visible = true;
            }

            Session["BookReserve"] = null;

            grvBookReservation.Visible = false;
            lblSelectDate.Visible = false;
            lblSelected.Visible = false;
            calPickupDate.Visible = false;
            Reserve.Visible = false;
            hlReturn.Visible = true;  
        }      
    }

    protected void Cancel_Command(object sender, CommandEventArgs e)
    {
        Session["BookReserve"] = null;
        Response.Redirect("Default.aspx");
    }
}