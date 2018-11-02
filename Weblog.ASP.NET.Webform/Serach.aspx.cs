using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class Serach : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            string search = Request.QueryString["q"];
            var messgae = " جستجو شده برای : " + " " + search;
            this.Page.Title = messgae;
            this.lblalert.Text = messgae;
        }

        protected void dsShowNews_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            string search = Request.QueryString["q"];
            e. Result = (from x in this.db.Blogs
                          where x.Description.Contains(search) || x.NewsTitle.Contains(search)
                          select new
                          {
                              x.NewsID,
                              x.NewsTitle,
                              x.NewsSee,
                              x.IsActive,
                              x.Date,
                              Description = x.Description.Substring(0, 260),
                              x.NewsImage,
                              x.NewsGroupID,
                              x.BlogGroup.TitleGroup,
                              CountComment = (from c in db.BlogComments where c.NewsID == x.NewsID select c).Count(),

                          }

            ).ToList();

        }
    }
}