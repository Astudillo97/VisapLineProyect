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

                    tablabarrios();
                    tablazonas();

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

            try
            {
                barr.barrios = Validar.validarlleno(TextBox1.Text.ToUpper());
                barr.muninicio_idmunicipio = Validar.validarselected(municipiobarrio.SelectedValue);
                barr.zona_idzona = Validar.validarselected(zonabarrio.SelectedValue);



                if (barr.RegistrarBarrios(barr))
                {
                    paisbarrio.SelectedValue = "Seleccione";
                    departamentobarrio.Items.Clear();
                    municipiobarrio.Items.Clear();
                    zonabarrio.Items.Clear();
                    TextBox1.Text = "";
                    tablabarrios();
                    ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                }
                else
                {
                    TextBox1.Text = "";
                    paisbarrio.SelectedValue = "Seleccione";
                    departamentobarrio.Items.Clear();
                    municipiobarrio.Items.Clear();
                    zonabarrio.Items.Clear();
                    TextBox1.Text = "";
                    ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
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
            try
            {
                zn.municipio_idmunicipio = Validar.validarselected(municipiozona.SelectedValue);
                zn.zona = Validar.validarlleno(TextBox2.Text.ToUpper());

                if (zn.RegistrarZona(zn))
                {

                    paiszona.SelectedValue = "Seleccione";
                    departamentozona.Items.Clear();
                    municipiozona.Items.Clear();
                    TextBox2.Text = "";
                    tablazonas();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", " alerterror();", true);
                    paiszona.SelectedValue = "Seleccione";
                    departamentozona.Items.Clear();
                    municipiozona.Items.Clear();
                    TextBox2.Text = "";
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }
        }



        protected void tablabarrios()
        {
            try
            {
                DataTable dt = barr.ConsultarbarriosAll();
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void tablazonas()
        {
            try
            {
                DataTable d = zn.ConsultarzonasAll();
                GridView1.DataSource = d;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }


        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            tablabarrios();
            ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);

        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "borrar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    barr.eliminar(int.Parse(DeleteRowId));
                    //Call Procedure here to delete row       
                    tablabarrios();
                    ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalert();", true);
                    
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "borrar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    zn.eliminar(int.Parse(DeleteRowId));
                    //Call Procedure here to delete row
                    tablazonas();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalert();", true);


                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            tablazonas();
        }
    }
}