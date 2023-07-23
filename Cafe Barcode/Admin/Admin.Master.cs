using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cafe_Barcode.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
            if (Session["breadCrum"] == null)
            {
                Response.Redirect("~/WebForm4.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            // End the current session
            Session.Abandon();
            Response.Redirect("~/WebForm4.aspx");
        }
    }
}