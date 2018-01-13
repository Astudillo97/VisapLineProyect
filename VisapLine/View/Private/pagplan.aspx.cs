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

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {

                    cargartabla();
                    departamentoplan.DataSource = depto.ConsultarDepartamento();
                    departamentoplan.DataTextField = "departamento";
                    departamentoplan.DataValueField = "iddepartamento";
                    departamentoplan.DataBind();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }
        protected void departamentoplan_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                municipioplan.Items.Clear();
                municipioplan.Items.Add(new ListItem("Seleccione", "Seleccione"));
                mpio.departamento_iddepartamento = Validar.validarselected(departamentoplan.SelectedValue);
                municipioplan.DataSource = Validar.Consulta(mpio.ConsultarMunicipioIdDepartamento(mpio));
                municipioplan.DataTextField = "municipio";
                municipioplan.DataValueField = "idmunicipio";
                municipioplan.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }
        }
        protected void municipioplan_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                zonaplan.Items.Clear();
                zonaplan.Items.Add(new ListItem("Seleccione", "Seleccione"));
                zn.municipio_idmunicipio = Validar.validarselected(municipioplan.SelectedValue);
                zonaplan.DataSource = Validar.Consulta(zn.ConsultarZonaIdMunicipio(zn));
                zonaplan.DataTextField = "zonas";
                zonaplan.DataValueField = "idzonas";
                zonaplan.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }



        }

        protected void zonaplan_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

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
                        pn.detalle = Validar.validarlleno(texareadetalle.Value);
                        pn.telefonia = CheckBox2.Checked.ToString();
                        pn.televicion = CheckBox3.Checked.ToString();
                        pn.internet = CheckBox1.Checked.ToString();
                        pn.estado = Validar.validarselected(DropDownList2.SelectedValue);
                        pn.tipoplan = Validar.validarselected(DropDownList1.SelectedValue);
                        pn.subida = Validar.validarlleno(TextBox2.Text);
                        pn.bajada = Validar.validarlleno(TextBox3.Text);
                        pn.zona_idzona = Validar.validarselected(municipioplan.SelectedValue);
                        pn.medioconexion= Validar.validarselected(DropDownListmedioconexion.SelectedValue);
                        pn.wifi= CheckBox5.Checked.ToString();

                        if (pn.RegistrarPlan(pn))
                        {
                            textError.InnerHtml = "Se ha Registrado correctamente";
                            Alerta.CssClass = "alert alert-success";
                            Alerta.Visible = true;
                            cargartabla();
                            TextBox1.Text = "";
                            texareadetalle.Value = "";
                            CheckBox1.Checked = false;
                            CheckBox2.Checked = false;
                            CheckBox3.Checked = false;
                            departamentoplan.SelectedValue = "Seleccione";
                            municipioplan.Items.Clear();
                            zonaplan.Items.Clear();
                            CheckBox5.Checked = false;
                            DropDownListmedioconexion.SelectedValue = "Seleccione";


                        }
                        else
                        {
                            textError.InnerHtml = "No se pudo realizar la operacion";
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
            DataTable dt = pn.ConsultarPlan();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
        
    }
}