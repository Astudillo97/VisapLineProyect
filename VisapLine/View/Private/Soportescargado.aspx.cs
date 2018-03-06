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
    public partial class Soportescargado : System.Web.UI.Page
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
            DataTable dtig = sp.ConsultarSoportescargados();
            repeteidordeinventario.DataSource = dtig;
            repeteidordeinventario.DataBind();
        }
    }
}