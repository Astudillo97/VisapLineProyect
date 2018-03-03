using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Globalization;
using RestSharp;
using System.Web.Script.Serialization;
using System.Net;

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
        Telefono telefon = new Telefono();
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
                Response.Redirect("gestpagos.aspx?codigo=" + dat["idfactura"] + "");
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
                    Response.Redirect("editarfactura.aspx?key=" + paramet);
                }
                if (e.CommandName.ToString() == "pagarfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    Response.Redirect("gestpagos.aspx?codigo=" + paramet);
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
                string facimpr = Validar.validarselected(metodoimpresion.SelectedValue);
                string reference = pdf.CrearFacturaGrupal(empresa.ConsultarEmpresa(), tablefactura,facimpr);
                Response.Redirect("../../Archivos/" + reference);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        private static string Descripcion(DataTable data, string key)
        {
            data.PrimaryKey = new DataColumn[] { data.Columns["descripcion"] };
            DataRow dat = data.Rows.Find(key);
            return dat["valor1"].ToString();
        }

        protected void EnviarAllFactura(object sender, EventArgs e)
        {
            
            string path = HttpContext.Current.Server.MapPath("~");
            
            string dir = "Archivos\\";
            
            DataTable basic;
            basic = empresa.ConsultarEmpresa();
            try
            {
                string html = divcorreo.InnerHtml;
                string meto=Validar.validarselected(method.SelectedValue);
                int cont = 0;
                foreach (DataRow item in tablefactura.Rows )
                {
                    if (item["enviofactura"].ToString()==meto && cont>514)
                    {
                        string referen = pdf.CrearFactura(basic, item);
                        correo.asunto = "VISAPLINE - FACTURA " + item["facturaventa"].ToString()+ " "+Convert.ToDateTime(item["fechaemision"].ToString()).ToString("Y", CultureInfo.CreateSpecificCulture("es-co"));
                        //correo.destinatario= item["correo"].ToString();
                        correo.destinatario = item["correo"].ToString();
                        correo.cuerpo= html;
                        correo.html = true;
                        if (!correo.html)
                        {
                            correo.cuerpo = "Señor Usuario ahora puedes descargar su factura en http://191.102.85.252:30000/View/Public/facturacion.aspx";
                        }
                        correo.archivo= path+dir+ referen;
                        correo.EnviarMensaje();
                    }
                    cont++;
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void EnviarSMSText(object sender, EventArgs e)
        {
            try
            {
                Empresa emp = new Empresa();
                Validar.validarselected(estadofactura.SelectedValue);
                
                foreach (DataRow item in tablefactura.Rows)
                {
                    if (item["estadof"].ToString() == estadofactura.SelectedValue)
                    {
                        string msm = Descripcion(emp.ConsultarEmpresa(), estadofactura.SelectedValue);
                        telefon.terceros_idterceros = item["identificacion"].ToString();
                        DataRow datf = telefon.ConsultarTelefonosIdTerceros(telefon).Rows[0];
                        if (datf["telefono"].ToString().Length>=10)
                        {
                            string celular = "57" + "3118747881"; //datf["telefono"].ToString();
                            string nombre = item["nombre"].ToString() +" "+ item["apellido"].ToString();
                            ClientScript.RegisterStartupScript(GetType(), "msm", "EnviarSMS('" + msm+"','"+celular+"');", true);
                        }
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