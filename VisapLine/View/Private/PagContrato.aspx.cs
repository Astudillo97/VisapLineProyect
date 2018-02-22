using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
namespace VisapLine.View.Private
{
    public partial class PagContrato : System.Web.UI.Page
    {


        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            //string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            //if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            //{
                if (!IsPostBack)
                {


                }
            //}
            //else
            //{
            //    Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            //}

        }
    }
}