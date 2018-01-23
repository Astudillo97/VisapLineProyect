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
                    listFacturas.DataSource = Validar.Consulta(det.ConsultarDetalleIdFactura(det));
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
        public string CrearFactura()
        {
            try
            {
                String rootPath = Server.MapPath("~");
                string urlpdf = rootPath + "Archivos\\mipdf.pdf";
                string imagen = rootPath + "Archivos\\imgvisap.png";
                //pdf.CrearPdf(urlpdf);
                pdf.CrearFactura(urlpdf, imagen);
                return "";
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
            return "";
        }
        public static string GenerarNombrePdf(string dat)
        {
            DateTime dateTime = new DateTime();
            return dateTime.Year + dateTime.Month + dateTime.Day + dateTime.Hour + dateTime.Minute + "-" + dat + ".pdf";
        }

        protected void CrearFactura_(object sender, EventArgs e)
        {
            DataTable datEmpresa = empresa.ConsultarEmpresa();
            DataRow dat = datEmpresa.Rows.Find("nombreempresa");
            string name = GenerarNombrePdf("s");
        }
    }
}