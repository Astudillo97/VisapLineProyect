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
        DataTable tablepersona = new DataTable();
        DataTable tablecontrato = new DataTable();
        DataTable tabledactura = new DataTable();
        DataTable tabledetalle = new DataTable();
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
                DataRow datos = Validar.Consulta(terc.ConsultarPersonaIdentifall(terc)).Rows[0];
                contrato.terceros_idterceros = datos["idterceros"].ToString();
                listContrato.DataSource = contrato.ConsultarContratoidtercero(contrato);
                listContrato.DataBind();
                Alerta.Visible = false;
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                Limpiar(listContrato);
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
                    fact.contrato_idcontrato = dat;
                    listFacturas.DataSource = Validar.Consulta(fact.ConsultarFacturaIdContrato(fact));
                    listFacturas.DataBind();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void listFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "ver")
                {
                    string dat = e.CommandArgument.ToString();
                    det.factura_idfactura = dat;
                    listDetalle.DataSource = Validar.Consulta(det.ConsultarDetalleIdFactura(det));
                    listDetalle.DataBind();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        public static string GenerarNombrePdf(string dat)
        {
            DateTime dateTime = DateTime.Now;
            return dateTime.Year +""+ dateTime.Month +""+ dateTime.Day +""+ dateTime.Hour +""+ dateTime.Minute + "-" + dat + ".pdf";
        }

        protected void CrearFactura_(object sender, EventArgs e)
        {
            try
            {
                DataTable datEmpresa = empresa.ConsultarEmpresa();
                datEmpresa.PrimaryKey = new DataColumn[] { datEmpresa.Columns["descripcion"] };

                
                //pdf.CrearFactura(datEmpresa,datpersona,datfactura,datdetalle);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        public void ConsultarTecercero(string cedula)
        {
            terc.identificacion = cedula;
            DataTable datpersona = terc.ConsultarTerceroDos(terc);
            foreach (DataRow item in datpersona.Rows)
            {
                switch (item["estado"].ToString())
                {
                    case "Activo":
                        switch (item["tipoterceros"].ToString())
                        {
                            case "NATURAL":

                                break;
                            case "CORPORATIVO":

                                break;
                            case "EMPRESARIAL":

                                break;
                            default:
                                break;
                        }
                        break;
                    case "Inactivo":
                        break;

                    default:
                        break;
                }
            }
        }
        public void ConsultarContrato(DataRow dat)
        {
            contrato.terceros_idterceros = dat["idterceros"].ToString();
            DataTable datcontrato = contrato.ConsultarContratoidtercero(contrato);
            foreach (DataRow item in datcontrato.Rows)
            {
                switch (item["estadoc"].ToString())
                {
                    case "Activo":
                        
                        break;
                    case "Inactivo":
                        break;
                    default:
                        break;
                }
            }
        }
        public void ConsultarFactura(DataRow per,DataRow cont)
        {
            fact.contrato_idcontrato = cont["idcontrato"].ToString();
            DataTable datfactura = fact.ConsultarFacturaIdContrato(fact);
            datfactura.PrimaryKey = new DataColumn[] { datfactura.Columns["estado"] };
        }
        public void ConsultarDetalle(DataRow fac)
        {
            det.factura_idfactura = fac["idfactura"].ToString();
            DataTable datdetalle = Validar.Consulta(det.ConsultarDetalleIdFactura(det));
        }
    }
}