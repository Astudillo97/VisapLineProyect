﻿using System;
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
    public partial class PagEgresos : System.Web.UI.Page
    {
        Terceros terc = new Terceros();
        Egreso eg = new Egreso();
        Motivo mo = new Motivo();
        Empresa emp = new Empresa();
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
                    TextBox1.Text= datcont["direccion"].ToString();
                }

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
                Proveedors.Visible = true;
                Div1.Visible = true;
            }
        }

        protected void tipotercero_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

     

        protected void Buttonguarimpri_Click(object sender, EventArgs e)
        {
            imprimir();







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

            ticket.TextoIzquierdo("");
            ticket.TextoExtermos("FECHA: " + DateTime.Now.ToShortDateString(), DateTime.Now.ToShortTimeString());
            ticket.lineasAsteriscos();

            //Sub cabecera.
            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("ATENDIO: " + ter.nombre + " " + ter.apellido);
            ticket.TextoIzquierdo("CLIENTE: " + datcont["nombre"].ToString() +" "+ datcont["apellido"].ToString());
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
    }
}