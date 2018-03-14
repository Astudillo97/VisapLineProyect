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
        Permisos per = new Permisos();
        class_pdf pdf = new class_pdf();
        Empresa emp = new Empresa();
        private static DataTable necesidad;
        protected void Page_Load(object sender, EventArgs e)
        {

            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
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
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }



        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = GridView2.SelectedRow;
            Labelidincidencia.Text = gridw.Cells[2].Text;
            Labelidincidencia.Visible = true;
            DataRow indat = inci.ConsultarIncidencias(Labelidincidencia.Text).Rows[0];
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

                if (inci.updatesolucionincidencia(inci))
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
            catch (Exception)
            {

                throw;
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

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("imprimir")) {
                Labelidincidencia.Text = e.CommandArgument.ToString();
                Labelidincidencia.Visible = true;
                DataRow indat = inci.ConsultarIncidencias(Labelidincidencia.Text).Rows[0];
                DataRow ser = serv.consultaserviciosid(indat["servicios_idservicios"].ToString()).Rows[0];
                cont.idcontrato = ser["contrato_idcontrato"].ToString();
                DataRow estratomegas = cont.estratoymegas(int.Parse(cont.idcontrato)).Rows[0];
                DataRow con = cont.ConsultarContratoidcontrato(cont).Rows[0];
                terc.idterceros = con["terceros_idterceros_cont"].ToString();
                DataRow ter = terc.ConsultarTercerosId(terc).Rows[0];
                OrdenSalida ord = new OrdenSalida();
                DataRow telefono = ord.cosnutlarlefonosorden(""+terc.idterceros).Rows[0];
                ScriptManager.RegisterStartupScript(this, typeof(Page), "pop", "swal({title:'INCIDENCIA # " + Labelidincidencia.Text + "',text:'CLIENTE : " + ter["nombre"].ToString() + " " + ter["apellido"].ToString()+" DIRECCION : "+ ter["direccion"].ToString() + " DETALLE : "+ indat["detalle"].ToString() + " TELEFONO : "+telefono["telefono"].ToString()+" PLAN : "+ estratomegas[2].ToString() +" "+ estratomegas[0].ToString() + "MB',type:'warning'},function(){window.print();})", true);
            }
        }
    }
}