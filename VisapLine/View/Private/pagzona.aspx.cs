using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class pagzona : System.Web.UI.Page
    {
        Barrios barr = new Barrios();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Zonas zn = new Zonas();

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (!IsPostBack)
                {
                    paisbarrio.DataSource = pais.ConsultarPais();
                    paisbarrio.DataTextField = "pais";
                    paisbarrio.DataValueField = "idpais";
                    paisbarrio.DataBind();


                    paiszona.DataSource = pais.ConsultarPais();
                    paiszona.DataTextField = "pais";
                    paiszona.DataValueField = "idpais";
                    paiszona.DataBind();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }


        }

        protected void paisbarrio_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                
                departamentobarrio.Items.Clear();
                departamentobarrio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(paisbarrio.SelectedValue);
                departamentobarrio.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                departamentobarrio.DataTextField = "departamento";
                departamentobarrio.DataValueField = "iddepartamento";
                departamentobarrio.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            }

   



        }

        protected void departamentobarrio_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                municipiobarrio.Items.Clear();
                municipiobarrio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(departamentobarrio.SelectedValue);
                municipiobarrio.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                municipiobarrio.DataTextField = "municipio";
                municipiobarrio.DataValueField = "idmunicipio";
                municipiobarrio.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            }
        }

        protected void municipiobarrio_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                zonabarrio.Items.Clear();
                zonabarrio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                zn.municipio_idmunicipio = Validar.validarselected(municipiobarrio.SelectedValue);
                zonabarrio.DataSource = Validar.Consulta(zn.ConsultarZonaIdMunicipio(zn));
                zonabarrio.DataTextField = "zonas";
                zonabarrio.DataValueField = "idzonas";
                zonabarrio.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            }
        }

        protected void zonabarrio_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
        }

        protected void BtnGuardarbarrio_Click(object sender, EventArgs e)
        {
            barr.barrios= TextBox1.Text.ToUpper();
            barr.muninicio_idmunicipio = municipiobarrio.SelectedValue;
            barr.zona_idzona = zonabarrio.SelectedValue;



            if (barr.RegistrarBarrios(barr))
            {

                textError.InnerHtml = "Se ha Registrado correctamente";
                Alerta.CssClass = "alert alert-success";
                Alerta.Visible = true;
               
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);

                paisbarrio.SelectedValue="Seleccione";
                departamentobarrio.Items.Clear();
                municipiobarrio.Items.Clear();
                zonabarrio.Items.Clear();
                TextBox1.Text = "";

            }
            else
            {
                textError.InnerHtml = "No se registro";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                TextBox1.Text = "";
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);

                paisbarrio.SelectedValue = "Seleccione";
                departamentobarrio.Items.Clear();
                municipiobarrio.Items.Clear();
                zonabarrio.Items.Clear();
                TextBox1.Text = "";
            }



         

        }

        protected void paiszona_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                departamentozona.Items.Clear();
                departamentozona.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(paiszona.SelectedValue);
                departamentozona.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                departamentozona.DataTextField = "departamento";
                departamentozona.DataValueField = "iddepartamento";
                departamentozona.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void departamentozona_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                municipiozona.Items.Clear();
                municipiozona.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(departamentozona.SelectedValue);
                municipiozona.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                municipiozona.DataTextField = "municipio";
                municipiozona.DataValueField = "idmunicipio";
                municipiozona.DataBind();

                

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void municipiozona_SelectedIndexChanged(object sender, EventArgs e)
        {

           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
            zn.municipio_idmunicipio = municipiozona.SelectedValue;
            zn.zona = TextBox2.Text.ToUpper();

            if (zn.RegistrarZona(zn))
            {
                textError.InnerHtml = "Se ha Registrado correctamente";
                Alerta.CssClass = "alert alert-success";
                Alerta.Visible = true;
                paiszona.SelectedValue = "Seleccione";
                departamentozona.Items.Clear();
                municipiozona.Items.Clear();
                TextBox1.Text = "";
                
            }
            else
            {
                textError.InnerHtml = "No se registro";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            
                paiszona.SelectedValue = "Seleccione";
                departamentozona.Items.Clear();
                municipiozona.Items.Clear();
                TextBox1.Text = "";
            }


           
        }
    }
}