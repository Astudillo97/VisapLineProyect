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
    public partial class Contratoterc : System.Web.UI.Page
    {
        Terceros terc = new Terceros();
        TipoTercero ttr = new TipoTercero();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();
        TipoFactura tpfact = new TipoFactura();
        TipoResidencia tpres = new TipoResidencia();
        TipoDoc tpdoc = new TipoDoc();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    tipotercero.DataSource = ttr.ConsultarTipoTercero();
                    tipotercero.DataTextField = "tipoterceros";
                    tipotercero.DataValueField = "idtipotercero";
                    tipotercero.DataBind();


                    DropDownListpais.DataSource = pais.ConsultarPais();
                    DropDownListpais.DataTextField = "pais";
                    DropDownListpais.DataValueField = "idpais";
                    DropDownListpais.DataBind();

                    DropDownList2.DataSource = tpfact.ConsultarTipoFactura();
                    DropDownList2.DataTextField = "tipofactura";
                    DropDownList2.DataValueField = "idtipofactura";
                    DropDownList2.DataBind();

                    DropDownListtiporesi.DataSource = tpres.ConsultarTipoResidencia();
                    DropDownListtiporesi.DataTextField = "tiporesidencia";
                    DropDownListtiporesi.DataValueField = "idtiporesidencia";
                    DropDownListtiporesi.DataBind();

                    DropDownListtipodocu.DataSource = tpdoc.ConsultarTipoDoc();
                    DropDownListtipodocu.DataTextField = "tipodoc";
                    DropDownListtipodocu.DataValueField = "idtipodoc";
                    DropDownListtipodocu.DataBind();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        protected void cargardiv()
        {
            if (tipotercero.SelectedItem.Text == "EMPRESARIAL")
            {
                iddivnatural.Visible = false;
                iddivcorporativo.Visible = false;
                iddivempresa.Visible = true;

            }
            else
            {
                if (tipotercero.SelectedItem.Text == "Natural")
                {
                    iddivcorporativo.Visible = false;
                    iddivnatural.Visible = true;
                    iddivempresa.Visible = false;
                }
                else
                {
                    if (tipotercero.SelectedItem.Text == "Corporativo")
                    {
                        iddivempresa.Visible = false;
                        iddivcorporativo.Visible = true;
                        iddivnatural.Visible = false;
                    }
                }
            }
        }





        protected void tipotercero_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargardiv();
        }


        protected void cargariva()
        {
            if (DropDownListestrato.SelectedItem.Text == "Estrato 1" || DropDownListestrato.SelectedItem.Text == "Estrato 2")
            {
                TextBoxiva.Text = "0";

            }
            else
            {
                if (DropDownListestrato.SelectedItem.Text == "Estrato 3" || DropDownListestrato.SelectedItem.Text == "Estrato 4" || DropDownListestrato.SelectedItem.Text == "Estrato 5" || DropDownListestrato.SelectedItem.Text == "Estrato 5")
                {
                    TextBoxiva.Text = "0.16";
                }
            }

        }

        protected void DropDownListestrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargariva();
        }

        protected void DropDownListpais_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                DropDownListdepartamento.Items.Clear();
                DropDownListdepartamento.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(DropDownListpais.SelectedValue);
                DropDownListdepartamento.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                DropDownListdepartamento.DataTextField = "departamento";
                DropDownListdepartamento.DataValueField = "iddepartamento";
                DropDownListdepartamento.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }

        }

        protected void DropDownListdepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DropDownListmunicipio.Items.Clear();
                DropDownListmunicipio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(DropDownListdepartamento.SelectedValue);
                DropDownListmunicipio.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                DropDownListmunicipio.DataTextField = "municipio";
                DropDownListmunicipio.DataValueField = "idmunicipio";
                DropDownListmunicipio.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;                
            }


        }
        protected void DropDownListmunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListbarrio.Items.Clear();
                DropDownListbarrio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio= Validar.validarselected(DropDownListmunicipio.SelectedValue);
                DropDownListbarrio.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarrio.DataTextField = "barrios";
                DropDownListbarrio.DataValueField = "idbarrios";
                DropDownListbarrio.DataBind();
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
                terc.identificacion = Validar.validarnumero(TextBox1identificacion.Text);


                if (terc.ConsultarPersonaIdentifall(terc).Rows.Count > 0)
                {
                    textError.InnerHtml = "El usuario ya se encuentra registrado";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true; 
                }
                else
                {
                    textError.InnerHtml = "El usuario no esta registrado";
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                 
                 Validar.validarnumero(TextBox1identificacion.Text);
                terc.identificacion= Validar.validarlleno(TextBox1identificacion.Text);
                terc.direccion= Validar.validarlleno(TextBoxdireccion.Text);
                terc.tipodoc_idtipodoc = Validar.validarselected(DropDownListtipodocu.SelectedValue);



            }
            catch (Exception)
            {

                throw;
            }
          




        }


        //---CORPORATIVO
        protected void Buscarcorporativo_Click(object sender, EventArgs e)
        {

        }

        
    }
}






