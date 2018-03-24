using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class GestCliente : System.Web.UI.Page
    {

        Terceros tercero = new Terceros();
        Telefono tlf = new Telefono();
        Contrato contrato = new Contrato();
        Empresa empresa = new Empresa();
        class_pdf pdf = new class_pdf();
        Factura fact = new Factura();
        Observacion observac = new Observacion();
        Incidencias inci = new Incidencias();
        static DataTable tablefactura = new DataTable();
        static DataTable tercliente = new DataTable();
        static DataTable contcliente = new DataTable();
        Servicios serv = new Servicios();
        Puntos punto = new Puntos();
        CargoAdicional cargo = new CargoAdicional();
        public DataTable punt = new DataTable();
        public static string ident;
        CategoriaIncidencia cinci = new CategoriaIncidencia();
        TipoIncidencia tpin = new TipoIncidencia();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();

        Pagos pg = new Pagos();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
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
                }
            }
            catch (Exception)
            {

                throw;
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

        protected void ConsultarIdentif(object sender, EventArgs e)
        {
            try
            {
                tercero.identificacion = Validar.validarlleno(identif_.Value);
                tercliente = Validar.Consulta(tercero.ConsultarTerceroAvanzado(tercero));
                consultacliente.DataSource = tercliente;
                consultacliente.DataBind();
                Alerta.Visible = false;
                allfactura.DataSource = null;
                allfactura.DataBind();
                consultacontrato.Dispose();
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panelbutton();", true);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void consultacliente_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                DataRow row = tercliente.Rows[e.NewSelectedIndex];
                _tipocliente.Value = row["tipoterceros"].ToString();
                identificacion_.Value = row["identificacion"].ToString();
                ident = row["identificacion"].ToString();
                _nombre_.Value = row["nombre"].ToString() + " " + row["apellido"].ToString();
                _correo_.Value = row["correo"].ToString();
                _estado_.Value = row["estado"].ToString();
                _direccion_.Value = row["direccion"].ToString();
                tlf.terceros_idterceros = row["identificacion"].ToString();
                DataTable listtelefono = tlf.ConsultarTelefonosIdTerceros(tlf);
                string telef = "";
                foreach (DataRow item in listtelefono.Rows)
                {
                    telef += item["telefono"].ToString() + " ";
                }
                _telefono_.Value = telef;
                contrato.terceros_idterceros = row["idterceros"].ToString();
                contcliente = contrato.ConsultarContratoIdTercero(contrato);
                consultacontrato.DataSource = contcliente;
                consultacontrato.DataBind();
                paneldedatosterceros.Visible = true;
                Alerta.Visible = false;


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }

        protected void consultacontrato_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            try
            {
                DataRow row = contcliente.Rows[e.NewSelectedIndex];
                fact.contrato_idcontrato = row["idcontrato"].ToString();
                tablefactura = fact.ConsultarFacturabyContrato(fact);
                allfactura.DataSource = tablefactura;
                allfactura.DataBind();
                allfactura.Dispose();
                Alerta.Visible = false;

                DataTable dat = Validar.Consulta(serv.consultaservicioscont2(row["idcontrato"].ToString()));
                punt = punto.consultarpuntosdelcontrato(e.NewSelectedIndex.ToString());
                GridView1.DataSource = dat;
                GridView1.DataBind();

                try
                {
                    pg.contrato_idcontrato = row["idcontrato"].ToString();
                    DataTable pagosidcon = Validar.Consulta(pg.ConsultarPagosidcontrato(pg));
                    GridViewpagos.DataSource = pagosidcon;
                    GridViewpagos.DataBind();


                    punt = punto.consultarpuntosdelcontrato(row["idcontrato"].ToString());
                    cargo.contrato_idcontrato_cargo = row["idcontrato"].ToString();
                    cargosadicionales.DataSource = cargo.ConsultarCargosIdContrato(cargo);
                    cargosadicionales.DataBind();
                }
                catch (Exception)
                {

                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error"; 
                Alerta.Visible = true;
            }

        }
        protected void allfactura_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "verfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    tablefactura.PrimaryKey = new DataColumn[] { tablefactura.Columns["idfactura"] };
                    DataRow dat = tablefactura.Rows.Find(paramet);
                    DataRow dato = fact.ConsultarFacturas("null::date", "null::date", "NULL::character varying", dat["facturaventa"].ToString(), "3").Rows[0];
                    string referen = pdf.CrearFactura(empresa.ConsultarEmpresa(), dato);
                    Response.Redirect("../../Archivos/" + referen);
                }
                if (e.CommandName.ToString() == "pagarfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    Response.Redirect("gestpagos.aspx?codigo=" + paramet);
                }
                if (e.CommandName.ToString() == "correccion")
                {
                    string paramet = e.CommandArgument.ToString();
                    ClientScript.RegisterStartupScript(GetType(), "mod", "cargarIdfactura('" + paramet + "');", true);
                }
                if (e.CommandName.ToString() == "editarfactura")
                {
                    string paramet = e.CommandArgument.ToString();
                    Response.Redirect("editarfactura.aspx?key=" + paramet);
                }
                Alerta.Visible = false;
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            try
            {
                observac.observacion = Validar.validarlleno(observacion_.Text);
                observac.factura_idfactura_obs = numero.Text;
                if (observac.RegistrarObservacion(observac))
                {
                    textError.InnerHtml = "Solicitud Enviada Correctamente";
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
        protected void cargartabla(string idservicio)
        {
            Labelidincidencia.Text = idservicio;
            DataTable inc = inci.ConsultarIncidenciasidser(idservicio);
            GridView2.DataSource = inc;
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {


        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("buscar"))
            {
                string dat = e.CommandArgument.ToString();
                DropDownList3caracteriscainci.DataSource = cinci.Consultarcategoriaincidencia();
                DropDownList3caracteriscainci.DataTextField = "categoriaincidencia";
                DropDownList3caracteriscainci.DataValueField = "idcategoriaincidencia";
                DropDownList3caracteriscainci.DataBind();
                cargartabla(dat);

                DataRow puntoedit = punto.ConsultarPuntosEdit(dat).Rows[0];
                barr.idbarrios = puntoedit["barrios_idbarrioscol"].ToString();
                DataRow dir = barr.ConsultarTodoporBarrio(barr).Rows[0];
                cargarDepartamentos(dir["idpais"].ToString());
                pais_.SelectedValue = dir["idpais"].ToString();
                departamento_.SelectedValue = dir["iddepartamento"].ToString();
                cargarMunicipios(dir["iddepartamento"].ToString());
                municipio_.SelectedValue = dir["idmunicipio"].ToString();
                cargarBarrios(dir["idmunicipio"].ToString());
                barrio_.SelectedValue= puntoedit["barrios_idbarrioscol"].ToString();
                tipo.SelectedValue= puntoedit["tipocol"].ToString();
                estadoserv.SelectedValue= puntoedit["estadocol"].ToString();
                longitud_.Text= puntoedit["coordenadaxcol"].ToString();
                latitud_.Text = puntoedit["coordenadaycol"].ToString();
                direcciont_.Text= puntoedit["direcioncol"].ToString();
                referencia_.Text= puntoedit["referenciascol"].ToString();
                idserv.Text = puntoedit["idservicioscol"].ToString();
                idpuntoac.Text = puntoedit["idpuntoscol"].ToString();
                try
                {
                    punt = punto.consultarpuntosdelservicio(e.CommandArgument.ToString());
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "pop", "swal({title: 'UUUUPSSS!!!!', text: 'Algo ha ocurrido estamos trabajando para solucionarlo',imageUrl: '../../Contenido/images/monkeyprogramer.jpg',imageSize: '400x250'})", true);
                }
            }
            else
            {

            }


            if (e.CommandName.Equals("getservicio"))
            {
                string t = e.CommandArgument.ToString();
                Response.Redirect("servicio.aspx?key=" + t, false);

            }


        }

        protected void ButtonGuardarinci_Click(object sender, EventArgs e)
        {
            try
            {

                Terceros ter = (Terceros)Session["tercero"];
                inci.estado = Validar.validarselected(DropDownListestadoinc.Text);
                inci.detalle = Validar.validarlleno(TextArea1detalle.Value.ToUpper());
                inci.terceros_idterceros = Validar.validarlleno(ter.idterceros);
                inci.servicios_idservicios = Validar.validarlleno(Labelidincidencia.Text);
                inci.tipoincidencia_idtipoincidencia = Validar.validarselected(DropDownList3caracteriscainci.SelectedValue);

                if (inci.RegistrarInsidencias(inci))
                {
                    DropDownListestadoinc.Text = "Seleccione";
                    TextArea1detalle.Value = "";
                    cargartabla(Labelidincidencia.Text);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealertinci();", true);
                    ClientScript.RegisterStartupScript(GetType(), "alerta", "panelincidencia();", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterrorinci();", true);
                }
            }

            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

            }
        }
        protected void DropDownList3caracteriscainci_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownList2tipoinci.Items.Clear();
                DropDownList2tipoinci.Items.Add(new ListItem("Seleccione", "Seleccione"));
                tpin.categoriaincidencia_idcategoriaindencia = Validar.validarselected(DropDownList3caracteriscainci.SelectedValue);
                DropDownList2tipoinci.DataSource = Validar.Consulta(tpin.Consultartipoincidencia(tpin));
                DropDownList2tipoinci.DataTextField = "tipoincidencia";
                DropDownList2tipoinci.DataValueField = "idtipoincidencia";
                DropDownList2tipoinci.DataBind();
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panelmodalinci();", true);
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void btn_actualizara_ServerClick(object sender, EventArgs e)
        {
            try
            {
                Validar.validarselected(estadoserv.SelectedValue);
                Validar.validarselected(barrio_.SelectedValue);
                Validar.validarselected(tipo.SelectedValue);
                Validar.validarlleno(direcciont_.Text);
                Validar.ConvertVarchar(referencia_.Text);
                double lat;
                double lon;
                if (latitud_.Text.Equals("") && longitud_.Text.Equals(""))
                {
                    lat = Validar.ObtenerLatitud(Convert.ToInt32(latgrados.Value), Convert.ToInt32(latminut.Value), Convert.ToDouble(latsegun.Value.Replace('.',',')));
                    lon = Validar.ObtenerLongitud(Convert.ToInt32(longrados.Value), Convert.ToInt32(lonminut.Value), Convert.ToDouble(lonsegun.Value.Replace('.', ',')));
                }
                else
                {
                    lat = Convert.ToDouble(latitud_.Text.Replace('.',','));
                    lon = Convert.ToDouble(longitud_.Text.Replace('.',','));
                }
                if (punto.ActualizarPuntoAvanzado(estadoserv.SelectedValue, direcciont_.Text, lat.ToString(), lon.ToString(), barrio_.SelectedValue, tipo.SelectedValue, idserv.Text, referencia_.Text, idpuntoac.Text))
                {
                    punt = punto.consultarpuntosdelservicio(idserv.Text);
                    estadoserv.SelectedValue = "Seleccione";
                    direcciont_.Text = "";
                    barrio_.SelectedValue = "Seleccione";
                    tipo.SelectedValue = "Seleccione";
                    idserv.Text = "";
                    referencia_.Text = "";
                    idpuntoac.Text = "";
                    
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "ErrorPunto('ACTUALIZACION EXITOSA!','Punto Geografico Actualizado correctamente','success');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "ErrorPunto('ACTUALIZACION FALLIDA','Verifique que los espacios se encuentren correctamente diligenciados, recuerde seleccionar el servicio a modificar!','error');", true);
                }
                

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "ErrorPunto('ACTUALIZACION FALLIDA','" + ex.Message + "','error');", true);
            }
        }
    }
}