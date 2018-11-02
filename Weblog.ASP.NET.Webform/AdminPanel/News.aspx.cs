using InsertShowImage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform.AdminPanel
{
    public partial class News : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
       
        }

        protected void dsShowNews_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Blogs
                        select new
                            {
                                u.NewsID,
                                u.NewsTitle,
                                u.NewsImage,
                                u.BlogGroup.TitleGroup,
                                u.BlogGroup.NewsGroupID,
                                u.Date,
                                u.IsActive,
                            }).ToList();
        }

        protected void gvListNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                
                case "DoEdit":
                    {
                        int newsID = int.Parse(e.CommandArgument.ToString());
                        var news = db.Blogs.First(p => p.NewsID == newsID);
                        txtTitle.Text = news.NewsTitle;
                        ddlShowGroup.SelectedValue = news.NewsGroupID.ToString();
                        ckDexription.Text = news.Description;
                        imgShowimgeNews.ImageUrl = "/Image/Blog/Images/Thumb/" + news.NewsImage;
                        ViewState["newsID"] = newsID;
                        mvShowNews.SetActiveView(vwAddNews);
                        break;
                    }
                case "DoDelete":
                    {
                        int ID = int.Parse(e.CommandArgument.ToString());
                        var news = db.Blogs.First(p => p.NewsID == ID);
                   
                        if(news.NewsImage!= "NoImage.png")
                        {
                            System.IO.File.Delete("/Image/Blog/Images/Thumb/" + news.NewsImage);
                            System.IO.File.Delete("/Image/Blog/Images/Image/" + news.NewsImage);
                        }
                        db.Blogs.Remove(news);
                        db.SaveChanges();
                        gvListNews.DataBind();
                        Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
                        break;
                    }
                case "DoActive":
                    {
                        int newsID = int.Parse(e.CommandArgument.ToString());
                        var news = db.Blogs.First(c => c.NewsID == newsID);
                        news.IsActive = !news.IsActive;
                        db.SaveChanges();
                        gvListNews.DataBind();
                        break;
                    }
            }
        }

        protected void btnAddNews_Click(object sender, EventArgs e)
        {
            
            if (ViewState["newsID"] == null)
            {
                string imageName = "NoImage.png";
                if (fuNewsImage.HasFile)
                {
                    imageName = Guid.NewGuid().ToString().Replace("-", "").Replace("#", "") + ".jpg";
                    fuNewsImage.SaveAs(Server.MapPath("/Image/Blog/Images/Image/" + imageName));
                    var img = new ImageResizer();
                    img.MaxY = 280;
                    img.MaxX = 280;
                    img.Resize(Server.MapPath("/Image/Blog/Images/Image/" + imageName),
                        Server.MapPath("/Image/Blog/Images/Thumb/" + imageName));
                }
                Models.Blog tblNews = new Models.Blog()
                {
                    NewsTitle = txtTitle.Text,
                    Description =  ckDexription.Text ,
                    NewsGroupID = int.Parse(ddlShowGroup.SelectedValue),
                    NewsImage = imageName,
                    Date = DateTime.Now,
                    IsActive = true,
                };
                db.Blogs.Add(tblNews);
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath);
            }
            else
            {
                int newsID = int.Parse(ViewState["newsID"].ToString());
                var news = (from x in this.db.Blogs where x.NewsID == newsID select x).Single();
                news.NewsTitle = this.txtTitle.Text;
                news.NewsGroupID = int.Parse(this.ddlShowGroup.SelectedValue);
                news.Description = this.ckDexription.Text;
                string imagename = news.NewsImage;
                if (fuNewsImage.HasFile)
                {
                    if (imagename != "NoImage.png")
                    {
                        fuNewsImage.SaveAs(Server.MapPath("/Image/Blog/Images/Image/" + imagename));
                        var img = new ImageResizer();
                        img.MaxY = 280;
                        img.MaxX = 280;
                        img.Resize(Server.MapPath("/Image/Blog/Images/Image/" + imagename),
                            Server.MapPath("/Image/Blog/Images/Thumb/" + imagename));
                    }
                    else
                    {
                        imagename = fuNewsImage.FileName;
                        fuNewsImage.SaveAs(Server.MapPath("/Image/Blog/Images/Image/" + imagename));
                        var img = new ImageResizer();
                        img.MaxY = 280;
                        img.MaxX = 280;
                        img.Resize(Server.MapPath("/Image/Blog/Images/Image/" + imagename),
                            Server.MapPath("/Image/Blog/Images/Thumb/" + imagename));
                    }
                }
                news.NewsImage = imagename;
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());

            }
        
        }

        protected void btnNewsNew_Click(object sender, EventArgs e)
        {
            this.mvShowNews.SetActiveView(vwAddNews);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            this.Response.Redirect(Request.UrlReferrer.AbsolutePath);
        }

        protected void dsListGrpup_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from x in this.db.BlogGroups select x).ToList();
        }
    }
}