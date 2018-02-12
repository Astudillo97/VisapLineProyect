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
    public partial class GestPagos : System.Web.UI.Page
    {
        Pagos pago = new Pagos();
        Factura fact = new Factura();
        Contrato cont = new Contrato();

        protected void Page_Load(object sender, EventArgs e)
        {
            factservicio.Focus();
            try
            {
                string codig = Convert.ToString(Request.QueryString["codigo"]);
                if (codig != null)
                {
                    cod.InnerHtml = codig;
                    ConsularDatos(codig);
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
                        ConsularDatos(codfactura);
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
                
                DataRow datafact= Validar.Consulta(fact.ConsultarFacturaCodigo(fact)).Rows[0];
                cod.InnerHtml = datafact["facturaventa"].ToString();
                
                idfactura.InnerHtml= datafact["idfactura"].ToString();
                emision.InnerHtml= datafact["fechaemision"].ToString();
                vencimiento.InnerHtml = datafact["fechavencimiento"].ToString();
                corte.InnerHtml = datafact["fechacorte"].ToString();
                estado.InnerHtml = datafact["estado"].ToString();

                textpagado.Text = datafact["totalfac"].ToString();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        public void ConsultarTercero( string id)
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
                pago.pagado = textpagado.Text;
                pago.terceros_idterceros = "90";
                pago.factura_idfactura = idfactura.InnerHtml;
                if (pago.RegistrarPago(pago, "usuario1111", "ip:192.168.0.1"))
                {
                    textError.InnerHtml = "Pago registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
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