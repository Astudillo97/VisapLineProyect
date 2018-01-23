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
        class_pdf pdf = new class_pdf();
        Detalle det = new Detalle();
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
                DataRow datos=Validar.Consulta(terc.ConsultarPersonaIdentifall(terc)).Rows[0];
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
                Limpiar();
                
            }

        }
        public void Limpiar()
        {
            listContrato.Dispose();
            listFacturas.Dispose();
            listFacturas.DataSource = null;
            listFacturas.DataBind();
            listContrato.DataSource = null;
            listContrato.DataBind();
        }

        protected void tipodoc__SelectedIndexChanged(object sender, EventArgs e)
        {

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

        protected void listContrato_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "ver")
                {
                    string dat = e.CommandArgument.ToString();
                    det.contrato_idcontrato = dat;
                    listFacturas.DataSource = Validar.Consulta(det.ConsultarContratoIdContrato(det));
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
                    det.contrato_idcontrato = dat;
                    listFacturas.DataSource = Validar.Consulta(det.ConsultarContratoIdContrato(det));
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
    }
}