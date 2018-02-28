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
    public partial class FactRevision : System.Web.UI.Page
    {
        Factura fact = new Factura();
        static DataTable data;
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx

            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                try
                {
                    data = fact.ConsultarFacturasRevision();
                    listfactRevision.DataSource = data;
                    listfactRevision.DataBind();
                }
                catch (Exception ex)
                {
                    textError.InnerHtml = ex.Message;
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }
        }

        protected void listfactRevision_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("EditarFactura.aspx?key=" + data.Rows[e.NewSelectedIndex]["idfactura"].ToString());
        }
    }
}