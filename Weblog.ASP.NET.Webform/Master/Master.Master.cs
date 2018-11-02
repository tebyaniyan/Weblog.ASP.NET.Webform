using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform.Master
{
    public partial class Master : System.Web.UI.MasterPage
    {
        private Models.BlogEntiry db = new  Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbSigOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/");
        }
    }
}