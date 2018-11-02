using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Weblog.ASP.NET.Webform.Master
{
    public partial class NestedMasterPageSaidbarBlog : System.Web.UI.MasterPage
    {
        Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSarch_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("/Serach.aspx?q=" + this.txtSarch.Text);
        }

        protected void dsListLoadGroup_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.BlogGroups
                        select new
                        {
                            u.NewsGroupID,
                            u.TitleGroup,
                        }).ToList();
        }
    }
}