using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VisapLine.View.Private
{
    public partial class GestCaja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string valor = Convert.ToString(Request.QueryString["key"]);
                if (valor == null)
                {
                    Response.Redirect("pagcaja.aspx");
                }
                else
                {

                }

            }
        }
    }
}