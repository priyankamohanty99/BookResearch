using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AboutUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  

    protected override void InitializeCulture()
    {
        if (Request.Form["ctl00$MainContent$DrpLanguages"] != null)
        {
            UICulture = Request.Form["ctl00$MainContent$DrpLanguages"];
            Culture = Request.Form["ctl00$MainContent$DrpLanguages"];
            base.InitializeCulture();
        }
    }
}