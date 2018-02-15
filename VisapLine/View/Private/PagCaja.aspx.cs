using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Drawing;
namespace VisapLine.View.Private
{
    public partial class PagCaja : System.Web.UI.Page
    {

        Caja cj = new Caja();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataRow dt = Validar.Consulta(cj.ConsultarCaja()).Rows[0];
                cargarestado();
                cargartabla();
                Timer1.Enabled = true;


            }



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Terceros ter = (Terceros)Session["tercero"];
                cj.terceros_idterceros_reg_caj = Validar.validarsession(ter.idterceros);
                if (cj.AbrirCaja(cj))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "activarcajalert();", true);


                    cargarestado();
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalertCAJA();", true);
                    cargarestado();
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

            }
        }
        protected void cargartabla()
        {
            DataTable dt = cj.ConsultarCaja();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        public void cargarestado()
        {
            DataRow dt = Validar.Consulta(cj.ConsultarCaja()).Rows[0];

            if (dt["estado"].ToString() == "True")
            {
                Labelestado.Text = "ACTIVA";
                Labelestado.ForeColor = Color.Green;
            }
            else
            {
                if (dt["estado"].ToString() == "False")
                {
                    Labelestado.Text = "CERRADA";
                    Labelestado.ForeColor = Color.Red;
                }
            }
            Labelingresos.Text = dt["ingresos"].ToString();
            Labelegresos.Text = dt["egresos"].ToString();

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (cj.CerrarCaja())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalert();", true);
                    cargarestado();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalertcerrado();", true);
                    cargarestado();
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            cargartabla();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = GridView1.SelectedRow;

            Response.Redirect("gestcaja.aspx?key=" + gridw.Cells[1].Text);
        }


        protected void Timer1_Load(object sender, EventArgs e)
        {
         
            Labeltime.Text = DateTime.Now.ToShortTimeString();
        }
    }
}