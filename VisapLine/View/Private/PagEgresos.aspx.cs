using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Net;
using System.Net.Sockets;
namespace VisapLine.View.Private
{
    public partial class PagEgresos : System.Web.UI.Page
    {
        Terceros terc = new Terceros();
        Egreso eg = new Egreso();
        Motivo mo = new Motivo();
        Empresa emp = new Empresa();
        TipoTercero tt = new TipoTercero();
        Proveedor prov = new Proveedor();
        TipoDoc tpdoc = new TipoDoc();
        Telefono tlf = new Telefono();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    DropDownList2.DataSource = mo.Consultarmotivo();
                    DropDownList2.DataTextField = "motivo";
                    DropDownList2.DataValueField = "idmotivo";
                    DropDownList2.DataBind();

                    DropDownList1.DataSource = tt.Consultartipotercerofiltradoegreso();
                    DropDownList1.DataTextField = "tipoterceros";
                    DropDownList1.DataValueField = "idtipotercero";
                    DropDownList1.DataBind();

                    DropDownListtipodocu.DataSource = tpdoc.ConsultarTipoDoc();
                    DropDownListtipodocu.DataTextField = "tipodoc";
                    DropDownListtipodocu.DataValueField = "idtipodoc";
                    DropDownListtipodocu.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
                if (datcont["nombre"].ToString() == "")
                {


                }
                else
                {
                    datosterceros.Visible = true;
                    Div1.Visible = true;
                    Label1.Text = datcont["nombre"].ToString();
                    Label2.Text = datcont["apellido"].ToString();
                    TextBox1.Text = datcont["direccion"].ToString();
                    Buttonguarimpri.Visible = true;
                }

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
                Proveedors.Visible = true;
                Div1.Visible = true;
                Buttonguarimpri.Visible = false;
                Buttonguar2.Visible = true;

            }
        }

        protected void tipotercero_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public string GetPublicIPAddress()
        {
            return this.Request.UserHostAddress.ToString();
        }
        public string GetLocalIPAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new ValidarExeption("No network adapters with an IPv4 address in the system!");
        }
        protected void Buttonguarimpri_Click(object sender, EventArgs e)
        {
            try
            {
                Terceros ter = (Terceros)Session["tercero"];
                DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
                string ipprivada = GetLocalIPAddress();
                string ippublica = GetPublicIPAddress();
                eg.observacion =  Validar.validarlleno(TextBox2.Text).ToUpper();
                eg.valoregreso = Validar.validarlleno(TextBox3.Text);
                eg.motivo_idtercero_egre = Validar.validarselected(DropDownList2.SelectedValue);
                eg.tercero_idtercero_egre = datcont["idterceros"].ToString();
                eg.tercero_idtercero_reg = ter.idterceros;
                eg.Registraregreso(ter.identificacion + ": " + ter.nombre + " " + ter.apellido, GetLocalIPAddress() + "-" + Dns.GetHostName() + "-" + GetPublicIPAddress());
                imprimir();
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", " errorsoft();", true);               
            }
          
        }


        public void imprimir()
        {
            DataTable dt = emp.ConsultarEmpresa();
            string Nomb = "", Nit = "", Direcion = "", nomjuri = "", telefonos = "";
            impresorabix ticket = new impresorabix();
            //Ya podemos usar todos sus metodos
            foreach (DataRow fila in dt.Rows)
            {
                if (fila[1].ToString().Equals("nombreempresa"))
                {
                    Nomb = fila[2].ToString();
                }
                if (fila[1].ToString().Equals("nombrejuridico"))
                {
                    nomjuri = fila[2].ToString();
                }
                if (fila[1].ToString().Equals("nit"))
                {
                    Nit = "NIT : " + fila[2].ToString();
                }
                if (fila[1].ToString().Equals("direccion"))
                {
                    Direcion = fila[2].ToString();
                }
                if (fila[1].ToString().Equals("lineanacional") || fila[1].ToString().Equals("telefono1") || fila[1].ToString().Equals("telefono2"))
                {
                    telefonos += " " + fila[2].ToString() + " ";
                }
            }
            //De aqui en adelante pueden formar su ticket a su gusto... Les muestro un ejemplo

            Terceros ter = (Terceros)Session["tercero"];

            DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
            //Datos de la cabecera del Ticket.

            ticket.TextoCentro(Nomb);
            ticket.TextoCentro(nomjuri);
            ticket.TextoCentro(Nit);
            ticket.TextoCentro(Direcion);
            ticket.TextoCentro(telefonos);
            ticket.TextoCentro("EGRESO");

            ticket.TextoIzquierdo("");
            ticket.TextoExtermos("FECHA: " + DateTime.Now.ToShortDateString(), DateTime.Now.ToShortTimeString());
            ticket.lineasAsteriscos();

            //Sub cabecera.
            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("ATENDIO: " + ter.nombre + " " + ter.apellido);
            ticket.TextoIzquierdo("CLIENTE: " + datcont["nombre"].ToString() + " " + datcont["apellido"].ToString());
            ticket.TextoIzquierdo("NIT:" + datcont["identificacion"].ToString());
            ticket.TextoIzquierdo("DIRECCION: " + datcont["direccion"].ToString());

            ticket.lineasAsteriscos();
            //Articulos a vender.
            ticket.EncabezadoFactura();//NOMBRE DEL ARTICULO, CANT, PRECIO, IMPORTE
            ticket.lineasAsteriscos();


            ticket.AgregarArticulo(TextBox2.Text, Convert.ToInt32(TextBox3.Text));


            ticket.lineasIgual();
            ticket.TextoIzquierdo("TOTAL A CANCELAR:" + TextBox3.Text);
            ticket.TextoIzquierdo("TOTAL CANCELADO:" + TextBox3.Text);
            ticket.TextoIzquierdo("SALDO: 0");
            //Texto final del Ticket.
            ticket.TextoCentro("¡FIRME AQUI!");
            ticket.Cortartiket();
            ticket.ImprimirTiket("BIXOLON SRP-350plus");//Nombre de la impresora ticketera
            ticket.Cortartiket();
        }

        protected void Buttonguar2_Click(object sender, EventArgs e)
        {
          




        }
    }
}