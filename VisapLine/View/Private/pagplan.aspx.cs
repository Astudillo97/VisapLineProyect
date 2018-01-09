using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class pagplan : System.Web.UI.Page
    {

        Plan pn = new Plan();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable dt = pn.ConsultarPlan();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }

    }
}