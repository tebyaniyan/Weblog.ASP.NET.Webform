using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Weblog.ASP.NET.Webform.AdminPanel.User
{
    public partial class User : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "مدیریت کاربران";
        }

        protected void dsShowListUser_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Users
                        orderby u.Date
                        select new
                        {
                            u.UserID,
                            u.Role.RoleTiitle,
                            u.Email,
                            u.FullName,
                            u.Date,
                            u.IsActive,
                        }).ToList();
        }

   

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (ViewState["userid"] == null)
            {
                db.Users.Add(new Models.User()
                {
                    FullName = txtFullName.Text,
                    Email = txtEmail.Text,
                    Password = txtPassword.Text,
                    Date = DateTime.Now,
                    RoleID = int.Parse(ddlListRole.SelectedValue),
                    IsActive = true,

                });
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());
            }
            else
            {
                int userid = int.Parse(ViewState["userid"].ToString());
                var user = (from u in db.Users where u.UserID == userid select u).First();
                user.Email = txtEmail.Text;
                user.FullName = txtFullName.Text;
                user.Password = txtPassword.Text;
                user.RoleID = int.Parse(ddlListRole.SelectedValue.ToString());
                db.SaveChanges();
                Response.Redirect(Request.UrlReferrer.AbsolutePath.ToString());

            }
        }


        

        protected void gvListUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
             
                case "DoEdit":
                    {
                        int userid = int.Parse(e.CommandArgument.ToString());
                        var user = (from u in db.Users where u.UserID == userid select u).First();
                        txtEmail.Text = user.Email;
                        txtFullName.Text = user.FullName;
                        txtPassword.Text = user.Password;
                        ddlListRole.SelectedValue = user.RoleID.ToString();
                        ViewState["userid"] = userid;
                        mvShowListUser.SetActiveView(vwAddUser);
                        break;
                    }
                case "DoDelet":
                    {
                        int userid = int.Parse(e.CommandArgument.ToString());
                        var user = (from u in db.Users where u.UserID == userid select u).First();
                        db.Users.Remove(user);
                        db.SaveChanges();
                        gvListUser.DataBind();
                        break;
                    }


                case "DoActive":
                    {
                        System.Threading.Thread.Sleep(100);
                        int userid = int.Parse(e.CommandArgument.ToString());
                        var user = db.Users.First(p => p.UserID == userid);
                        user.IsActive = !user.IsActive;
                        db.SaveChanges();
                        gvListUser.DataBind();
                        break;
                    }
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            this.mvShowListUser.SetActiveView(vwAddUser);
        }

        protected void edShowListRole_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from x in this.db.Roles select x).ToList();
        }
    }
}