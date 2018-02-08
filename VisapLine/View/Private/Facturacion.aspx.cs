﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Globalization;

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
        class_correo correo = new class_correo();
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
                Response.Redirect("../../Archivos/" + referen);
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

        protected void allfactura_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "verfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    tablefactura.PrimaryKey = new DataColumn[] { tablefactura.Columns["idfactura"] };
                    DataRow dat = tablefactura.Rows.Find(paramet);
                    string referen = pdf.CrearFactura(empresa.ConsultarEmpresa(), dat);
                    Response.Redirect("../../Archivos/" + referen);
                }
                if (e.CommandName.ToString() == "editarfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    Response.Redirect("GestCliente.aspx?fact=" + paramet);
                }
                if (e.CommandName.ToString() == "pagarfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    Response.Redirect("GestPagos.aspx?codigo=" + paramet);
                }
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

        protected void Imprimirallfactura(object sender, EventArgs e)
        {
            try
            {
                string reference = pdf.CrearFacturaGrupal(empresa.ConsultarEmpresa(), tablefactura);
                Response.Redirect("../../Archivos/" + reference);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void EnviarAllFactura(object sender, EventArgs e)
        {
            string html = "Estimado usuario, ahora podras ver las facturas en nuestro sitio web: http://www.visapline.com/ \n " +
                "Tambien recibiras la factura por este medio.";
            string path = HttpContext.Current.Server.MapPath("~");
            string dir = "Archivos\\";
            DataTable basic;
            try
            {
                basic = empresa.ConsultarEmpresa();
                foreach (DataRow item in tablefactura.Rows )
                {
                    if (item["enviofactura"].ToString()=="CORREO")
                    {
                        string referen = pdf.CrearFactura(basic, item);
                        correo.asunto = "VISAPLINE - FACTURA " + item["facturaventa"].ToString()+ " "+Convert.ToDateTime(item["fechavencimiento"].ToString()).ToString("Y", CultureInfo.CreateSpecificCulture("es-co"));
                        //correo.destinatario= item["correo"].ToString();
                        correo.destinatario = "jab291214@gmail.com";
                        correo.cuerpo= html;
                        correo.archivo= path+dir+ referen;
                        correo.EnviarMensaje();
                    }
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