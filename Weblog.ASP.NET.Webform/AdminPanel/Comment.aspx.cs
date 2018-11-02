using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Weblog.ASP.NET.Webform.Models;

namespace Weblog.ASP.NET.Webform.AdminPanel
{
    public partial class Comment : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "مدیریت نظرات ارسالی وبلاگ";
        }

        protected void dsShowListComment_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.BlogComments
                        select new
                        {
                            u.NewsID,
                            u.NewsComment,
                            u.Blog.NewsTitle,
                            u.Date,
                            u.FullName,
                            u.Email,
                            u.webSite,
                            u.NewsCommentText,
                            u.IsActive,
                        }).ToList();

        }



        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (ViewState["ID"] != null)
            {
                int idcomment = int.Parse(ViewState["ID"].ToString());
                var comment = db.BlogComments.First(p => p.NewsComment == idcomment);
                comment.FullName = txtFullName.Text;
                comment.Email = txtEmail.Text;
                comment.webSite = txtWebsite.Text;
                comment.NewsCommentText = txtcomment.Text;
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
            }

        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());

        }

        protected void gvListComment_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {

                case "DoEdit":
                    {
                        int idcomment = int.Parse(e.CommandArgument.ToString());
                        var comment = db.BlogComments.First(p => p.NewsComment == idcomment);
                        txtFullName.Text = comment.FullName;
                        txtEmail.Text = comment.Email;
                        txtWebsite.Text = comment.webSite;
                        txtcomment.Text = comment.NewsCommentText;
                        ViewState["ID"] = idcomment;
                        mvShowListcomment.SetActiveView(vwEditComent);
                        break;
                    }
                case "DoDelete":
                    {
                        int idcomment = int.Parse(e.CommandArgument.ToString());
                        var comment = db.BlogComments.First(p => p.NewsComment == idcomment);
                        db.BlogComments.Remove(comment);
                        db.SaveChanges();
                        gvListComment.DataBind();
                        Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
                        break;
                    }
                case "DoActive":
                    {
                        int idcomment = int.Parse(e.CommandArgument.ToString());
                        var comment = db.BlogComments.First(p => p.NewsComment == idcomment);
                        comment.IsActive = !comment.IsActive;
                        db.SaveChanges();
                        gvListComment.DataBind();
                        break;
                    }
            }
        }
    }
}
