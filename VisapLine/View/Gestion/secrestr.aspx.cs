using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
using System.Web.Services;

namespace VisapLine.View.Gestion
{
    public partial class secrestr : System.Web.UI.Page
    {
        secrest cmdduser = new secrest();
        activeconection cmddactive = new activeconection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                grivsecre.DataSource = cmdduser.consultarsecrets("router main");
                grivsecre.DataBind();
            }
            
        }

        protected void grivsecre_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("desact"))
            {
                if (cmdduser.userdesctivar(e.CommandArgument.ToString(), "router main"))
                {
                    if (cmddactive.removeactive(e.CommandArgument.ToString(), "router main"))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "swal('bien!', 'Fallo en registar la operacion', 'success');", true);
                    }
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "swal('bien!', 'Fallo en registar la operacion', 'success');", true);
                }
                else {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "swal('ERROR!', 'Fallo en registar la operacion', 'error');", true);

                }
            }
        }
    }
}