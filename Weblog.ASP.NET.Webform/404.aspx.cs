using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class _404 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageTitle = System.Configuration.ConfigurationManager.AppSettings["SiteName"];
            this.Page.Title = pageTitle + "-" + "صفحه مورد نظر یافت نشد";
        }
    }
}