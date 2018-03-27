using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class Reporte : System.Web.UI.Page
    {
        reporte report = new reporte();
        Barrios bar = new Barrios();
        Plan pn = new Plan();
        DataTable data = new DataTable();
        static string casos;
        static string fecha1;
        static string fecha2;
        static string estad;
        static string sald;
        static string barr;
        static string pla;
        static string tip;
        static string metenvio;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BUSCAR_ServerClick(object sender, EventArgs e)
        {
            try
            {
                casos = Validar.ConvertVarchar(caso.SelectedValue);
                fecha1 = Validar.ConvertDate(fechainicio.Text);
                fecha2 = Validar.ConvertDate(fechafin.Text);
                estad = Validar.ConvertVarchar(estado.SelectedValue);
                sald = Validar.ConvertNumber(saldo.Text);
                barr = Validar.ConvertNumber(barrio.SelectedValue);
                pla = Validar.ConvertNumber(plan.SelectedValue);
                tip = Validar.ConvertVarchar(tipo.SelectedValue);
                metenvio = Validar.ConvertVarchar(methenvio.SelectedValue);
                data = report.ConsultaAvanzada(casos, fecha1, fecha2, estad, sald, barr, pla, tip, metenvio);
                repetidors.DataSource = data;
                repetidors.DataBind();
                Alerta.Visible = false;
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
            
        }

        protected void caso_SelectedIndexChanged(object sender, EventArgs e)
        {
            estado.Items.Clear();
            estado.Items.Add(new ListItem("Seleccione", "Seleccione"));

            if (caso.SelectedValue.Equals("ESTADOTER"))
            {
                estado.DataSource = report.ConsultarEstadosTercero();
                estado.DataValueField = "estado";
                estado.DataTextField = "estado";
                estado.DataBind();
            }
            else if(caso.SelectedValue.Equals("ESTADOCONT"))
            {
                estado.DataSource = report.ConsultarEstadosContrato();
                estado.DataValueField = "estadoc";
                estado.DataTextField = "estadoc";
                estado.DataBind();
            }
            else if (caso.SelectedValue.Equals("ESTADOSER"))
            {
                estado.DataSource = report.ConsultarEstadosServicio();
                estado.DataValueField = "estado";
                estado.DataTextField = "estado";
                estado.DataBind();
            }
            else if (caso.SelectedValue.Equals("BARRIOS"))
            {
                bar.muninicio_idmunicipio = "1";
                barrio.DataSource = bar.ConsultarBarriosIdMunicipio(bar);
                barrio.DataValueField = "idbarrios";
                barrio.DataTextField = "barrios";
                barrio.DataBind();
            }
            else if (caso.SelectedValue.Equals("PLANES"))
            {
                cargarplanes();
            }
            else if (caso.SelectedValue.Equals("METHODO"))
            {
                cargarMethodo();
            }
            else if (caso.SelectedValue.Equals("TIPO"))
            {
                cargarTipo();
            }
        }
        protected void cargarplanes()
        {
            try
            {
                plan.Items.Clear();
                plan.Items.Add(new ListItem("Seleccione", "Seleccione"));
                plan.DataSource = pn.ConsultarPlanconca();
                plan.DataTextField = "vardetalle";

                plan.DataValueField = "varidplan";
                plan.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
            
        }

        protected void cargarMethodo()
        {
            try
            {
                methenvio.Items.Clear();
                methenvio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                methenvio.DataSource = report.ConsultarMethodoEnvio();
                methenvio.DataTextField = "enviofactura";

                methenvio.DataValueField = "enviofactura";
                methenvio.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }
        protected void cargarTipo()
        {
            try
            {
                tipo.Items.Clear();
                tipo.Items.Add(new ListItem("Seleccione", "Seleccione"));
                tipo.DataSource = report.ConsultarTipoServicio();
                tipo.DataTextField = "tipo";

                tipo.DataValueField = "tipo";
                tipo.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }
    }
}