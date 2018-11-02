using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class Group : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            int groupid = Convert.ToInt32(Page.RouteData.Values["NewsGroupID"]);
            var group = (from u in db.Blogs where u.NewsGroupID == groupid select u).First();
            if (group != null)
            {
                var pagetile = group.BlogGroup.TitleGroup;
                Page.Title = " " + pagetile;

            }
        }

        protected void dsShowListGroup_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int groupid = Convert.ToInt32(Page.RouteData.Values["NewsGroupID"]);
            e.Result = (from u in db.Blogs
                        where u.NewsGroupID == groupid
                        select new
                        {
                            u.NewsID,
                            u.NewsTitle,
                            u.NewsSee,
                            u.IsActive,
                            u.Date,
                            Description= u.Description.Substring(0,260),
                            u.NewsImage,
                            u.NewsGroupID,
                            u.BlogGroup.TitleGroup,
                            CountComment = (from c in db.BlogComments where c.NewsID == u.NewsID select u).Count(),
                        }).ToList();
        }
    }
}