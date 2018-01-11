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
        TipoTercero ttr = new TipoTercero();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();
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
                divcorporacion.Visible = false;
                divempresa.Visible = true;

            }
            else
            {
                if (tipotercero.SelectedItem.Text == "Natural")
                {
                    divcorporacion.Visible = false;
                    iddivnatural.Visible = true;
                    divempresa.Visible =false;
                }
                else
                {
                    if (tipotercero.SelectedItem.Text == "Corporativo")
                    {
                        divempresa.Visible = false;
                        divcorporacion.Visible = true;
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
            if (DropDownListestrato.SelectedItem.Text== "Estrato 1" || DropDownListestrato.SelectedItem.Text == "Estrato 2" )
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
    }
}