using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace Weblog.ASP.NET.Webform
{
    public partial class About : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageTitle = System.Configuration.ConfigurationManager.AppSettings["SiteName"];
            this.Page.Title = "درباره ما" + "-" + pageTitle;

        }

     
    }
}