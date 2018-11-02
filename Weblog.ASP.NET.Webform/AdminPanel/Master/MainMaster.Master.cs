using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Weblog.ASP.NET.Webform.Models;

namespace Weblog.ASP.NET.Webform.AdminPanel.Master
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        BlogEntiry db = new BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "پنل مدیریت وبلاگ";

        }

        protected void dsListContactUS_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from x in this.db.ContactUS orderby x.Date where !(bool)x.IsRead select x).ToList();
        }
    }
}