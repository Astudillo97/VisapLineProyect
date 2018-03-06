using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Net;
using System.Net.Sockets;
namespace VisapLine.View.Private
{
    public partial class Pagingresos : System.Web.UI.Page
    {

        Terceros terc = new Terceros();
        Egreso eg = new Egreso();
        Motivo mo = new Motivo();
        Empresa emp = new Empresa();
        TipoTercero tt = new TipoTercero();
        Proveedor prov = new Proveedor();
        TipoDoc tpdoc = new TipoDoc();
        Telefono tlf = new Telefono();
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                        DropDownList2.DataSource = mo.Consultarmotivo();
                        DropDownList2.DataTextField = "motivo";
                        DropDownList2.DataValueField = "idmotivo";
                        DropDownList2.DataBind();

                        DropDownList1.DataSource = tt.Consultartipotercerofiltradoegreso();
                        DropDownList1.DataTextField = "tipoterceros";
                        DropDownList1.DataValueField = "idtipotercero";
                        DropDownList1.DataBind();

                        DropDownListtipodocu.DataSource = tpdoc.ConsultarTipoDoc();
                        DropDownListtipodocu.DataTextField = "tipodoc";
                        DropDownListtipodocu.DataValueField = "idtipodoc";
                        DropDownListtipodocu.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void Buttonguarimpri_Click(object sender, EventArgs e)
        {

        }

        protected void Buttonguarimpri_Click1(object sender, EventArgs e)
        {

        }

        protected void Buttonguar2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}