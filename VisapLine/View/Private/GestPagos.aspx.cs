using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Net;
using System.Net.Sockets;

namespace VisapLine.View.Private
{
    public partial class GestPagos : System.Web.UI.Page
    {
        Empresa emp = new Empresa();
        Pagos pago = new Pagos();
        Factura fact = new Factura();
        Contrato cont = new Contrato();
        Detalle deta = new Detalle();
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            factservicio.Focus();
            try
            {
                string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
                if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
                {
                    if (!IsPostBack)
                    {
                        string codig = Convert.ToString(Request.QueryString["codigo"]);
                        if (codig != null)
                        {
                            cod.InnerHtml = codig;
                            ConsularDatos(codig);

                        }
                    }
                    
                }
                else
                {
                    Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void btnConsultar(object sender, EventArgs e)
        {
            try
            {
                string dat = factservicio.Text;
                int cont = 1;
                string idterc = "";
                string codfactura = "";
                char[] values = dat.ToCharArray();
                for (int i = 0; i < values.Length; i++)
                {
                    if (values[i].Equals('-') && cont == 1)
                    {
                        cont++;
                        idterc = dat.Substring(0, i);
                    }
                    else if (values[i].Equals('-') && cont == 2)
                    {
                        codfactura = dat.Substring(i + 1);
                        Response.Redirect("gestpagos.aspx?codigo=" + codfactura);
                        break;
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

        public void ConsularDatos(string code)
        {
            try
            {
                fact.facturaventa = code;
                cod.InnerHtml = code;
                DataRow datafact = Validar.Consulta(fact.ConsultarFacturaCodigo(fact)).Rows[0];
                cod.InnerHtml = datafact["facturaventa"].ToString();

                idfactura.InnerHtml = datafact["idfactura"].ToString();
                emision.InnerHtml = Convert.ToDateTime(datafact["fechaemision"].ToString()).ToString("dd/MM/yyyy");
                vencimiento.InnerHtml = Convert.ToDateTime(datafact["fechavencimiento"].ToString()).ToString("dd/MM/yyyy"); ;
                corte.InnerHtml = Convert.ToDateTime(datafact["fechacorte"].ToString()).ToString("dd/MM/yyyy"); ;
                estado.InnerHtml = datafact["estado"].ToString();
                estado2.InnerHtml = datafact["estado"].ToString();
                valor.InnerHtml="VALOR:\n"+datafact["valorfac"].ToString();
                saldo.InnerHtml = "SALDO:\n" + datafact["saldofac"].ToString();
                iva.InnerHtml = "IVA:\n" + datafact["ivafac"].ToString();
                total.InnerHtml = "TOTAL\n:" + datafact["totalfac"].ToString();
                btnpago.Visible = true;
                if (datafact["estado"].ToString().Equals("Abonado"))
                {
                    textpagado.Text = datafact["saldofac"].ToString();
                    estado2.Attributes.Add("style", "color:blue");
                }
                else if(datafact["estado"].ToString().Equals("Pagado"))
                {
                    textpagado.Text = datafact["totalfac"].ToString();
                    estado2.Attributes.Add("style", "color:green");
                }
                else
                {
                    textpagado.Text = datafact["totalfac"].ToString();
                    estado2.Attributes.Add("style", "color:red");
                }
                nombre.InnerText= datafact["nombre"].ToString()+" "+ datafact["apellido"].ToString();
                identif.InnerText = datafact["identificacion"].ToString();
                estadocliente.InnerText = datafact["estadop"].ToString();
                correo.InnerText = datafact["correo"].ToString();
                dirrecion.InnerText = datafact["direccion"].ToString();
                telefono.InnerText = "";

                fechacontrato.InnerHtml = datafact["fechacontrato"].ToString();
                fechaactivacion.InnerHtml = datafact["fechaactivacion"].ToString();
                estadoc.InnerHtml = datafact["estadoc"].ToString();
                codigo.InnerHtml= datafact["codigo"].ToString();
                fechafinalizacion.InnerHtml = datafact["fechafinalizacion"].ToString();
                descuento.InnerHtml = datafact["fechafinalizacion"].ToString();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        public void ConsultarTercero(string id)
        {
            try
            {
                cont.terceros_idterceros = id;
                cont.ConsultarContratoidtercero(cont);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void btnRegistrarpago(object sender, EventArgs e)
        {
            try
            {
                Terceros ter = (Terceros)Session["tercero"];
                pago.pagado = textpagado.Text;
                pago.terceros_idterceros = ter.idterceros;
                pago.factura_idfactura = idfactura.InnerHtml;
                string ipprivada = GetLocalIPAddress();
                string ippublica = GetPublicIPAddress();
                if (int.Parse(textretencion.Value)>=0)
                {
                    DataRow dat = pago.RegistrarPago(pago, ter.identificacion + ": " + ter.nombre + " " + ter.apellido, GetLocalIPAddress() + "-" + Dns.GetHostName() + "-" + GetPublicIPAddress(), textretencion.Value).Rows[0];
                    if (dat["pr_insertar_pagos"].ToString() != null)
                    {
                        
                        btnimprimir.Visible = true;
                        textError.InnerHtml = "Pago registrado correctamente";
                        Alerta.CssClass = "alert alert-success";
                        Alerta.Visible = true;
                        idpago.InnerHtml = dat["pr_insertar_pagos"].ToString();
                        ConsularDatos(cod.InnerHtml);
                        btnpago.Visible = false;
                        textretencion.Value = "0";
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

        public string GetPublicIPAddress()
        {
            return this.Request.UserHostAddress.ToString();
        }

        protected void btnimprimir_ServerClick(object sender, EventArgs e)
        {
            try
            {
                immprimir(idfactura.InnerHtml);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        public void immprimir(string idpago)
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
            pago.factura_idfactura = idfactura.InnerHtml;
            Terceros ter = (Terceros)Session["tercero"];
            DataRow pag=pago.ConsultarPagoByIdFact(pago).Rows[0];
            fact.facturaventa = cod.InnerHtml;
            DataRow factura = fact.ConsultarFacturaCodigo(fact).Rows[0];
            //Datos de la cabecera del Ticket.

            ticket.TextoCentro(Nomb);
            ticket.TextoCentro(nomjuri);
            ticket.TextoCentro(Nit);
            ticket.TextoCentro(Direcion);
            ticket.TextoCentro(telefonos);

            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("REFERENCIA:"+ factura ["idfactura"]+ "-FS-"+ factura["facturaventa"].ToString());
            ticket.TextoExtermos("FECHA: " + Convert.ToDateTime(factura["fechapago"]).ToString("dd/MM/yyyy"), "HORA: " + Convert.ToDateTime(factura["fechapago"]).ToShortTimeString());
            ticket.lineasAsteriscos();

            //Sub cabecera.
            ticket.TextoIzquierdo("");
            ticket.TextoIzquierdo("ATENDIO: "+ter.nombre+" "+ter.apellido);
            ticket.TextoIzquierdo("CLIENTE: "+ factura["nombre"]+factura["apellido"]);
            ticket.TextoIzquierdo("NIT:"+ factura["identificacion"]);
            ticket.TextoExtermos("CODIGO: " + factura["codigo"], "ESTADO:" + factura["estado_serv"]);
            ticket.TextoIzquierdo("DIRECCION: " + factura["nombre"]);
            
            ticket.lineasAsteriscos();
            //Articulos a vender.
            ticket.EncabezadoFactura();//NOMBRE DEL ARTICULO, CANT, PRECIO, IMPORTE
            ticket.lineasAsteriscos();
            //Si tiene una DataGridView donde estan sus articulos a vender pueden usar esta manera para agregarlos al ticket.
            //foreach (DataGridViewRow fila in dgvLista.Rows)//dgvLista es el nombre del datagridview
            //{
            //ticket.AgregaArticulo(fila.Cells[2].Value.ToString(), int.Parse(fila.Cells[5].Value.ToString()),
            //decimal.Parse(fila.Cells[4].Value.ToString()), decimal.Parse(fila.Cells[6].Value.ToString()));
            //}
            deta.factura_idfactura = factura["idfactura"].ToString();
            DataTable tabledetalle = deta.ConsultarDetalleIdFactura(deta);
            foreach (DataRow item in tabledetalle.Rows)
            {
                ticket.AgregarArticulo(item["descripcion"].ToString(), Convert.ToInt32(item["valor"].ToString()));
            }

            ticket.lineasIgual();
            ticket.TextoIzquierdo("TOTAL A CANCELAR:" + factura["totalfac"]);
            ticket.TextoIzquierdo("TOTAL CANCELADO:" + factura["pagado"]);
            ticket.TextoIzquierdo("SALDO:" + factura["saldo"]);
            //Texto final del Ticket.
            ticket.TextoCentro("¡FIRME AQUI!");
            ticket.Cortartiket();
            ticket.ImprimirTiket("BIXOLON SRP-350plus");//Nombre de la impresora ticketera
            ticket.Cortartiket();
        }
    }
}