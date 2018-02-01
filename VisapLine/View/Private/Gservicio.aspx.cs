using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
namespace VisapLine.View.Private
{
    public partial class Gservicio : System.Web.UI.Page
    {
        OrdenSalida ord = new OrdenSalida();
        DetalleSalida dsord = new DetalleSalida();
        TipoProducto tp = new TipoProducto();
        public static string valosal;
        Empresa emp = new Empresa();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack) {
                divconten.Visible = false;
                divcreator.Visible = false;
            }
        }


        protected void Llenargrid(string dato) {
            gridtelefono.DataSource = ord.cosnutlarlefonosorden(dato);
            gridtelefono.DataBind();
        }
        protected void llenardetalle()
        {
            GridViewdeta.DataSource = ord.Consultardetalleordesali(valosal);
            GridViewdeta.DataBind();
        }
        protected void Llenardrop(){
            droptiporduc.DataSource =tp.ConsultarTipoProducto();
            droptiporduc.DataTextField = "tipoproducto";
            droptiporduc.DataValueField = "idtipoproducto";
            droptiporduc.DataBind();
}

        protected void droptiporduc_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            inventariogrid.DataSource = ord.consultarinventario(droptiporduc.SelectedIndex);
            inventariogrid.DataBind();
        }

        protected void addinvent_Click(object sender, EventArgs e)
        {
            TextBox tcant = (TextBox)inventariogrid.Rows[0].Cells[2].FindControl("txbcanti");     
            dsord.insertardetallesalida(tcant.Text, inventariogrid.Rows[0].Cells[0].Text, valosal);
            llenardetalle();
        }

        protected void btnconsultar_Click(object sender, EventArgs e)
        {
            valosal = Borden2.Text;
            if (valosal.Contains("INS"))
            {
                DataTable consulta = ord.Consultarorden(valosal);
                formordenes.DataSource = consulta;
                formordenes.DataBind();
                Llenargrid(consulta.Rows[0][7].ToString());
                llenardetalle();
                Llenardrop();
                divconten.Visible = true;
                divcreator.Visible = false;
            }
            else {
                DataTable consulta = ord.Consultarordentrab(valosal);
                Formtrabajos.DataSource = consulta;
                Formtrabajos.DataBind();
                divconten.Visible = true;
                divcreator.Visible = false;
                llenardetalle();
                Llenardrop();
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            divconten.Visible = false;
            divcreator.Visible = true;
            

        }

        protected void immprimir() {
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

            //Datos de la cabecera del Ticket.

            ticket.TextoCentro(Nomb);
            ticket.TextoCentro(nomjuri);
            ticket.TextoCentro(Nit);
            ticket.TextoCentro(Direcion);
            ticket.TextoCentro(telefonos);

            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("Ticket # 002-0000006");
            ticket.lineasAsteriscos();

            //Sub cabecera.
            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("ATENDIÓ: VENDEDOR");
            ticket.TextoIzquierdo("CLIENTE: PUBLICO EN GENERAL");
            ticket.TextoIzquierdo("");
            ticket.TextoExtermos("FECHA: " + DateTime.Now.ToShortDateString(), "HORA: " + DateTime.Now.ToShortTimeString());
            ticket.lineasAsteriscos();

            //Articulos a vender.
            ticket.EncabezadoArticulos();//NOMBRE DEL ARTICULO, CANT, PRECIO, IMPORTE
            ticket.lineasAsteriscos();
            //Si tiene una DataGridView donde estan sus articulos a vender pueden usar esta manera para agregarlos al ticket.
            //foreach (DataGridViewRow fila in dgvLista.Rows)//dgvLista es el nombre del datagridview
            //{
            //ticket.AgregaArticulo(fila.Cells[2].Value.ToString(), int.Parse(fila.Cells[5].Value.ToString()),
            //decimal.Parse(fila.Cells[4].Value.ToString()), decimal.Parse(fila.Cells[6].Value.ToString()));
            //}
            ticket.AgregarArticulo("Articulo A", 2);
            ticket.lineasIgual();


            //Texto final del Ticket.
            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("ARTICULOS A ENTREGAR: ");
            ticket.TextoIzquierdo("");
            ticket.TextoCentro("¡FIRME AQUI!");
            ticket.Cortartiket();
            ticket.ImprimirTiket("BIXOLON SRP-350plus");//Nombre de la impresora ticketera
            ticket.Cortartiket();
        }

        protected void btnsuccessorde_Click(object sender, EventArgs e)
        {
            DataTable dt = ord.Insertar(txtdetalle.Text, txtobservacion.Text, ddltipoorden.SelectedItem.Text,90);
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
            }
            else {

            }
        }
    }
}