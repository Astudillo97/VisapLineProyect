using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Web.Services;
using System.Web.Script.Serialization;

namespace VisapLine.View.Private
{
    public partial class GestTercero : System.Web.UI.Page
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
        public DataTable tablacliente = new DataTable();
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
                    pais_.SelectedValue = "1";
                    cargarDepartamentos(pais_.SelectedValue);
                    departamento_.SelectedValue = "2";
                    cargarMunicipios(departamento_.SelectedValue);
                    municipio_.SelectedValue = "1";
                    cargarBarrios(municipio_.SelectedValue);

                    string codig = Convert.ToString(Request.QueryString["codigo"]);
                    if (codig != null)
                    {
                        cargarActualizar(codig);
                    }

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
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        public void cargarActualizar(string ent)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                terc.identificacion = ent;
                DataRow dat = terc.ConsultarPersonaIdentifall(terc).Rows[0];
                identificacion_.Value = dat["identificacion"].ToString();
                nombre_.Value = dat["nombre"].ToString();
                apellido_.Value = dat["apellido"].ToString();
                Direccion_.Value = dat["direccion"].ToString();
                correo_.Value = dat["correo"].ToString();
                estrato_.SelectedValue = dat["estrato"].ToString();
                estado_.SelectedValue = dat["estado"].ToString();
                tipotercero_.SelectedValue = dat["tipotercero_idtipotercero"].ToString();
                tipodoc_.SelectedValue = dat["tipodoc_idtipodoc"].ToString();
                tiporesident_.SelectedValue = dat["tiporesidencia_idtiporesidencia"].ToString();
                tipofact_.SelectedValue = dat["tipofactura_idtipofactura"].ToString();
                barrio_.SelectedValue = dat["barrio_idbarrio"].ToString();
                fecnac_.Value = Convert.ToDateTime(dat["fechnac"]).ToString("yyyy-MM-dd");

                activacion = true;

                viewedicion.Visible = true;
                textediccion.InnerHtml = "Edicción habilitada para " + dat["nombre"].ToString() + " " + dat["apellido"].ToString();
                codigo.InnerHtml = dat["idterceros"].ToString();

                barr.idbarrios = dat["barrio_idbarrio"].ToString();
                DataRow dir = barr.ConsultarTodoporBarrio(barr).Rows[0];
                cargarDepartamentos(dir["idpais"].ToString());
                pais_.SelectedValue = dir["idpais"].ToString();
                departamento_.SelectedValue = dir["iddepartamento"].ToString();
                cargarMunicipios(dir["iddepartamento"].ToString());
                municipio_.SelectedValue = dir["idmunicipio"].ToString();
                cargarBarrios(dir["idmunicipio"].ToString());
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        public void Limpiar()
        {
            identificacion_.Value = "";
            nombre_.Value = "";
            apellido_.Value = "";
            Direccion_.Value = "";
            correo_.Value = "";
            estrato_.SelectedValue = "Seleccione";
            estado_.SelectedValue = "Seleccione";
            tipotercero_.SelectedValue = "Seleccione";
            tipodoc_.SelectedValue = "Seleccione";
            tiporesident_.SelectedValue = "Seleccione";
            tipofact_.SelectedValue = "Seleccione";
            barrio_.SelectedValue = "Seleccione";
            fecnac_.Value = "";
            listtelefono.Dispose();
            listtelefono.Rows.Clear();
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
                Alerta.CssClass = " alert alert-error";
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
                Alerta.CssClass = "alert alert-error";
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
                Alerta.CssClass = "alert alert-error";
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
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarTercero(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
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
                        foreach (DataRow item in listtelefono.Rows)
                        {
                            tlf.telefono = item["telefono"].ToString();
                            tlf.terceros_idterceros = terc.identificacion;
                            tlf.RegistrarTelefono(tlf);
                        }

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
                        Validar.validartelefono(listtelefono);
                        if (terc.RegistrarTerceroGeneral(terc))
                        {
                            foreach (DataRow item in listtelefono.Rows)
                            {
                                tlf.telefono = item["telefono"].ToString();
                                tlf.terceros_idterceros = terc.identificacion;
                                tlf.RegistrarTelefono(tlf);
                            }
                            Limpiar();
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
            try
            {
                telefonos.DataSource = listtelefono;
                telefonos.DataBind();
                telefono_.Value = "";
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                DataRow dat = listtelefono.NewRow();
                dat["idtelefono"] = listtelefono.Rows.Count + 1;
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
                tablacliente = Validar.Consulta(terc.ConsultarPersonaIdentifall(terc));
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void CancelarTercero(object sender, EventArgs e)
        {
            activacion = false;
            viewedicion.Visible = false;
            textediccion.InnerHtml = "";
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            codigo.InnerHtml = "";
            Limpiar();
            telefono_.Value = "";
        }
    }
}