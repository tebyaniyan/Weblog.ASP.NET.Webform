using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform
{
    public partial class ContactUs : System.Web.UI.Page
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.divAlertSuccess.Visible = false;
            this.divAlertNotFount.Visible = false;
            string pageTitle = System.Configuration.ConfigurationManager.AppSettings["SiteName"];
            this.Page.Title = "ارتباط با ما" + "-" + pageTitle;

        }

        protected void bntSendContactUS_Click(object sender, EventArgs e)
        {
            this.db.ContactUS.Add(new Models.ContactU()
            {
                Fullname = this.txtFullName.Text,
                Email = this.txtEmail.Text,
                Description = this.txtNote.Text,
                Date = DateTime.Now,
                IsRead = false,
            });
            this.db.SaveChanges();
            this.divAlertSuccess.Visible = true;
            this.txtEmail.Text = "";
            this.txtFullName.Text = "";
            this.txtNote.Text = "";

        }
    }
}