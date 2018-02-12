using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.Model
{
    public partial class VistadeExporte : System.Web.UI.Page
    {
        excel drexcel = new excel();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) {
                repetidor.DataSource = drexcel.ExportToSiigo();
                repetidor.DataBind();
            }
        }
    }
}