using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Weblog.ASP.NET.Webform.Models;

namespace Weblog.ASP.NET.Webform.AdminPanel
{
    public partial class Group : System.Web.UI.Page
    {
        Models.BlogEntiry db = new BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Page.Title = "مدیریت دسته های خبری وبلاگ";
        }

        protected void dsShowListNewsGroup_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.BlogGroups
                        select new
                        {
                            u.NewsGroupID,
                            u.TitleGroup,
                        }).ToList();
        }

   

        protected void btnSaveGroup_OnClick(object sender, EventArgs e)
        {

            if (ViewState["ID"] == null)
            {
                Models.BlogGroup newsGroup = new BlogGroup()
                {
                    TitleGroup = txtNameGroup.Text,
                };
                db.BlogGroups.Add(newsGroup);
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());

            }
            else
            {
                int groupid = int.Parse(ViewState["ID"].ToString());
                var newsGroupid = db.BlogGroups.First(p => p.NewsGroupID == groupid);
                newsGroupid.TitleGroup = txtNameGroup.Text;
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
            }
        }

        protected void btnCancell_OnClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
        }

        protected void gvListGroup_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
           
                case "DoEdit":
                    {
                        int groupid = int.Parse(e.CommandArgument.ToString());
                        var group = db.BlogGroups.First(p => p.NewsGroupID == groupid);
                        txtNameGroup.Text = group.TitleGroup;
                        ViewState["ID"] = groupid;
                        mvShowListNewsGroup.SetActiveView(vwAddGroup);
                        break;
                    }
                case "DoDelete":
                    {
                        int groupid = int.Parse(e.CommandArgument.ToString());
                        var newsGroupid = db.BlogGroups.First(p => p.NewsGroupID == groupid);
                        db.BlogGroups.Remove(newsGroupid);
                        db.SaveChanges();
                        gvListGroup.DataBind();
                        Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
                        break;
                    }
            }
        }

        protected void btnAddGroup_Click(object sender, EventArgs e)
        {
            this.mvShowListNewsGroup.SetActiveView(vwAddGroup);
        }
    }
    }
