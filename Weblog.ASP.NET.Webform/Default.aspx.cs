using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class Default : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageTitle = System.Configuration.ConfigurationManager.AppSettings["SiteName"];
            this.Page.Title = pageTitle + "-" + "وبلاگ";

        }

        protected void dsShowNews_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Blogs
                        where u.IsActive
                        orderby u.Date descending
                        select new
                        {
                            u.NewsID,
                            u.NewsTitle,
                            u.NewsSee,

                            u.IsActive,
                            u.Date,
                            Description = u.Description.Substring(0, 260),
                            u.NewsImage,
                            u.NewsGroupID,
                            u.BlogGroup.TitleGroup,
                            CountComment = (from c in db.BlogComments where c.NewsID == u.NewsID select u).Count(),
                        }).ToList();
        }

        protected void btnSarch_ServerClick(object sender, EventArgs e)
        {

        }

        protected void dsListLoadGroup_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from x in this.db.BlogGroups orderby x.NewsGroupID select x).ToList();
        }
    }
}