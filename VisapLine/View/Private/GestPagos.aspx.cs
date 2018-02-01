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

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                factservicio.Focus();
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
                textpagado.Text = datafact["totalfac"].ToString();
                idfactura.InnerHtml= datafact["idfactura"].ToString();

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
                    Alerta.CssClass = "alert alert-error";
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