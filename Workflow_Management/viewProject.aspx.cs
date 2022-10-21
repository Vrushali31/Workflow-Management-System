using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Workflow_Management
{
    public partial class viewProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("LogIn.aspx");
            }
        }

        protected void btnView(object sender, EventArgs e)
        {
            var btn = sender as LinkButton;
            var pid = (btn.FindControl("pid") as HiddenField).Value;
            Response.Write(pid);
            Response.Redirect("ViewAllTeam.aspx?pid=" + pid);
        }
    }
}