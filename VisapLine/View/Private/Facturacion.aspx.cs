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
    public partial class Facturacion : System.Web.UI.Page
    {
        Contrato contrato = new Contrato();
        Terceros terc = new Terceros();
        Factura fact = new Factura();
        class_pdf pdf = new class_pdf();
        Detalle det = new Detalle();
        Empresa empresa = new Empresa();
        CargoAdicional ca = new CargoAdicional();
        DataTable tablepersona = new DataTable();
        DataTable tablecontrato = new DataTable();
        DataTable tablefactura = new DataTable();
        DataTable tabledetalle = new DataTable();
        static string terceroselected;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                tablefactura= fact.ConsultarFacturas("null::date", "null::date", "null::character varying", "null::integer", "10");
                allfactura.DataSource = tablefactura;
                allfactura.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void ConsultarbyCedula(object sender, EventArgs e)
        {
            try
            {
                terc.identificacion = identificacion_.Value;
                DataRow tercerose = Validar.Consulta(terc.ConsultarPersonaIdentifall(terc)).Rows[0];
                contrato.terceros_idterceros = tercerose["idterceros"].ToString();
                terceroselected= tercerose["idterceros"].ToString();
                //Consulta de Contratos por id de tercero
                listContrato.DataSource = contrato.ConsultarContratoidtercero(contrato);
                listContrato.DataBind();
                Alerta.Visible = false;
            }
            catch (Exception)
            {
                Limpiar(listContrato);
                Limpiar(listFacturas);
            }

        }
        public void Limpiar(GridView list)
        {
            list.Dispose();
            list.DataSource = null;
        }

        protected void allfactura_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                DataRow dat = tablefactura.Rows[e.RowIndex];
                string referen = pdf.CrearFactura(empresa.ConsultarEmpresa(), dat);
                Response.Redirect("../../Archivos/" + referen);
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