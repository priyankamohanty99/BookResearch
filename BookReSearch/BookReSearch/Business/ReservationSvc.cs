using BookReSearch.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookReSearch.Business
{
    public class ReservationSvc
    {
        private BookReSearchEntities dbContext;
        
        public ReservationSvc()
        {
            this.dbContext = new BookReSearchEntities();
        }

        public List<BookTitleResult> GetCheckedOutBooks(string username)
        {
            return this.dbContext.Books.Where(b => b.IsCheckedOut && b.CheckOutPatronID == username).Select(b => new BookTitleResult
            {
                BookTitleID = b.BookTitleID,
                Title = b.BookTitle.Title,
                Author = b.BookTitle.Author,
                ReturnDate = b.ReturnDate ?? DateTime.Now,
                PickupDate = b.PickUpDate ?? DateTime.Now
            }).ToList();
        }
        
        public List<BookTitleResult> GetBookTitleResults()
        {         
            return this.dbContext.BookTitles.Select(b => new BookTitleResult
            {
                BookTitleID = b.BookTitleID,
                Title = b.Title,
                Author = b.Author,
                CategoryName = b.SubCategory.Category.CategoryName,
                SubCategoryID = b.SubCategoryID,
                SubCategoryName = b.SubCategory.SubCategoryName,
                SubCatMeta = b.SubCategory.SubCategorySynonyms,
                ShelfLocation = b.ShelfLocation,
                TotalCopies = b.Books.Count(),
                AvailCopies = b.Books.Where(i => i.IsCheckedOut == false).Count()
            }).ToList();
        }

        public int ReserveBooks(List<int> bookIDsToReserve, string username, DateTime pickupDate)
        {
            bookIDsToReserve.ForEach(r =>
            {
                var reserveBook = dbContext.Books.Where(b => b.BookTitleID == r && b.IsCheckedOut == false).First();
                if (reserveBook != null)
                {
                    reserveBook.IsCheckedOut = true;
                    reserveBook.CheckOutPatronID = username;
                    reserveBook.PickUpDate = pickupDate;
                    reserveBook.ReturnDate = pickupDate.AddDays(14);
                }
            });

            return dbContext.SaveChanges();
        }
    }
}