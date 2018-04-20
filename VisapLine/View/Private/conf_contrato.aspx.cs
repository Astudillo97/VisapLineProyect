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
        CargoAdicional car = new CargoAdicional();
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
            try
            {
                Validar.validarlleno(contrato_.Value);
                Validar.validarlleno(fechaactivacionfac.Value);
                Validar.validarlleno(caso.SelectedValue);
                if (contrato.ActaulizarFechaActivacion(contrato_.Value, fechaactivacionfac.Value, caso.SelectedValue))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "hwa", "ErrorPunto('ACTUALIZACION EXITOSA!','Prorateo Actualizado correctamente','success');", true);

                    contrato.terceros_idterceros = Request.QueryString["key"];
                    consultacontrato.DataSource = Validar.Consulta(contrato.ConsultarContratoIdTercero(contrato));
                    consultacontrato.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "hwa", "ErrorPunto('ACTUALIZACION FALLIDA','Comuniquese con el soporte tecnico!','error');", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "hwa", "ErrorPunto('ACTUALIZACION FALLIDA','Verifique que los espacios se encuentren correctamente diligenciados!','error');", true);
            }

        }
        protected void consultacontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            contrato_.Value = consultacontrato.SelectedRow.Cells[0].Text;
            caso.SelectedValue = "1";
            numero.Value = consultacontrato.SelectedRow.Cells[0].Text;
            fechaactivacionfac.Value = Convert.ToDateTime(consultacontrato.SelectedRow.Cells[2].Text).ToString("yyyy-MM-dd");
        }

        protected void GuardarCargo(object sender, EventArgs e)
        {
            try
            {
                Terceros ter = (Terceros)Session["tercero"];
                car.descripcion = Validar.validarlleno(descripcion.Value);
                car.valor = Validar.validarlleno(valor.Value);
                car.contrato_idcontrato_cargo = Validar.validarlleno(numero.Value);
                car.terceros_idterceroregistra = ter.idterceros;
                if (car.RegistrarCargoContrato(car))
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "hwa", "ErrorPunto('REGISTRO EXITOSO!','Cargo registrado correctamente','success');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "hwa", "ErrorPunto('REGISTRO FALLIDO','No se pudo registrar el cargo adicional!','error');", true);
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "hwa", "ErrorPunto('REGISTRO FALLIDO','Verifique que los espacios se encuentren correctamente diligenciados!','error');", true);
            }
            
        }
    }
}