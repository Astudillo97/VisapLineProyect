using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Public
{
    public partial class facturacion : System.Web.UI.Page
    {
        Factura fact = new Factura();
        static DataTable tablefactura = new DataTable();
        class_pdf pdf = new class_pdf();
        Empresa empresa = new Empresa();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            try
            {
                if (!identificacion_.Text.Equals(""))
                {
                    tablefactura = fact.ConsultarFacturas("null::date", "null::date", "'" + identificacion_.Text + "'", "null::integer", "2");
                    allfactura.DataSource = tablefactura;
                    allfactura.DataBind();
                    Alerta.Visible = false;
                }
                else
                {
                    textError.InnerHtml = "No se encontraron registros con esta identificación, puedes llamar, dirigirse a nuestra oficina o enviarnos un correo a facturacion@visapline.com ";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }

            }
            catch (Exception)
            {
                textError.InnerHtml = "No se encontraron registros con esta identificación, puedes llamar, dirigirse a nuestra oficina o enviarnos un correo a facturacion@visapline.com ";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void allfactura_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "verfactura")
            {
                string paramet = e.CommandArgument.ToString();
                tablefactura.PrimaryKey = new DataColumn[] { tablefactura.Columns["idfactura"] };
                DataRow dat = tablefactura.Rows.Find(paramet);
                string referen = pdf.CrearFactura(empresa.ConsultarEmpresa(), dat);
                Response.Redirect("../../Archivos/" + referen);
            }
        }


    }
}