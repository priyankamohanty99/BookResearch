using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookReSearch.Models
{
    public class BookTitleResult
    {
        public int BookTitleID { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public string CategoryName { get; set; }
        public int SubCategoryID { get; set; }
        public string SubCategoryName { get; set; }
        public string SubCatMeta { get; set; }
        public string ShelfLocation { get; set; }
        public int TotalCopies { get; set; }
        public int AvailCopies { get; set; }
        public DateTime ReturnDate { get; set; }
        public DateTime PickupDate { get; set; }
    }
}