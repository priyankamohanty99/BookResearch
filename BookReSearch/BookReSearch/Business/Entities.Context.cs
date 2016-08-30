﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Linq;

public partial class BookReSearchEntities : DbContext
{
    public BookReSearchEntities()
        : base("name=BookReSearchEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public DbSet<Book> Books { get; set; }
    public DbSet<BookTitle> BookTitles { get; set; }
    public DbSet<Category> Categories { get; set; }
    public DbSet<SubCategory> SubCategories { get; set; }

    public virtual ObjectResult<sp_SearchBooks_Result> sp_SearchBooks(string searchStr)
    {
        var searchStrParameter = searchStr != null ?
            new ObjectParameter("SearchStr", searchStr) :
            new ObjectParameter("SearchStr", typeof(string));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_SearchBooks_Result>("sp_SearchBooks", searchStrParameter);
    }
}
