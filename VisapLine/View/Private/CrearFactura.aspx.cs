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
    public partial class CrearFactura : System.Web.UI.Page
    {
        Terceros tercero = new Terceros();
        Telefono tlf = new Telefono();
        Contrato contrato = new Contrato();
        Empresa empresa = new Empresa();
        class_pdf pdf = new class_pdf();
        Factura fact = new Factura();
        Observacion observac = new Observacion();
        Incidencias inci = new Incidencias();
        static DataTable tablefactura = new DataTable();
        static DataTable tercliente = new DataTable();
        static DataTable contcliente = new DataTable();
        Servicios serv = new Servicios();
        Puntos punto = new Puntos();
        CargoAdicional cargo = new CargoAdicional();
        public DataTable punt = new DataTable();
        public static string ident;
        CategoriaIncidencia cinci = new CategoriaIncidencia();
        TipoIncidencia tpin = new TipoIncidencia();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();
        Pagos pg = new Pagos();
        protected void Page_Load(object sender, EventArgs e)
        {
            string valor = Convert.ToString(Request.QueryString["key"]);
            if (valor == null)
            {
                Response.Redirect("gestcliente.aspx");
            }
            else
            {
                consultardatoscliente(valor);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void ConsultarIdentif(object sender, EventArgs e)
        {
            try
            {
                tercero.identificacion = Validar.validarlleno(identif_.Value);
                tercliente = Validar.Consulta(tercero.ConsultarTerceroAvanzado(tercero));
                consultacliente.DataSource = tercliente;
                consultacliente.DataBind();
                Alerta.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panelbutton();", true);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void consultacontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = consultacontrato.SelectedRow;
            Labelidcontrato.Text = Validar.validarlleno(gridw.Cells[0].Text);

        }
        private void consultardatoscliente(string identificacion)
        {
            tercero.identificacion = Validar.validarlleno(identificacion);
            DataRow row = Validar.Consulta(tercero.ConsultarTerceroAvanzado(tercero)).Rows[0];
            _tipocliente.Value = row["tipoterceros"].ToString();
            identificacion_.Value = row["identificacion"].ToString();
            ident = row["identificacion"].ToString();
            _nombre_.Value = row["nombre"].ToString() + " " + row["apellido"].ToString();
            _correo_.Value = row["correo"].ToString();
            _estado_.Value = row["estado"].ToString();
            _direccion_.Value = row["direccion"].ToString();
            tlf.terceros_idterceros = row["identificacion"].ToString();
            DataTable listtelefono = tlf.ConsultarTelefonosIdTerceros(tlf);
            string telef = "";
            foreach (DataRow item in listtelefono.Rows)
            {
                telef += item["telefono"].ToString() + " ";
            }
            _telefono_.Value = telef;
            contrato.terceros_idterceros = row["idterceros"].ToString();
            DataTable contclientes = contrato.ConsultarContratoIdTercero(contrato);
            consultacontrato.DataSource = contclientes;
            consultacontrato.DataBind();
            Alerta.Visible = false;
            datos.Visible = true;
        }

        protected void consultacliente_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                Alerta.Visible = false;
                datos.Visible = true;
                GridViewRow gridw = consultacliente.SelectedRow;
                consultardatoscliente(Validar.validarlleno(gridw.Cells[0].Text));
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