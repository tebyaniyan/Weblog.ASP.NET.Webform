using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class Login : System.Web.UI.Page
    {
        private Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            string pageTitle = System.Configuration.ConfigurationManager.AppSettings["SiteName"];
            this.Page.Title = "ورود به پنل کاربری" + "-" + pageTitle;

            this.divError.Visible = false;
            if (this.User.Identity.IsAuthenticated)
                Response.Redirect("/User/LinkUser.aspx");
        }

        protected void cuValidator_OnServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (from u in db.Users
                            where u.Email == txtEmail.Text.Trim()
                            where u.Password == txtPassword.Text
                            where (bool)u.IsActive
                            select u).Any();

        }

        protected void btnLogin_OnClick(object sender, EventArgs e)
        {
           
                System.Threading.Thread.Sleep(1000);
                if (Page.IsValid)
                {
                    var user = (from u in db.Users
                                where u.Email == txtEmail.Text && u.Password == txtPassword.Text
                                where (bool)u.IsActive
                                select u).FirstOrDefault();
                    if (user != null)
                    {
                        FormsAuthentication.RedirectFromLoginPage(user.UserID.ToString(),true);
                    }
                    else
                    {
                        this.divError.Visible = true;
                    }

                }
            
         
           
        }
    }
}