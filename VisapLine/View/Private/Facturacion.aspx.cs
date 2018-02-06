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
        static DataTable tablefactura = new DataTable();
        DataTable tabledetalle = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tablefactura = fact.ConsultarFacturas("null::date", "null::date", "null::character varying", "null::integer", "4");
                    allfactura.DataSource = tablefactura;
                    allfactura.DataBind();
                }

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
                if (!identificacion_.Value.Equals(""))
                {
                    tablefactura = fact.ConsultarFacturas("null::date", "null::date", "'" + identificacion_.Value + "'", "null::integer", "2");
                    allfactura.DataSource = tablefactura; 
                    allfactura.DataBind();
                    Alerta.Visible = false;
                }
                else
                {
                    tablefactura= fact.ConsultarFacturas("null::date", "null::date", "null::character varying", codigofact_.Value, "3");
                    allfactura.DataSource = tablefactura;
                    Alerta.Visible = false;
                    allfactura.DataBind();
                }

                Alerta.Visible = false;
            }
            catch (Exception)
            {
            }

        }
        public void Limpiar(GridView list)
        {
            list.Dispose();
            list.DataSource = null;
        }

        

        protected void ConsultarByFecha(object sender, EventArgs e)
        {
            try
            {
                allfactura.DataSource = fact.ConsultarFacturas("'"+fecinicio_.Value+"'", "'"+fecfin_.Value+"'", "null::character varying", "null::integer", "1");
                allfactura.DataBind();
                Alerta.Visible = false;
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void allfactura_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                allfactura.PageIndex = e.NewPageIndex;
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

        protected void allfactura_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                DataRow dat = tablefactura.Rows[e.RowIndex];
                string referen = pdf.CrearFactura(empresa.ConsultarEmpresa(), dat);
                string reference = pdf.CrearFacturaGrupal(empresa.ConsultarEmpresa(), dat);
                Response.Redirect("../../Archivos/" + reference);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void allfactura_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                DataRow dat = tablefactura.Rows[e.NewSelectedIndex];
                Response.Redirect("GestPagos.aspx?codigo=" + dat["idfactura"] + "");
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void allfactura_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                
                DataTable factura = Validar.Consulta(fact.ConsultarFacturaIdContrato(fact));

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