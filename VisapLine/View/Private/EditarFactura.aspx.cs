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
    public partial class EditarFactura : System.Web.UI.Page
    {
        Factura fact = new Factura();
        protected void Page_Load(object sender, EventArgs e)
        {
            string valor = Convert.ToString(Request.QueryString["key"]);
            if (valor != null)
            {
                fact.facturaventa = valor;
                DataRow dat=fact.ConsultarFacturaCodigo(fact).Rows[0];
                idfact.Text = dat["idfactura"].ToString();
                emisio.Text = Convert.ToDateTime(dat["fechaemision"]).ToString("dd/MM/yyyy");
                cort.Text = dat["fechacorte"].ToString();
                vencimient.Text = dat["fechavencimiento"].ToString();
                estad.Text = dat["estado"].ToString();
                cuotas.Text = dat["cuotas"].ToString();
                facturaventa.Text = dat["facturaventa"].ToString();
                valorfac.Text = dat["valorfac"].ToString();
                saldofact.Text = dat["saldofac"].ToString();
                ivafact.Text = dat["ivafac"].ToString();
                totalfact.Text = dat["totalfac"].ToString();
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                fact.idfactura = Validar.validarlleno(idfact.Text);
                fact.fechaemision = Validar.validarlleno(emisio.Text);
                fact.fechacorte = Validar.validarlleno(cort.Text);
                fact.fechavencimiento = Validar.validarlleno(vencimient.Text);
                fact.estado = Validar.validarlleno(estad.Text);
                fact.cuotas = Validar.validarlleno(cuotas.Text);
                fact.facturaventa = Validar.validarlleno(facturaventa.Text);
                fact.valor = Validar.validarlleno(valorfac.Text);
                fact.saldo = Validar.validarlleno(saldofact.Text);
                fact.iva = Validar.validarlleno(ivafact.Text);
                fact.total = Validar.validarlleno(totalfact.Text);
                if (fact.ActualizarFactura(fact))
                {
                    textError.InnerHtml = "Actualizado Correctamente";
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