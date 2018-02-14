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
    public partial class RegistroTerceros : System.Web.UI.Page
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
        CargoTercero ctg = new CargoTercero();
        static DataTable listtelefono = new DataTable();
        static DataTable listtelefonocorpo = new DataTable();
        static DataTable listtelefonoempre = new DataTable();
        static DataTable listsucursalcorpo = new DataTable();
        static DataTable listsucursalempre = new DataTable();
        Plan pn = new Plan();
        TipoContrato tpoc = new TipoContrato();
        Sucursal scsal = new Sucursal();
        Contrato contrat = new Contrato();
        string idplancontr;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)

                {                   
                    string valor = Convert.ToString(Request.QueryString["key"]);
                    if (valor=="SI")
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                    }

                    tipotercero.DataSource = ttr.ConsultarTipoTercerofiltrado();
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




                    //CORPORATIVO
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


                    listtelefonocorpo.Rows.Clear();
                    listtelefonocorpo.Dispose();
                    GridViewtelefonocorpo.Dispose();
                    listtelefonocorpo.Columns.Clear();
                    listtelefonocorpo.Columns.Add("idtelefono");
                    listtelefonocorpo.Columns.Add("telefono");

                    listsucursalcorpo.Rows.Clear();
                    listsucursalcorpo.Dispose();
                    GridViewsucursalecorpo.Dispose();
                    listsucursalcorpo.Columns.Clear();
                    listsucursalcorpo.Columns.Add("idsucursal");
                    listsucursalcorpo.Columns.Add("nombre");
                    listsucursalcorpo.Columns.Add("descripcion");
                    listsucursalcorpo.Columns.Add("direccion");
                    listsucursalcorpo.Columns.Add("barrio");



                    //EMPRESARIAL
                    DropDownListtipodocumentoempresa.DataSource = tpdoc.ConsultarTipoDoc();
                    DropDownListtipodocumentoempresa.DataTextField = "tipodoc";
                    DropDownListtipodocumentoempresa.DataValueField = "idtipodoc";
                    DropDownListtipodocumentoempresa.DataBind();


                    DropDownListtiporeidenciaempresa.DataSource = tpres.ConsultarTipoResidencia();
                    DropDownListtiporeidenciaempresa.DataTextField = "tiporesidencia";
                    DropDownListtiporeidenciaempresa.DataValueField = "idtiporesidencia";
                    DropDownListtiporeidenciaempresa.DataBind();

                    DropDownListtipofacturaempresa.DataSource = tpfact.ConsultarTipoFactura();
                    DropDownListtipofacturaempresa.DataTextField = "tipofactura";
                    DropDownListtipofacturaempresa.DataValueField = "idtipofactura";
                    DropDownListtipofacturaempresa.DataBind();

                    DropDownListpaisempresa.DataSource = pais.ConsultarPais();
                    DropDownListpaisempresa.DataTextField = "pais";
                    DropDownListpaisempresa.DataValueField = "idpais";
                    DropDownListpaisempresa.DataBind();

                    listtelefonoempre.Rows.Clear();
                    listtelefonoempre.Dispose();
                    GridViewtelefonoempresa.Dispose();
                    listtelefonoempre.Columns.Clear();
                    listtelefonoempre.Columns.Add("idtelefono");
                    listtelefonoempre.Columns.Add("telefono");

                    listsucursalempre.Rows.Clear();
                    listsucursalempre.Dispose();
                    GridViewsucursalempre.Dispose();
                    listsucursalempre.Columns.Clear();
                    listsucursalempre.Columns.Add("idsucursal");
                    listsucursalempre.Columns.Add("nombre");
                    listsucursalempre.Columns.Add("descripcion");
                    listsucursalempre.Columns.Add("direccion");
                    listsucursalempre.Columns.Add("barrio");

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(texboxdni.Text)).Rows[0];
                if (datcont["nombre"].ToString() == "")
                {


                }
                else
                {

                    Response.Redirect("ContratoCliente.aspx?key=" + datcont["identificacion"].ToString());
                }

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
                tipopersona.Visible = true;

            }
        }

        protected void tipotercero_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargardiv();
        }

        protected void cargardiv()
        {
            if (tipotercero.SelectedItem.Text == "ESPECIAL")
            {
                iddivnatural.Visible = false;
                iddivcorporativo.Visible = false;
                iddivempresa.Visible = true;

            }
            else
            {
                if (tipotercero.SelectedItem.Text == "NATURAL")
                {
                    iddivcorporativo.Visible = false;
                    iddivnatural.Visible = true;
                    iddivempresa.Visible = false;
                }
                else
                {
                    if (tipotercero.SelectedItem.Text == "CORPORATIVO")
                    {

                        iddivcorporativo.Visible = true;
                        iddivnatural.Visible = false;
                        iddivempresa.Visible = false;
                    }
                }
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

        protected void telefonos_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {

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

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {

                Validar.validarnumero(texboxdni.Text);
                terc.identificacion = Validar.validarlleno(texboxdni.Text);
                terc.direccion = Validar.validarlleno(TextBoxdireccion.Text.ToUpper());
                terc.tipodoc_idtipodoc = Validar.validarselected(DropDownListtipodocu.SelectedValue);
                terc.tipofactura_idtipofactura = Validar.validarselected(DropDownList2.SelectedValue);
                terc.nombre = Validar.validarlleno(TextBoxnombre.Text.ToUpper());
                terc.apellido = Validar.validarlleno(TextBox1apellido.Text.ToUpper());
                terc.fechanatcimiento = Validar.validarlleno(TextBox1fecnac.Text);
                terc.correo = Validar.validarlleno(TextBoxcorreo.Text);
                terc.barrios_idbarrios = Validar.validarselected(DropDownListbarrio.SelectedValue);
                terc.tiporesidencia_idtiporesidencia = Validar.validarselected(DropDownListtiporesi.SelectedValue);
                terc.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);
                terc.estrato = Validar.validarselected(DropDownListestrato.SelectedValue);
                terc.estado = Validar.validarselected(DropDownListestado.SelectedValue);

                ctg.identificacion = Validar.validarlleno(texboxdni.Text);
                ctg.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);


                if (terc.RegistrarTerceros(terc) && ctg.Registrarcargotercero(ctg))
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
                    Response.Redirect("ContratoCliente.aspx?key=" + texboxdni.Text);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
                }
            }
            catch (Exception ex)
            {
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "errorsoft();", true);

                }


            }

        }

        //CORPORATIVO
        protected void CargarTelefonocorpo()
        {

            try
            {
                GridViewtelefonocorpo.DataSource = listtelefonocorpo;
                GridViewtelefonocorpo.DataBind();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }
        protected void telefonocorpoRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TableCell cell = GridViewtelefonocorpo.Rows[e.RowIndex].Cells[0];
                listtelefono.Rows.Remove(listtelefono.Rows[e.RowIndex]);
                CargarTelefonocorpo();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Buttontelefonocorpo_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow dat = listtelefonocorpo.NewRow();
                dat["idtelefono"] = listtelefonocorpo.Rows.Count + 1;
                dat["telefono"] = Validar.validarnumero(TextBoxtelefocorpo.Text);
                listtelefonocorpo.Rows.Add(dat);
                CargarTelefonocorpo();
                TextBoxtelefocorpo.Text = "";
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridViewtelefonocorpo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TableCell cell = GridViewtelefonocorpo.Rows[e.RowIndex].Cells[0];
                listtelefonocorpo.Rows.Remove(listtelefonocorpo.Rows[e.RowIndex]);
                CargarTelefonocorpo();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
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

                DropDownListbarriosucursal.Items.Clear();
                DropDownListbarriosucursal.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownList6municorpo.SelectedValue);
                DropDownListbarriosucursal.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarriosucursal.DataTextField = "barrios";
                DropDownListbarriosucursal.DataValueField = "idbarrios";
                DropDownListbarriosucursal.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Buttonsucursal_Click(object sender, EventArgs e)
        {
            if (divsucursal.Visible == false)
            {
                divsucursal.Visible = true;

            }
            else
            {
                divsucursal.Visible = false;

            }
        }

        protected void Buttoncargarsucursal_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow datcorpo = listsucursalcorpo.NewRow();
                datcorpo["idsucursal"] = listsucursalcorpo.Rows.Count + 1;
                datcorpo["nombre"] = Validar.validarlleno(TextBoxnombresucursaltercero.Text);
                datcorpo["descripcion"] = Validar.validarlleno(TextAreadescripcionsucursal.Value);
                datcorpo["direccion"] = Validar.validarlleno(TextBoxdireccionsucursal.Text);
                datcorpo["barrio"] = Validar.validarselected(DropDownListbarriosucursal.SelectedValue);
                listsucursalcorpo.Rows.Add(datcorpo);
                cargarsucursalcorpo();
                TextBoxnombresucursaltercero.Text = "";
                TextAreadescripcionsucursal.Value = "";
                TextBoxdireccionsucursal.Text = "";
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridViewsucursalecorpo_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TableCell cell = GridViewsucursalecorpo.Rows[e.RowIndex].Cells[0];
                listsucursalcorpo.Rows.Remove(listsucursalcorpo.Rows[e.RowIndex]);
                cargarsucursalcorpo();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        protected void cargarsucursalcorpo()
        {
            try
            {
                GridViewsucursalecorpo.DataSource = listsucursalcorpo;
                GridViewsucursalecorpo.DataBind();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

            try
            {

                Validar.validarnumero(texboxdni.Text);
                terc.identificacion = Validar.validarlleno(texboxdni.Text);
                terc.direccion = Validar.validarlleno(TextBoxdireccioncorpo.Text.ToUpper());
                terc.tipodoc_idtipodoc = Validar.validarselected(DropDownList1tipodocucorpo.SelectedValue);
                terc.tipofactura_idtipofactura = Validar.validarselected(DropDownList3tipofactucorpo.SelectedValue);
                terc.nombre = Validar.validarlleno(TextBoxnombrecorpo.Text.ToUpper());
                terc.fechanatcimiento = Validar.validarlleno(TextBoxexpedicioncorpo.Text);
                terc.correo = Validar.validarlleno(TextBoxcorreocorpo.Text);
                terc.barrios_idbarrios = Validar.validarselected(DropDownList7barricorpo.SelectedValue);
                terc.tiporesidencia_idtiporesidencia = Validar.validarselected(DropDownListresidenciacorpo.SelectedValue);
                terc.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);
                terc.estrato = Validar.validarselected(DropDownListestratocorpo.SelectedValue);
                terc.estado = Validar.validarselected(DropDownList10estadocorpo.SelectedValue);

                ctg.identificacion = Validar.validarlleno(texboxdni.Text);
                ctg.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);

                if (terc.RegistrarTercerosempresatercero(terc) && ctg.Registrarcargotercero(ctg))
                {
                    foreach (DataRow item in listtelefonocorpo.Rows)
                    {
                        if (listtelefonocorpo.Rows.Count > 0)
                        {
                            tlf.telefono = item["telefono"].ToString();
                            tlf.terceros_idterceros = terc.identificacion;
                            tlf.RegistrarTelefono(tlf);


                        }
                        else
                        {
                            textError.InnerHtml = "Por favor agregue un telefono a la lista";
                            Alerta.CssClass = "alert alert-error";
                            Alerta.Visible = true;
                        }
                    }
                    if (listsucursalcorpo.Rows.Count > 0)
                    {
                        foreach (DataRow item in listsucursalcorpo.Rows)
                        {
                            if (listsucursalcorpo.Rows.Count > 0)
                            {
                                scsal.nombre = item["nombre"].ToString();
                                scsal.descripcion = item["descripcion"].ToString();
                                scsal.terceros_idterceros = terc.identificacion;
                                scsal.direccion = item["direccion"].ToString();
                                scsal.barrios_idbarrios = item["barrio"].ToString();
                                scsal.Registrarsucursal(scsal);


                            }
                            else
                            {
                                textError.InnerHtml = "Por favor agregue un telefono a la lista";
                                Alerta.CssClass = "alert alert-error";
                                Alerta.Visible = true;
                            }
                        }
                    }

           
                    Response.Redirect("ContratoCliente.aspx?key=" + texboxdni.Text);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "errorsoft();", true);

            }

        }




        //ESPECIAL

        protected void CargarTelefonoempresa()
        {

            try
            {
                GridViewtelefonoempresa.DataSource = listtelefonoempre;
                GridViewtelefonoempresa.DataBind();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void cargartelefonoempresa_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow dat = listtelefonoempre.NewRow();
                dat["idtelefono"] = listtelefonoempre.Rows.Count + 1;
                dat["telefono"] = Validar.validarnumero(TextBoxtelefonoempresa.Text);
                listtelefonoempre.Rows.Add(dat);
                CargarTelefonoempresa();
                TextBoxtelefonoempresa.Text = "";
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void GridViewtelefonoempresa_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TableCell cell = GridViewtelefonoempresa.Rows[e.RowIndex].Cells[0];
                listtelefonoempre.Rows.Remove(listtelefonoempre.Rows[e.RowIndex]);
                CargarTelefonoempresa();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void DropDownListpaisempresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListdepartamentoempresa.Items.Clear();
                DropDownListdepartamentoempresa.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(DropDownListpaisempresa.SelectedValue);
                DropDownListdepartamentoempresa.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                DropDownListdepartamentoempresa.DataTextField = "departamento";
                DropDownListdepartamentoempresa.DataValueField = "iddepartamento";
                DropDownListdepartamentoempresa.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }
        }

        protected void DropDownListdepartamentoempresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DropDownListmunicipioempresa.Items.Clear();
                DropDownListmunicipioempresa.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(DropDownListdepartamentoempresa.SelectedValue);
                DropDownListmunicipioempresa.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                DropDownListmunicipioempresa.DataTextField = "municipio";
                DropDownListmunicipioempresa.DataValueField = "idmunicipio";
                DropDownListmunicipioempresa.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void DropDownListmunicipioempresa_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListbarrioempresa.Items.Clear();
                DropDownListbarrioempresa.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownListmunicipioempresa.SelectedValue);
                DropDownListbarrioempresa.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarrioempresa.DataTextField = "barrios";
                DropDownListbarrioempresa.DataValueField = "idbarrios";
                DropDownListbarrioempresa.DataBind();

                DropDownListbarriosucursalempre.Items.Clear();
                DropDownListbarriosucursalempre.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownListmunicipioempresa.SelectedValue);
                DropDownListbarriosucursalempre.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarriosucursalempre.DataTextField = "barrios";
                DropDownListbarriosucursalempre.DataValueField = "idbarrios";
                DropDownListbarriosucursalempre.DataBind();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Buttoncargarsucursalempre_Click(object sender, EventArgs e)
        {
            if (divsucursalempre.Visible == false)
            {
                divsucursalempre.Visible = true;
            }
            else
            {
                divsucursalempre.Visible = false;

            }
        }

        protected void Buttoncargarsucursalempresatbla_Click(object sender, EventArgs e)
        {
            try
            {
                DataRow datempre = listsucursalempre.NewRow();
                datempre["idsucursal"] = listsucursalempre.Rows.Count + 1;
                datempre["nombre"] = Validar.validarlleno(TextBoxnombresucursalempre.Text);
                datempre["descripcion"] = Validar.validarlleno(TextAreadescripcionsucursalempre.Value);
                datempre["direccion"] = Validar.validarlleno(TextBoxdireccionsucursalempre.Text);
                datempre["barrio"] = Validar.validarselected(DropDownListbarriosucursalempre.SelectedValue);
                listsucursalempre.Rows.Add(datempre);
                cargarsucursalempre();
                TextBoxnombresucursalempre.Text = "";
                TextAreadescripcionsucursalempre.Value = "";
                TextBoxdireccionsucursalempre.Text = "";
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridViewsucursalempre_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TableCell cell = GridViewsucursalempre.Rows[e.RowIndex].Cells[0];
                listsucursalempre.Rows.Remove(listsucursalempre.Rows[e.RowIndex]);
                cargarsucursalempre();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        protected void cargarsucursalempre()
        {
            try
            {
                GridViewsucursalempre.DataSource = listsucursalempre;
                GridViewsucursalempre.DataBind();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            try
            {

                Validar.validarnumero(texboxdni.Text);
                terc.identificacion = Validar.validarlleno(texboxdni.Text);
                terc.direccion = Validar.validarlleno(TextBoxdireccionempresa.Text.ToUpper());
                terc.tipodoc_idtipodoc = Validar.validarselected(DropDownListtipodocumentoempresa.SelectedValue);
                terc.tipofactura_idtipofactura = Validar.validarselected(DropDownListtipofacturaempresa.SelectedValue);
                terc.nombre = Validar.validarlleno(TextBoxnombreempresa.Text.ToUpper());
                terc.fechanatcimiento = Validar.validarlleno(TextBoxexdicionempresa.Text);
                terc.correo = Validar.validarlleno(TextBoxcorreoempresa.Text);
                terc.barrios_idbarrios = Validar.validarselected(DropDownListbarrioempresa.SelectedValue);
                terc.tiporesidencia_idtiporesidencia = Validar.validarselected(DropDownListtiporeidenciaempresa.SelectedValue);
                terc.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);
                terc.estrato = Validar.validarselected(DropDownListestratoempresa.SelectedValue);
                terc.estado = Validar.validarselected(DropDownListestadoempresa.SelectedValue);

                ctg.identificacion = Validar.validarlleno(texboxdni.Text);
                ctg.tipotercero_idtipotercero = Validar.validarselected(tipotercero.SelectedValue);

                if (terc.RegistrarTercerosempresatercero(terc) && ctg.Registrarcargotercero(ctg))
                {
                    foreach (DataRow item in listtelefonocorpo.Rows)
                    {
                        if (listtelefonocorpo.Rows.Count > 0)
                        {
                            tlf.telefono = item["telefono"].ToString();
                            tlf.terceros_idterceros = terc.identificacion;
                            tlf.RegistrarTelefono(tlf);
                        }
                        else
                        {
                            textError.InnerHtml = "Por favor agregue un telefono a la lista";
                            Alerta.CssClass = "alert alert-error";
                            Alerta.Visible = true;
                        }

                    }
                    if (listsucursalempre.Rows.Count > 0)
                    {
                        foreach (DataRow item in listsucursalempre.Rows)
                        {
                            if (listsucursalempre.Rows.Count > 0)
                            {
                                scsal.nombre = item["nombre"].ToString();
                                scsal.descripcion = item["descripcion"].ToString();
                                scsal.terceros_idterceros = terc.identificacion;
                                scsal.direccion = item["direccion"].ToString();
                                scsal.barrios_idbarrios = item["barrio"].ToString();
                                scsal.Registrarsucursal(scsal);


                            }
                            else
                            {
                                textError.InnerHtml = "Por favor agregue un telefono a la lista";
                                Alerta.CssClass = "alert alert-error";
                                Alerta.Visible = true;
                            }
                        }
                    }

                    Response.Redirect("ContratoCliente.aspx?key=" + texboxdni.Text);


                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "nocontro();", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "errorsoft();", true);
            }
        }
    }
}



