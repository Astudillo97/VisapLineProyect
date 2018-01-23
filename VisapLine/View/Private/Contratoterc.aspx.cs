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
        CargoTercero ctg = new CargoTercero();
        static DataTable listtelefono = new DataTable();
        static DataTable listtelefonocorpo = new DataTable();
        static DataTable listtelefonoempre = new DataTable();
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


                    listtelefonocorpo.Rows.Clear();
                    listtelefonocorpo.Dispose();
                    GridViewtelefonocorpo.Dispose();
                    listtelefonocorpo.Columns.Clear();
                    listtelefonocorpo.Columns.Add("idtelefono");
                    listtelefonocorpo.Columns.Add("telefono");


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

                    //CONTRATO

                    DropDownListpaiscontrato.DataSource = pais.ConsultarPais();
                    DropDownListpaiscontrato.DataTextField = "pais";
                    DropDownListpaiscontrato.DataValueField = "idpais";
                    DropDownListpaiscontrato.DataBind();

                    DropDownListtiporedenciacontrato.DataSource = tpres.ConsultarTipoResidencia();
                    DropDownListtiporedenciacontrato.DataTextField = "tiporesidencia";
                    DropDownListtiporedenciacontrato.DataValueField = "idtiporesidencia";
                    DropDownListtiporedenciacontrato.DataBind();

                    DropDownListtipocontrato.DataSource = tpoc.ConsultarTipoContrato();
                    DropDownListtipocontrato.DataTextField = "tipocontrato";
                    DropDownListtipocontrato.DataValueField = "idtipocontrato";
                    DropDownListtipocontrato.DataBind();

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

        protected void cargardatoscontratosnatu(string identi)
        {
            try
            {
                DataRow datcont = Validar.Consulta(terc.ConsultarPersonaIdenti(identi)).Rows[0];

                Labelnombrecontrato.Text = datcont["nombre"].ToString();
                Labelapellidocontrato.Text = datcont["apellido"].ToString();
                Labelcedulacontrato.Text = datcont["identificacion"].ToString();
                Labelcorreocontrato.Text = datcont["correo"].ToString();
                Labeldireccioncontrato.Text = datcont["direccion"].ToString();
                Alerta.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
                iddivnatural.Visible = false;
                iddivcorporativo.Visible = false;
                iddivempresa.Visible = false;
                tablanatural.Visible = true;
                cargartabla(datcont["idterceros"].ToString());
                cargartablasucursal(datcont["idterceros"].ToString());
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

            cargardatoscontratosnatu(Validar.validarnumero(TextBox1identificacion.Text));
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

        //cargar el modal con datos natural
        protected void Button3_Click(object sender, EventArgs e)
        {

            labelidentificacionnatural.Text = TextBox1identificacion.Text;
            labelnaturaltipopersona.Text = tipotercero.SelectedItem.Text;
            labeltipodocumentonatural.Text = DropDownListtipodocu.SelectedItem.Text;
            labeltipofacturanatural.Text = DropDownList2.SelectedItem.Text;
            labelnombrenatural.Text = TextBoxnombre.Text;
            labelapellidonatural.Text = TextBox1apellido.Text;
            labelnacimientonatural.Text = TextBox1fecnac.Text;
            labelcorreonatural.Text = TextBoxcorreo.Text;
            labelbarrionatural.Text = DropDownListbarrio.SelectedItem.Text;
            labeltiporesidencianatural.Text = DropDownListtiporesi.SelectedItem.Text;
            labelestratonatural.Text = DropDownListestrato.SelectedItem.Text;
            labelestadonatural.Text = DropDownListestado.SelectedItem.Text;
            ClientScript.RegisterStartupScript(GetType(), "", "botonmodal();", true);
        }

        //registrar natural 
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                Validar.validarnumero(TextBox1identificacion.Text);
                terc.identificacion = Validar.validarlleno(TextBox1identificacion.Text);
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

                ctg.identificacion = Validar.validarlleno(TextBox1identificacion.Text);
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
                    textError.InnerHtml = "Se ha registrado con exito";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    cargardatoscontratosnatu(Validar.validarnumero(TextBox1identificacion.Text));
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
                TableCell cell = GridViewtelefonocorpo.Rows[e.RowIndex].Cells[0];
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

        protected void buscardatoscontracorpo(string identicorpo)
        {


            try
            {

                DataRow datcontcorpo = Validar.Consulta(terc.ConsultarPersonaIdenti(identicorpo)).Rows[0];

                Label7.Text = datcontcorpo["nombre"].ToString();
                Label11.Text = datcontcorpo["identificacion"].ToString();
                Label13.Text = datcontcorpo["correo"].ToString();
                Label15.Text = datcontcorpo["direccion"].ToString();
                cargartabla(datcontcorpo["idterceros"].ToString());
                iddivnatural.Visible = false;
                iddivcorporativo.Visible = false;
                iddivempresa.Visible = false;
                Tablecorporacionempresa.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
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
            buscardatoscontracorpo(Validar.validarnumero(TextBox1corporativo.Text));
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



        protected void telefonocorpo_RowDeleting(object sender, GridViewDeleteEventArgs e)
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

        //cargar modal corporacion
        protected void Button6_Click(object sender, EventArgs e)
        {
            labelnitcorporativo.Text = TextBox1corporativo.Text;
            labeltipocorporativo.Text = tipotercero.SelectedItem.Text;
            labeltipodocumentocorporativo.Text = DropDownList1tipodocucorpo.SelectedItem.Text;
            labeltipofacturacorporativo.Text = DropDownList3tipofactucorpo.SelectedItem.Text;
            labelnombrecorporativo.Text = TextBoxnombrecorpo.Text;
            labelexpedicioncorporativo.Text = TextBoxexpedicioncorpo.Text;
            labelcorreocorporativo.Text = TextBoxcorreocorpo.Text;
            label1barriocorporativo.Text = DropDownList7barricorpo.SelectedItem.Text;
            labelresidenciacorporativo.Text = DropDownListresidenciacorpo.SelectedItem.Text;
            labelestratocorporativo.Text = DropDownListestratocorpo.SelectedItem.Text;
            labelestadocorporativo.Text = DropDownList10estadocorpo.SelectedItem.Text;
            ClientScript.RegisterStartupScript(GetType(), "", "botonmodalcorporativo();", true);

        }
        protected void Buttonguardarcorpo_Click(object sender, EventArgs e)
        {

            try
            {

                Validar.validarnumero(TextBox1corporativo.Text);
                terc.identificacion = Validar.validarlleno(TextBox1corporativo.Text);
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

                ctg.identificacion = Validar.validarlleno(TextBox1corporativo.Text);
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
                    textError.InnerHtml = "Se ha registrado con exito";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    iddivnatural.Visible = false;
                    iddivcorporativo.Visible = false;
                    iddivempresa.Visible = false;
                    buscardatoscontracorpo(Validar.validarnumero(TextBox1corporativo.Text));

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









        //EMPRESARIAL



        protected void GridViewtelefonoempresa_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                TableCell cell = GridViewtelefonoempresa.Rows[e.RowIndex].Cells[0];
                listtelefonoempre.Rows.Remove(listtelefonocorpo.Rows[e.RowIndex]);
                CargarTelefonoempresa();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Buttonbuscarempresa_Click(object sender, EventArgs e)
        {
            buscardatoscontracorpo(Validar.validarnumero(TextBox1empresa.Text));
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
                DropDownList7barricorpo.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownListmunicipioempresa.SelectedValue);
                DropDownListbarrioempresa.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarrioempresa.DataTextField = "barrios";
                DropDownListbarrioempresa.DataValueField = "idbarrios";
                DropDownListbarrioempresa.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }


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
        //agregar el telefono a la tabla 
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

        protected void telefonoempresa_RowDeleting(object sender, GridViewDeleteEventArgs e)
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

        protected void Button8_Click(object sender, EventArgs e)
        {
            labelnitempresarial.Text = TextBox1empresa.Text;
            label1tipoempresarial.Text = tipotercero.SelectedItem.Text;
            labeltipodocuemntoempresarial.Text = DropDownListtipodocumentoempresa.SelectedItem.Text;
            labeltipofacturalempresarial.Text = DropDownListtipofacturaempresa.SelectedItem.Text;
            labelnombreempresarial.Text = TextBoxnombreempresa.Text;
            labelexpedicionempresarial.Text = TextBoxexdicionempresa.Text;
            labelcorreoempresarial.Text = TextBoxcorreoempresa.Text;
            labelbarrioempresarial.Text = DropDownListbarrioempresa.SelectedItem.Text;
            labelresidenciaempresarial.Text = DropDownListtiporeidenciaempresa.SelectedItem.Text;
            labelestratoempresarial.Text = DropDownListestratoempresa.SelectedItem.Text;
            label1estadoempresarial.Text = DropDownListestadoempresa.SelectedItem.Text;
            ClientScript.RegisterStartupScript(GetType(), "", "botonmodalempresa();", true);


        }
        protected void Buttonguardarempresa_Click(object sender, EventArgs e)
        {
            try
            {

                Validar.validarnumero(TextBox1empresa.Text);
                terc.identificacion = Validar.validarlleno(TextBox1empresa.Text);
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

                ctg.identificacion = Validar.validarlleno(TextBox1empresa.Text);
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
                    textError.InnerHtml = "Se ha registrado con exito";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;

                    buscardatoscontracorpo(Validar.validarnumero(TextBox1empresa.Text));
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

        ///contrato
        ///

        protected void cargartabla(string idusuario)
        {
            pn.idtercero_idtercero = terc.idterceros;
            DataTable dt = pn.ConsultarPlantipoterce(idusuario);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
        protected void cargartablasucursal(string idusuario)
        {
            scsal.terceros_idterceros = terc.idterceros;
            DropDownListsucursalcontrato.DataSource = scsal.Consultarsucursal(idusuario);
            DropDownListsucursalcontrato.DataTextField = "nombre";
            DropDownListsucursalcontrato.DataValueField = "idsucursal";
            DropDownListsucursalcontrato.DataBind();

        }


        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
            GridViewRow gridw = GridView2.SelectedRow;
            idplancontr = gridw.Cells[2].Text;
            TextArea1detalleplan.Value = gridw.Cells[3].Text;
            Labelsubidaplancontrato.Text = gridw.Cells[7].Text;
            Labelbajadaplancontrato.Text = gridw.Cells[8].Text;
            Labelvaloriva.Text = gridw.Cells[2].Text;
            Labelmedioconexionplancontrato.Text = gridw.Cells[9].Text;


        }


        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }



        protected void DropDownListpaiscontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListdepartamentocontrato.Items.Clear();
                DropDownListdepartamentocontrato.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(DropDownListpaiscontrato.SelectedValue);
                DropDownListdepartamentocontrato.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                DropDownListdepartamentocontrato.DataTextField = "departamento";
                DropDownListdepartamentocontrato.DataValueField = "iddepartamento";
                DropDownListdepartamentocontrato.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
            }
        }
        protected void DropDownListdepartamentocontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListmunicipiocontrato.Items.Clear();
                DropDownListmunicipiocontrato.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(DropDownListdepartamentocontrato.SelectedValue);
                DropDownListmunicipiocontrato.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                DropDownListmunicipiocontrato.DataTextField = "municipio";
                DropDownListmunicipiocontrato.DataValueField = "idmunicipio";
                DropDownListmunicipiocontrato.DataBind();

                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);

            }


        }
        protected void DropDownListmunicipiocontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListbarriocontrato.Items.Clear();
                DropDownListbarriocontrato.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownListmunicipiocontrato.SelectedValue);
                DropDownListbarriocontrato.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarriocontrato.DataTextField = "barrios";
                DropDownListbarriocontrato.DataValueField = "idbarrios";
                DropDownListbarriocontrato.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
            }
        }

        protected void DropDownListestratocontrato_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownListestratocontrato.Text == "1" || DropDownListestratocontrato.Text == "2" || DropDownListestratocontrato.Text == "3")
            {
                TextBoxivacontrato.Text = "0";
                ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
            }
            else
            {
                if (DropDownListestratocontrato.Text == "4" || DropDownListestratocontrato.Text == "5" || DropDownListestratocontrato.Text == "6")
                {
                    TextBoxivacontrato.Text = "0.19";
                    ClientScript.RegisterStartupScript(GetType(), "", "panel2();", true);
                }

            }


        }

        protected void GridViewsucursalcontrato_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownListsucursalcontrato_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Buttonguardarcontrato_Click(object sender, EventArgs e)
        {
            try
            {
                int sesion =90 ;
                DataRow datcontcorpo = Validar.Consulta(terc.ConsultarPersonaIdenti(Labelcedulacontrato.Text)).Rows[0];
                contrat.terceros_idterceros = Validar.validarlleno(datcontcorpo["idterceros"].ToString());
                contrat.codigo = Validar.validarlleno(TextBox4.Text);
                contrat.fechacontrato = Validar.validarlleno(Textboxfechainiciopermanencia.Text);
                contrat.fechaactivacion = Validar.validarlleno(Textboxfechaactivacionservicio.Text);
                contrat.fechafacturacion = Validar.validarlleno(Textboxfechafacturacion.Text);
                contrat.estado = Validar.validarselected(DropDownListestadocontrato.Text);
                contrat.tipocontrato_idtipocontrato = Validar.validarselected(DropDownListtipocontrato.SelectedValue);
                contrat.plan_idplan = Validar.validarlleno(idplancontr);
                contrat.iva = Validar.validarlleno(TextBoxivacontrato.Text);
                contrat.enviofactura = Validar.validarselected(DropDownList1.SelectedValue);
                contrat.facturaunica = Validar.validarselected(DropDownListfacturaunicacontrato.SelectedValue);
                contrat.personal_idpersonal = Validar.validarsession(sesion.ToString());
                contrat.sucursal_idsucursal = Validar.validarselected(DropDownListsucursalcontrato.SelectedValue);
                contrat.observaciondirec = Validar.validarlleno(TextArea1.Value);
                contrat.direccionenviofact = Validar.validarlleno(TextBox1.Text);
                contrat.barrio_idbarrio = Validar.validarselected(DropDownListbarriocontrato.SelectedValue);        
             
               
               
              
               
                



        




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






