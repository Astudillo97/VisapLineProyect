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
    public partial class pagplan : System.Web.UI.Page
    {

        Plan pn = new Plan();
        Zonas zn = new Zonas();
        Departamento depto = new Departamento();
        Municipio mpio = new Municipio();
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
                if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
                {
                    if (!IsPostBack)
                {

                    cargartabla();
                 
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
   


    

       

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                if (DropDownList1.Text == "Seleccionar")
                {
                    textError.InnerHtml = "Por favor seleccionar";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
                else
                {
                    try
                    {
                        Validar.validartrue(validarcheck());
                        pn.valor = Validar.validarlleno(TextBox1.Text);
                        pn.detalle = Validar.validarlleno(texareadetalle.Value.ToUpper());
                        pn.telefonia = CheckBox2.Checked.ToString();
                        pn.televicion = CheckBox3.Checked.ToString();
                        pn.internet = CheckBox1.Checked.ToString();
                        pn.estado = Validar.validarselected(DropDownList2.SelectedValue);
                        pn.tipoplan = Validar.validarselected(DropDownList1.SelectedValue);
                        pn.subida = Validar.validarlleno(TextBox2.Text);
                        pn.bajada = Validar.validarlleno(TextBox3.Text);
 


                        if (pn.RegistrarPlan(pn))
                        {
                            TextBox1.Text = "";
                            texareadetalle.Value = "";
                            CheckBox1.Checked = false;
                            CheckBox2.Checked = false;
                            CheckBox3.Checked = false;
                            DropDownList1.SelectedValue = "Seleccione";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            DropDownList2.SelectedValue = "Seleccione";
                            cargartabla();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                        }
                        else
                        {
                            cargartabla();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
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
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }

        }

        protected bool validarcheck()
        {

            if (CheckBox1.Checked || CheckBox2.Checked || CheckBox3.Checked)
            {
                return true;
            }
            else
            {
                textError.InnerHtml = "Por favor seleccionar un servicio";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                return false;
            }

        }
        protected void cargartabla()
        {
            try { 
            repeteidordeinventario.DataSource = pn.ConsultarPlan();
            repeteidordeinventario.DataBind();

            DataTable dt = pn.ConsultarPlan();         
            }
            catch (Exception)
            {

            }
        }

    }
}