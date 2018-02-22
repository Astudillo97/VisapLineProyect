using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
using VisapLine.Exeption;
namespace VisapLine.View.Private
{


    public partial class Incidencia : System.Web.UI.Page
    {

        CategoriaIncidencia cinci = new CategoriaIncidencia();
        TipoIncidencia tpin = new TipoIncidencia();
        Servicios serv = new Servicios();
        Terceros terc = new Terceros();
        Incidencias inci = new Incidencias();
        Contrato contr = new Contrato();
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                if (!IsPostBack)
                {

                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }


        }

        protected void ButtonGuardar_Click(object sender, EventArgs e)
        {

            try
            {

                Terceros ter = (Terceros)Session["tercero"];
                inci.estado = Validar.validarselected(DropDownListestadoinc.Text);
                inci.detalle = Validar.validarlleno(TextArea1detalle.Value.ToUpper());
                inci.terceros_idterceros = Validar.validarlleno(ter.idterceros);
                inci.servicios_idservicios = Validar.validarlleno(idservicio.Text);
                inci.tipoincidencia_idtipoincidencia = Validar.validarselected(DropDownList2.SelectedValue);

                if (inci.RegistrarInsidencias(inci))
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                    divincidencia.Visible = false;
                    iddatosterceros.Visible = false;
                    TextBoxdni.Text = "";
                    //TextBoxcodcontra.Text = "";
                    DropDownListestadoinc.Text = "Seleccione";
                    TextArea1detalle.Value = "";


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                }


            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

            }




        }


        protected void Buttonbuscarcodg_Click(object sender, EventArgs e)
        {


            ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", " alrt();", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = GridView1.SelectedRow;
            idservicio.Text = gridw.Cells[1].Text;
            divincidencia.Visible = true;



        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add(new ListItem("Seleccione", "Seleccione"));
                tpin.categoriaincidencia_idcategoriaindencia = Validar.validarselected(DropDownList3.SelectedValue);
                DropDownList2.DataSource = Validar.Consulta(tpin.Consultartipoincidencia(tpin));
                DropDownList2.DataTextField = "tipoincidencia";
                DropDownList2.DataValueField = "idtipoincidencia";
                DropDownList2.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {



            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {

                terc.identificacion = TextBoxdni.Text;
                DataRow te = Validar.Consulta(terc.ConsultarTerceroDos(terc)).Rows[0];
                contr.terceros_idterceros = te["idterceros"].ToString();
                DataRow cont = Validar.Consulta(contr.ConsultarContratoIdTercero(contr)).Rows[0];

                DataTable dat = Validar.Consulta(serv.consultaservicioscont1(cont["idcontrato"].ToString()));


                GridView1.DataSource = dat;
                GridView1.DataBind();
                divtablagestcontr.Visible = true;

                Label1.Text = te["nombre"].ToString();

                if (te["apellido"].ToString() == "")
                {
                    Label2.Visible = false;
                }
                else
                {
                    Label2.Text = te["apellido"].ToString();
                }
                TextBox1.Text = te["direccion"].ToString();
                iddatosterceros.Visible = true;
                try
                {
                    DropDownList3.DataSource = cinci.Consultarcategoriaincidencia();
                    DropDownList3.DataTextField = "categoriaincidencia";
                    DropDownList3.DataValueField = "idcategoriaincidencia";
                    DropDownList3.DataBind();
                }
                catch (Exception ex)
                {
                    textError.InnerHtml = ex.Message;
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