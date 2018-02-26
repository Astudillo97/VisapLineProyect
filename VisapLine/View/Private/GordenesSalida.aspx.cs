using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
using System.Web.Services;

namespace VisapLine.View.Private
{
    public partial class Gservicio : System.Web.UI.Page
    {
        public static string fecha1 = "", fecha2 = "";
        OrdenSalida ord = new OrdenSalida();
        DetalleSalida dsord = new DetalleSalida();
        TipoProducto tp = new TipoProducto();
        public static string valosal;
        Empresa emp = new Empresa();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                divconten.Visible = false;
                divcreator.Visible = false;
                Llenartecnicos();
                gridbusqueda.DataSource = ord.ConsultarEstado(false);
                gridbusqueda.DataBind();
                llenarinstlaciones();
                llenarViabilidades();
                llenarTrabajos();
            }
        }

        protected void Llenartecnicos()
        {
            gridtecnicos.DataSource = ord.buscartecnicos();
            gridtecnicos.DataBind();
            gridbusqueda.DataSource = ord.ConsultarEstado(false);
            gridbusqueda.DataBind();
        }
        protected void Llenargrid(string dato)
        {
            gridtelefono.DataSource = ord.cosnutlarlefonosorden(dato);
            gridtelefono.DataBind();
        }
        protected void llenardetalle()
        {
            GridViewdeta.DataSource = ord.Consultardetalleordesali(valosal);
            GridViewdeta.DataBind();
        }
        protected void Llenardrop()
        {
            droptiporduc.DataSource = tp.ConsultarTipoProducto();
            droptiporduc.DataTextField = "tipoproducto";
            droptiporduc.DataValueField = "idtipoproducto";
            droptiporduc.DataBind();
        }

        protected void droptiporduc_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "pop", "openModal();", true);
            inventariogrid.DataSource = ord.consultarinventario(int.Parse(droptiporduc.SelectedValue));
            inventariogrid.DataBind();

        }



        protected void btnconsultar_Click(object sender, EventArgs e)
        {
            formordenes.Dispose();
            valosal = Borden2.Text;
            NewMethod(valosal);

        }

        private void NewMethod(string valosal)
        {
            if (valosal.Contains("INS"))
            {
                divgrid.Visible = false;
                DataTable consulta = ord.Consultarorden(valosal);
                formordenes.DataSource = consulta;
                formordenes.DataBind();
                Llenargrid(consulta.Rows[0][7].ToString());
                llenardetalle();
                Llenardrop();
                divconten.Visible = true;
                divcreator.Visible = false;
                Formtrabajos.Visible = false;
            }
            else
            {
                divgrid.Visible = false;
                DataTable consulta = ord.Consultarordentrab(valosal);
                Formtrabajos.DataSource = consulta;
                Formtrabajos.DataBind();
                divconten.Visible = true;
                divcreator.Visible = false;
                llenardetalle();
                Llenardrop();
                formordenes.Visible = false;
            }
        }

        protected void llenarinstlaciones()
        {
            repetidorinstalaciones.DataSource = ord.Consultarinstalacionesdeldia();
            repetidorinstalaciones.DataBind();
        }
        protected void llenarViabilidades()
        {
            Repeater1.DataSource = ord.Consultarviablidadesdeldia();
            Repeater1.DataBind();
        }
        protected void llenarTrabajos()
        {
            Repeater2.DataSource = ord.Consultartrabajosdeldia();
            Repeater2.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            divconten.Visible = false;
            divcreator.Visible = true;

        }

        protected void immprimir()
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
            if (!ddltipoorden.SelectedItem.Text.Equals("----------"))
            {
                DataTable dt = ord.Insertar(txtdetalle.Text, txtobservacion.Text, ddltipoorden.SelectedItem.Text, 90);
                if (dt.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert('" + dt.Rows[0][0].ToString() + "');", true);
                    divconten.Visible = false;
                    divcreator.Visible = false;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            fecha1 = TextBox4.Text;
            fecha2 = TextBox5.Text;
            divgrid.Visible = true;
            gridbusqueda.DataSource = ord.ConsultarFechas(fecha1, fecha2, estaadoorden.Checked);
            gridbusqueda.DataBind();
        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            divcreator.Visible = false;
            busquedaavansada.Visible = false;
            principaldiv.Visible = true;

        }

        protected void divs_ServerClick(object sender, EventArgs e)
        {
            busquedaavansada.Visible = true;
            gridbusqueda.DataSource = ord.ConsultarEstado(false);
            gridbusqueda.DataBind();
            principaldiv.Visible = false;
        }

        protected void gridbusqueda_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gridbusqueda_SelectedIndexChanging1(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = gridbusqueda.Rows[e.NewSelectedIndex];
            valosal = row.Cells[1].Text;
            NewMethod(valosal);
        }

        protected void gridtecnicos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = gridtecnicos.Rows[e.NewSelectedIndex];
            if (ord.asignartecnico(row.Cells[1].Text, valosal))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "asignacionok();", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "asignacionfail();", true);
            }

        }

        [WebMethod]
        public static bool cerrarord_Click()
        {
            OrdenSalida ord = new OrdenSalida();
            return ord.Cerrarorden(valosal);
        }

        protected void inventariogrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = inventariogrid.SelectedRow;
            TextBox tcant = (TextBox)row.Cells[2].FindControl("txbcanti");
            dsord.insertardetallesalida(tcant.Text, row.Cells[0].Text, valosal);
            llenardetalle();
        }

        protected void repetidorinstalaciones_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("buscar")) {
                valosal = e.CommandArgument.ToString();
                NewMethod(e.CommandArgument.ToString());
                
            }
        }

        protected void gridbusqueda_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridbusqueda.PageIndex = e.NewPageIndex;
            gridbusqueda.DataSource = ord.ConsultarFechas(fecha1, fecha2, estaadoorden.Checked);
            gridbusqueda.DataBind();
        }
    }
}