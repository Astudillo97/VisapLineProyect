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
    public partial class Cliente : System.Web.UI.Page
    {
        TipoTercero tpter = new TipoTercero();
        TipoFactura tpfact = new TipoFactura();
        TipoResidencia tpres = new TipoResidencia();
        TipoDoc tpdoc = new TipoDoc();
        Telefono tlf = new Telefono();
        Barrios barr = new Barrios();
        Terceros terc = new Terceros();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();


        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {


                    tipotercero_.DataSource = tpter.ConsultarTipoTercero();
                    tipotercero_.DataTextField = "tipoterceros";
                    tipotercero_.DataValueField = "idtipotercero";
                    tipotercero_.DataBind();

                    tipofact_.DataSource = tpfact.ConsultarTipoFactura();
                    tipofact_.DataTextField = "tipofactura";
                    tipofact_.DataValueField = "idtipofactura";
                    tipofact_.DataBind();

                    tiporesident_.DataSource = tpres.ConsultarTipoResidencia();
                    tiporesident_.DataTextField = "tiporesidencia";
                    tiporesident_.DataValueField = "idtiporesidencia";
                    tiporesident_.DataBind();

                    tipodoc_.DataSource = tpdoc.ConsultarTipoDoc();
                    tipodoc_.DataTextField = "tipodoc";
                    tipodoc_.DataValueField = "idtipodoc";
                    tipodoc_.DataBind();

                    pais_.DataSource = pais.ConsultarPais();
                    pais_.DataTextField = "pais";
                    pais_.DataValueField = "idpais";
                    pais_.DataBind();
                }

                Alerta.Visible = false;
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;

            }
        }

        protected void pais__SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                departamento_.Items.Clear();
                departamento_.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(pais_.SelectedValue);
                departamento_.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                departamento_.DataTextField = "departamento";
                departamento_.DataValueField = "iddepartamento";
                departamento_.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }

        protected void departamento__SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                municipio_.Items.Clear();
                municipio_.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(departamento_.SelectedValue);
                municipio_.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                municipio_.DataTextField = "municipio";
                municipio_.DataValueField = "idmunicipio";
                municipio_.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }

        protected void municipio__SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                barrio_.Items.Clear();
                barrio_.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(municipio_.SelectedValue);
                barrio_.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                barrio_.DataTextField = "barrios";
                barrio_.DataValueField = "idbarrios";
                barrio_.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarTercero(object sender, EventArgs e)
        {
            try
            {
                terc.identificacion = Validar.validarnumero(identificacion_.Value);
                terc.nombre = Validar.validarlleno(nombre_.Value);
                terc.apellido = apellido_.Value;
                terc.direccion = Validar.validarlleno(Direccion_.Value);
                terc.correo = Validar.validarlleno(correo_.Value);
                terc.estrato = Validar.validarselected(estrato_.SelectedValue);
                terc.estado = Validar.validarselected(estado_.SelectedValue);
                terc.tipotercero_idtipotercero = Validar.validarselected(tipotercero_.SelectedValue);
                terc.tipodoc_idtipodoc = Validar.validarselected(tipodoc_.SelectedValue);
                terc.tiporesidencia_idtiporesidencia = Validar.validarselected(tiporesident_.SelectedValue);
                terc.tipofactura_idtipofactura = Validar.validarselected(tipofact_.SelectedValue);
                terc.barrios_idbarrios = Validar.validarselected(barrio_.SelectedValue);
                terc.fechanatcimiento = Validar.validarlleno( fecnac_.Value);
                if (terc.RegistrarTerceros(terc))
                {
                    textError.InnerHtml = "Se ha registrado con exito";
                    Alerta.CssClass = "alert alert-success";
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