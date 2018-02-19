using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VisaPlane.visapline.Private
{
    public partial class Error1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string data = Convert.ToString(Request.QueryString["error"]);
            if (data != null)
            {
                error_s.Text = data;
            }
            Session.Abandon();
        }
    }
}