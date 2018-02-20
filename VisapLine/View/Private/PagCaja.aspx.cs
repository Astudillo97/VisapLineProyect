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
        int valoringre, valoregre, valorini, valoractualcaja;
        Caja cj = new Caja();
        Permisos per = new Permisos();

        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            DataTable se= (DataTable)Session["roles"];
            if (per.ValidarPermisos(url, se))
            {
                if (!IsPostBack)
                {
                    Labeltime.Text = DateTime.Now.ToLongDateString();
                    try
                    {
                        DataRow dt = Validar.Consulta(cj.ConsultarCaja()).Rows[0];
                        cargarestado();
                        cargartabla();
                    }
                    catch (Exception)
                    {

                    }
                }
                else
                {
                    Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
                }



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
                    cargartabla();
                    cargarestado();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalertCAJA();", true);
                    cargarestado();
                    cargartabla();
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
            Labelvalorinicial.Text = dt["valorinicial"].ToString();

            valoringre = Convert.ToInt32(Labelingresos.Text);
            valoregre = Convert.ToInt32(Labelegresos.Text);
            valorini = Convert.ToInt32(Labelvalorinicial.Text);
            if (valorini > 0)
            {
                Labelvalorinicial.ForeColor = Color.Green;
            }
            else
            {
                Labelvalorinicial.ForeColor = Color.Red;
            }

            valoractualcaja = (valoringre + valorini) - valoregre;
            if (valoractualcaja > 0)
            {
                Labelvaloractual.Text = valoractualcaja.ToString();
                Labelvaloractual.ForeColor = Color.Green;
            }
            else
            {
                Labelvaloractual.Text = valoractualcaja.ToString();
                Labelvaloractual.ForeColor = Color.Red;

            }



        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (cj.CerrarCaja())
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalert();", true);
                    cargarestado();
                    cargartabla();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalertcerrado();", true);
                    cargarestado();
                    cargartabla();
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



    }
}