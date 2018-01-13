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
        Telefono tlf = new Telefono();
        static DataTable listtelefono = new DataTable();
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

                    listtelefono.Rows.Clear();
                    listtelefono.Dispose();
                    telefonos.Dispose();
                    listtelefono.Columns.Clear();
                    listtelefono.Columns.Add("idtelefono");
                    listtelefono.Columns.Add("telefono");

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

                    //CORPORACION

                    DropDownList1tipodocucorpo.DataSource = tpdoc.ConsultarTipoDoc();
                    DropDownList1tipodocucorpo.DataTextField = "tipodoc";
                    DropDownList1tipodocucorpo.DataValueField = "idtipodoc";
                    DropDownList1tipodocucorpo.DataBind();

                    DropDownListresidenciacorpo.DataSource = tpres.ConsultarTipoResidencia();
                    DropDownListresidenciacorpo.DataTextField = "tiporesidencia";
                    DropDownListresidenciacorpo.DataValueField = "idtiporesidencia";
                    DropDownListresidenciacorpo.DataBind();

                    DropDownList3tipofactucorpo.DataSource = tpfact.ConsultarTipoFactura();
                    DropDownList3tipofactucorpo.DataTextField = "tipofactura";
                    DropDownList3tipofactucorpo.DataValueField = "idtipofactura";
                    DropDownList3tipofactucorpo.DataBind();

                    DropDownList4paiscorpo.DataSource = pais.ConsultarPais();
                    DropDownList4paiscorpo.DataTextField = "pais";
                    DropDownList4paiscorpo.DataValueField = "idpais";
                    DropDownList4paiscorpo.DataBind();


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


        protected void cargarivanatural()
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
            cargarivanatural();
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
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownListmunicipio.SelectedValue);
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
                    Alerta.CssClass = "alert alert-success";
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
        protected void telefonos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
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

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        protected void textboxtelefonoplus_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow dat = listtelefono.NewRow();
                dat["idtelefono"] = listtelefono.Rows.Count + 1;
                dat["telefono"] = Validar.validarnumero(TextBoxtelefononatu.Text);
                listtelefono.Rows.Add(dat);
                CargarTelefono();
                TextBoxtelefononatu.Text = "";
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
                terc.identificacion = Validar.validarlleno(TextBox1identificacion.Text);
                terc.direccion = Validar.validarlleno(TextBoxdireccion.Text);
                terc.tipodoc_idtipodoc = Validar.validarselected(DropDownListtipodocu.SelectedValue);
                terc.tipofactura_idtipofactura = Validar.validarselected(DropDownList2.SelectedValue);
                terc.nombre = Validar.validarlleno(TextBoxnombre.Text);
                terc.apellido = Validar.validarlleno(TextBox1apellido.Text);
                terc.fechanatcimiento = Validar.validarlleno(TextBox1fecnac.Text);
                terc.correo = Validar.validarlleno(TextBoxcorreo.Text);
                terc.barrios_idbarrios = Validar.validarselected(DropDownListbarrio.SelectedValue);
                terc.tiporesidencia_idtiporesidencia = Validar.validarselected(DropDownListtiporesi.SelectedValue);
                terc.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);
                terc.estrato = Validar.validarselected(DropDownListestrato.SelectedValue);
                terc.estado = Validar.validarselected(DropDownListestado.SelectedValue);



                if (terc.RegistrarTerceros(terc))
                {
                    foreach (DataRow item in listtelefono.Rows)
                    {
                        if (listtelefono.Rows.Count > 0)
                        {
                            tlf.telefono = item["telefono"].ToString();
                            tlf.terceros_idterceros = terc.identificacion;
                            tlf.RegistrarTelefono(tlf);

                        }
                        else
                        {
                            textError.InnerHtml = "Por favor agregue el telefono a la lista";
                            Alerta.CssClass = "alert alert-error";
                            Alerta.Visible = true;
                        }
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
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }





        }




        //---CORPORATIVO

        protected void telefonocorpoRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
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


        protected void Buscarcorporativo_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList4paiscorpo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList5departcorpo.Items.Clear();
                DropDownList5departcorpo.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(DropDownList4paiscorpo.SelectedValue);
                DropDownList5departcorpo.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                DropDownList5departcorpo.DataTextField = "departamento";
                DropDownList5departcorpo.DataValueField = "iddepartamento";
                DropDownList5departcorpo.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }
        }

        protected void DropDownList5departcorpo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DropDownList6municorpo.Items.Clear();
                DropDownList6municorpo.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(DropDownList5departcorpo.SelectedValue);
                DropDownList6municorpo.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                DropDownList6municorpo.DataTextField = "municipio";
                DropDownList6municorpo.DataValueField = "idmunicipio";
                DropDownList6municorpo.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }

        protected void DropDownList6municorpo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList7barricorpo.Items.Clear();
                DropDownList7barricorpo.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownList6municorpo.SelectedValue);
                DropDownList7barricorpo.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownList7barricorpo.DataTextField = "barrios";
                DropDownList7barricorpo.DataValueField = "idbarrios";
                DropDownList7barricorpo.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void DropDownListestratocorpo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListestratocorpo.SelectedItem.Text == "Estrato 1" || DropDownListestratocorpo.SelectedItem.Text == "Estrato 2")
            {
                TextBoxivacorpo.Text = "0";

            }
            else
            {
                if (DropDownListestratocorpo.SelectedItem.Text == "Estrato 3" || DropDownListestratocorpo.SelectedItem.Text == "Estrato 4" || DropDownListestratocorpo.SelectedItem.Text == "Estrato 5" || DropDownListestratocorpo.SelectedItem.Text == "Estrato 5")
                {
                    TextBoxivacorpo.Text = "0.16";
                }
            }
        }





    }
}






