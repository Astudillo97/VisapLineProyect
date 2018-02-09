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
    public partial class GestCliente : System.Web.UI.Page
    {
        Terceros tercero = new Terceros();
        Telefono tlf = new Telefono();
        Contrato contrato = new Contrato();
        Empresa empresa = new Empresa();
        class_pdf pdf = new class_pdf();
        Factura fact = new Factura();
        static DataTable tablefactura = new DataTable();
        static DataTable tercliente = new DataTable();
        static DataTable contcliente = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ConsultarIdentif(object sender, EventArgs e)
        {
            try
            {
                tercero.identificacion = Validar.validarlleno(identif_.Value);
                tercliente =Validar.Consulta(tercero.ConsultarTerceroDos(tercero));
                consultacliente.DataSource = tercliente;
                consultacliente.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void consultacliente_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            DataRow row = tercliente.Rows[e.NewSelectedIndex];
            _tipocliente .Value= row["tipoterceros"].ToString();
            identificacion_.Value = row["identificacion"].ToString();
            _nombre_.Value = row["nombre"].ToString()+" "+ row["apellido"].ToString();
            _correo_.Value = row["correo"].ToString();
            _estado_.Value = row["estado"].ToString();

            tlf.terceros_idterceros = row["identificacion"].ToString();
            DataTable listtelefono = tlf.ConsultarTelefonosIdTerceros(tlf);
            string telef = "";
            foreach (DataRow item in listtelefono.Rows)
            {
                telef += item["telefono"].ToString()+" ";
            }
            _telefono_.Value = telef;
            contrato.terceros_idterceros= row["idterceros"].ToString();
            contcliente = Validar.Consulta(contrato.ConsultarContratoIdTercero(contrato));
            consultacontrato.DataSource = contcliente;
            consultacontrato.DataBind();

            
        }

        protected void consultacontrato_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            DataRow row = contcliente.Rows[e.NewSelectedIndex];     

            fact.contrato_idcontrato = row["idcontrato"].ToString();
            tablefactura = fact.ConsultarFacturabyContrato(fact);
            allfactura.DataSource = tablefactura;
            allfactura.DataBind();
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
    }
}