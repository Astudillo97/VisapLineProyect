﻿using System;
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
        static DataTable listtelefono = new DataTable();
        public static bool activacion = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    listtelefono.Rows.Clear();
                    listtelefono.Dispose();
                    telefonos.Dispose();
                    listtelefono.Columns.Clear();
                    listtelefono.Columns.Add("idtelefono");
                    listtelefono.Columns.Add("telefono");

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

                    CargarTelefono();
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                cargarDepartamentos(Validar.validarselected(pais_.SelectedValue));
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }

        }

        private void cargarDepartamentos(string dat)
        {
            try
            {
                departamento_.Items.Clear();
                departamento_.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = dat;
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                cargarMunicipios(Validar.validarselected(departamento_.SelectedValue));
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }
        private void cargarMunicipios(string dat)
        {
            try
            {
                municipio_.Items.Clear();
                municipio_.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = dat;
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                cargarBarrios(Validar.validarselected(municipio_.SelectedValue));
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }

        private void cargarBarrios(string dat)
        {
            try
            {
                barrio_.Items.Clear();
                barrio_.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = dat;
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                if (activacion)//si es true se activa la actualizacion de lo contrario solo registra
                {
                    terc.idterceros = codigo.InnerHtml;
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
                    terc.fechanatcimiento = Validar.validarlleno(fecnac_.Value);
                    if (terc.ActualizarTercero(terc))
                    {
                        terc.identificacion = identificacion_.Value;
                        DataRow dat = terc.ConsultarPersonaIdentifall(terc).Rows[0];
                        codigo.InnerHtml = dat["idterceros"].ToString();
                        textError.InnerHtml = "Actualizado correctamente";
                        Alerta.CssClass = "alert alert-success";
                        Alerta.Visible = true;
                    }
                    else
                    {
                        textError.InnerHtml = "Error al Actualizar";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                    }
                }
                else
                {
                    terc.identificacion = Validar.validarnumero(identificacion_.Value);
                    if (terc.ConsultarPersonaIdentifall(terc).Rows.Count > 0)
                    {
                        textError.InnerHtml = "El usuario ya se encuentra registrado";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                    }
                    else
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
                        terc.fechanatcimiento = Validar.validarlleno(fecnac_.Value);
                        if (terc.RegistrarTerceros(terc))
                        {
                            foreach (DataRow item in listtelefono.Rows)
                            {
                                tlf.telefono = item["telefono"].ToString();
                                tlf.terceros_idterceros = terc.identificacion;
                                tlf.RegistrarTelefono(tlf);
                            }
                            textError.InnerHtml = "Se ha registrado con exito";
                            Alerta.CssClass = "alert alert-success";
                            Alerta.Visible = true;
                        }
                        else
                        {
                            textError.InnerHtml = "Error al registrar el usuario";
                            Alerta.CssClass = "alert alert-error";
                            Alerta.Visible = true;
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            }
        }

        protected void telefonos_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                TableCell cell = telefonos.Rows[e.RowIndex].Cells[0];
                listtelefono.Rows.Remove(listtelefono.Rows[e.RowIndex]);
                CargarTelefono();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void CargarTelefono()
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                telefonos.DataSource = listtelefono;
                telefonos.DataBind();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarTelefono(object sender, EventArgs e)
        {
            try
            {
                DataRow dat = listtelefono.NewRow();
                dat["idtelefono"] = listtelefono.Rows.Count+1;
                dat["telefono"] = Validar.validarnumero(telefono_.Value);
                listtelefono.Rows.Add(dat);
                CargarTelefono();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void ConsultarIdentif(object sender, EventArgs e)
        {
            try
            {
                terc.identificacion = Validar.validarnumero(identif_.Value);
                tablacliente.DataSource = Validar.Consulta(terc.ConsultarPersonaIdentifall(terc));
                tablacliente.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void tablacliente_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "ver")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    //pendiete para la vista de contratos
                }
                if (e.CommandName.ToString() == "Editar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    terc.identificacion = DeleteRowId;
                    DataRow dat = terc.ConsultarPersonaIdentifall(terc).Rows[0];
                    barr.idbarrios = dat["barrios_idbarrios"].ToString();
                    DataRow dir = barr.ConsultarTodoporBarrio(barr).Rows[0];
                    cargarDepartamentos(dir["idpais"].ToString());
                    pais_.SelectedValue = dir["idpais"].ToString();
                    departamento_.SelectedValue = dir["iddepartamento"].ToString();
                    cargarMunicipios(dir["iddepartamento"].ToString());
                    municipio_.SelectedValue = dir["idmunicipio"].ToString();
                    cargarBarrios(dir["idmunicipio"].ToString());
                    viewedicion.Visible = true;
                    textediccion.InnerHtml = "Edicción habilitada para " + dat["nombre"].ToString() + " " + dat["apelldio"].ToString();
                    codigo.InnerHtml = dat["idterceros"].ToString();
                    identificacion_.Value = dat["identificacion"].ToString();
                    nombre_.Value = dat["nombre"].ToString();
                    apellido_.Value = dat["apelldio"].ToString();
                    Direccion_.Value = dat["direccion"].ToString();
                    correo_.Value = dat["correo"].ToString();
                    estrato_.SelectedValue = dat["estrato"].ToString();
                    estado_.SelectedValue = dat["estado"].ToString();
                    tipotercero_.SelectedValue = dat["tipotercero_idtipotercero"].ToString();
                    tipodoc_.SelectedValue = dat["tipodoc_idtipodoc"].ToString();
                    tiporesident_.SelectedValue = dat["tiporesidencia_idtiporesidencia"].ToString();
                    tipofact_.SelectedValue = dat["tipofactura_idtipofactura"].ToString();
                    barrio_.SelectedValue = dat["barrios_idbarrios"].ToString();
                    fecnac_.Value = Convert.ToDateTime(dat["fechanatcimiento"]).ToString("yyyy-MM-dd");
                    ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
                    activacion = true;

                }
                if (e.CommandName.ToString() == "Eliminar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();

                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void tablacliente_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[9].Text == "Activo")
                {
                    e.Row.Cells[9].Text = "";
                    e.Row.Cells[9].CssClass = "glyphicon glyphicon-ok";
                }
                else
                {
                    e.Row.Cells[9].CssClass = "glyphicon glyphicon-remove";
                }
                if (e.Row.Cells[3].Text == "Natural")
                {
                    e.Row.Cells[3].Text = "";
                    e.Row.Cells[3].CssClass = "glyphicon glyphicon-user";
                }
                else
                {
                    e.Row.Cells[3].CssClass = "glyphicon glyphicon-object-align-bottom";
                }
                e.Row.Cells[11].Text = Convert.ToDateTime(e.Row.Cells[11].Text).ToString("dd/MM/yyyy");
            }
        }

        protected void CancelarTercero(object sender, EventArgs e)
        {
            activacion = false;
            viewedicion.Visible = false;
            textediccion.InnerHtml = "";
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            codigo.InnerHtml = "";
        }
    }
}