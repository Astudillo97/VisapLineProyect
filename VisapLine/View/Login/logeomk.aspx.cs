using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Login
{
    public partial class logeomk : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Click(object sender, EventArgs e)
        {
            MK mikro = new MK(ip.Text);
            if (!mikro.Login(user.Text, pass.Text))
            {

            }
            else {
                Response.Redirect("login.aspx");
            }

        }
    }
}