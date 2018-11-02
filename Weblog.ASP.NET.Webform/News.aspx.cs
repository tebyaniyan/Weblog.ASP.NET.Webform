using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class News : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            int newsID = int.Parse(this.Page.RouteData.Values["NewsID"].ToString());
            var news = (from x in this.db.Blogs where x.NewsID == newsID && x.IsActive select x).Single();
            this.Page.Title = news.NewsTitle;
        }

        protected void dsShowNews_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int newsID = int.Parse(this.Page.RouteData.Values["NewsID"].ToString());
            e.Result = (from x in this.db.Blogs
                        where x.NewsID == newsID
                        select new
                        {
                            x.NewsID,
                            x.NewsTitle,
                            x.NewsImage,
                            x.Description,
                            x.Date,
                            x.BlogGroup.TitleGroup,
                            x.NewsGroupID,
                        }).ToList();

        }

        protected void dsList_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int newsID = int.Parse(this.Page.RouteData.Values["NewsID"].ToString());
            e.Result = (from x in this.db.BlogComments
                        where x.NewsID == newsID
                        where x.IsActive
                        select new
                        {
                            x.NewsComment,
                            x.NewsID,
                            x.NewsCommentText,
                            x.Email,
                            x.Date,
                            x.IsActive,
                            x.FullName,
                        }).ToList();
        }

    
        protected void btnSubmitCommnet_ServerClick(object sender, EventArgs e)
        {
            int newsID = int.Parse(this.Page.RouteData.Values["NewsID"].ToString());
            db.BlogComments.Add(new Models.BlogComment
            {
                FullName = this.txtName.Text,
                Email = this.txtEmail.Text,
                IsActive = false,
                Date = DateTime.Now,
                NewsCommentText=this.txtComment.Text,
                NewsID=newsID,
            });
            db.SaveChanges();
            
        }
    }
}