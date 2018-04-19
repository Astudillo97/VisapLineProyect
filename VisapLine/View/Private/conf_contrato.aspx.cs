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
    public partial class conf_contrato : System.Web.UI.Page
    {
        Permisos per = new Permisos();
        Terceros tercero = new Terceros();
        Contrato contrato = new Contrato();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
                if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
                {
                    if (!IsPostBack)
                    {
                        string valor = Request.QueryString["key"];
                        contrato.terceros_idterceros = valor;
                        consultacontrato.DataSource = Validar.Consulta(contrato.ConsultarContratoIdTercero(contrato));
                        consultacontrato.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Guardar(object sender, EventArgs e)
        {

        }
        protected void consultacontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            contrato_.Value = consultacontrato.SelectedRow.Cells[0].Text;
            fechaactivacionfac.Value = Convert.ToDateTime(consultacontrato.SelectedRow.Cells[2].Text).ToString("yyyy-MM-dd");
        }
    }
}