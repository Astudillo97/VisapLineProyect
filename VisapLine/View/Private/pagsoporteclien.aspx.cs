using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.IO;

namespace VisapLine.View.Private
{
    public partial class pagsoporteclien : System.Web.UI.Page
    {

        Permisos per = new Permisos();
        Soportes sp = new Soportes();
        string idcontrato;
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                if (!IsPostBack)
                {
                    string valor = Convert.ToString(Request.QueryString["key"]);
                    if (valor == "SI")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "guardo();", true);
                        valor = "";
                    }
                    cargartabla();
                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }
        }


        protected void cargartabla()
        {
            DataTable dtig = sp.ConsultarSoportes();
            repeteidordeinventario.DataSource = dtig;
            repeteidordeinventario.DataBind();
        }



    }
}