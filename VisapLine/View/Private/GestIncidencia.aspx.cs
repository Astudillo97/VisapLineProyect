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
    public partial class GestIncidencia : System.Web.UI.Page
    {
        Incidencias inci = new Incidencias();
        Servicios serv = new Servicios();
        Contrato cont = new Contrato();
        Terceros terc = new Terceros();
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

                try
                {
                    cargartabla();
                }
                catch (Exception ex)
                {
                    textError.InnerHtml = ex.Message;
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
               
            }



        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = GridView2.SelectedRow;
            Labelidincidencia.Text = gridw.Cells[1].Text;
            Labelidincidencia.Visible = true;
            DataRow indat= inci.ConsultarIncidencias(Labelidincidencia.Text).Rows[0];
            DataRow ser = serv.consultaserviciosid(indat["servicios_idservicios"].ToString()).Rows[0];
            cont.idcontrato = ser["contrato_idcontrato"].ToString();
            DataRow con = cont.ConsultarContratoidcontrato(cont).Rows[0];
            terc.idterceros = con["terceros_idterceros_cont"].ToString();
            DataRow ter = terc.ConsultarTercerosId(terc).Rows[0];
            Label1.Text = ter["nombre"].ToString();
            Label2.Text = ter["apellido"].ToString();
            TextBox1.Text = ter["direccion"].ToString();
            iddatosterceros.Visible = true;
            Button1.Visible = true;
        }


        protected void cargartabla()
        {
           
            DataTable dt = inci.ConsultarIncidencias();
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            cargartabla();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Terceros ter = (Terceros)Session["tercero"];
                inci.terceros_idterceros = terc.idterceros;
                inci.terceros_idterceros = Validar.validarlleno(ter.idterceros);
                inci.idincidencias = Validar.validarlleno(Labelidincidencia.Text);
                inci.estado = Validar.validarselected(DropDownListestadoinc.Text);
                inci.detalle = Validar.validarlleno(TextArea1detalle.Value.ToUpper());
                Validar.validarselected(DropDownList1.Text);
                if (DropDownList1.Text == "SI")
                {
                    inci.descuento = "true";
                }
                else
                {
                    if (DropDownList1.Text == "NO")
                    {
                        TextBox2.Text = "0";
                        inci.descuento = "false";
                    }
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        

            inci.costo = TextBox2.Text;

           if(inci.updatesolucionincidencia(inci))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                cargartabla();
                iddatosterceros.Visible = false;
                DropDownListestadoinc.Text = "Seleccione";
                TextBox2.Text = "";
                TextArea1detalle.Value = "";
                Button1.Visible = false;

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
            }
           
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "SI")
            {
                costodescuento.Visible = true;
            }
            else
            {
                if (DropDownList1.Text == "NO")
                {
                    costodescuento.Visible = false;
                }
            }

        }
    }
}