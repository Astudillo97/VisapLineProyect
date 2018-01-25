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
        DataTable tabledactura = new DataTable();
        DataTable tabledetalle = new DataTable();
        static string terceroselected;
        static string contratoselected;
        static string facturaselected;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

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
            catch (Exception ex)
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



        protected void listContrato_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "ver")
                {
                    string dat = e.CommandArgument.ToString();
                    contratoselected = dat;
                    fact.contrato_idcontrato = dat;
                    listFacturas.DataSource = Validar.Consulta(fact.ConsultarFacturaIdContrato(fact));
                    listFacturas.DataBind();

                }
            }
            catch (Exception)
            {
                Limpiar(listFacturas);
            }
        }

        protected void listFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "ver")
                {
                    string dat = e.CommandArgument.ToString();
                    facturaselected = dat;
                    det.factura_idfactura = dat;
                    listDetalle.DataSource = Validar.Consulta(det.ConsultarDetalleIdFactura(det));
                    listDetalle.DataBind();
                }
            }
            catch (Exception)
            {
                
            }
        }

        protected void CrearFactura_(object sender, EventArgs e)
        {
            try
            {
                DataTable datEmpresa = empresa.ConsultarEmpresa();
                terc.identificacion = identificacion_.Value;
                DataRow tercerose= Validar.Consulta(terc.ConsultarPersonaIdentifall(terc)).Rows[0];
                contrato.idcontrato = contratoselected;
                DataRow contrat = contrato.ConsultarContratoidcontrato(contrato).Rows[0];
                fact.contrato_idcontrato = facturaselected;
                DataRow datfactura= Validar.Consulta(fact.ConsultarFacturaIdContrato(fact)).Rows[0];
                ca.contrato_idcontrato_cargo = contrat["idcontrato"].ToString();
                DataTable datdetalle = ca.ConsultarCargosIdContrato(ca);

                pdf.CrearFactura(datEmpresa,tercerose,contrat,datfactura,datdetalle);
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