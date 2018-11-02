using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Weblog.ASP.NET.Webform.AdminPanel.User
{
    public partial class Role : System.Web.UI.Page
    {
        private Models.BlogEntiry db = new Models.BlogEntiry();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "سطح های دسترسی";
        }

        protected void dsShowListRole_OnSelecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from u in db.Roles
                        orderby u.RoleID descending
                        select new
                        {
                            u.RoleID,
                            u.RoleName,
                            RoleTiitlee = u.RoleTiitle,
                        }).ToList();
        }
    }
}