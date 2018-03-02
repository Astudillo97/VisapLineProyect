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

namespace VisapLine.View.Private
{
    public partial class Almacen : System.Web.UI.Page
    {
        Modelo mod = new Modelo();
        Fabricante fab = new Fabricante();
        TipoProducto tipopro = new TipoProducto();
        Proveedor prov = new Proveedor();
        Compra comp = new Compra();
        Inventario invent = new Inventario();
        DetalleCompra dtc = new DetalleCompra();
        static string valuecontrato ;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {                  
                    cargardatosqueseusanentodolado();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        private void cargardatosqueseusanentodolado()
        {
            txtmac.Attributes.Add("onkeypress", "nointro()");
            txtserial.Attributes.Add("onkeypress", "nointro()");
            txtserial.Attributes.Add("onkeypress", "nointro()");
            mac_.Attributes.Add("onkeypress", "nointro()");
            serial_.Attributes.Add("onkeypress", "nointro()");

            listfabricante.Items.Clear();
            listfabricante.Items.Add("Seleccionar");
            listfabricante.DataSource = fab.ConsultarFabricante();
            listfabricante.DataValueField = "idfabricante";
            listfabricante.DataTextField = "fabricante";
            listfabricante.DataBind();

            dropmarca.Items.Clear();
            dropmarca.Items.Add("Seleccionar");
            dropmarca.DataSource = fab.ConsultarFabricante();           
            dropmarca.DataValueField = "idfabricante";
            dropmarca.DataTextField = "fabricante";
            dropmarca.DataBind();

            fabricante_inv.Items.Clear();
            fabricante_inv.Items.Add("Seleccionar");
            fabricante_inv.DataSource = fab.ConsultarFabricante();           
            fabricante_inv.DataValueField = "idfabricante";
            fabricante_inv.DataTextField = "fabricante";
            fabricante_inv.DataBind();

            listProveedor_.Items.Clear();
            listProveedor_.Items.Add("Seleccionar");
            listProveedor_.DataSource = prov.ConsultarProveedor();
            listProveedor_.DataValueField = "Identificacion";
            listProveedor_.DataTextField = "nombre";
            listProveedor_.DataBind();

            modelo_inv.Items.Clear();
            modelo_inv.Items.Add("Seleccionar");
            modelo_inv.DataSource = mod.ConsultarModelo();
            modelo_inv.DataValueField = "idmodelo";
            modelo_inv.DataTextField = "modelo";
            modelo_inv.DataBind();

            repeteidordeinventario.DataSource = invent.consultarinventario();
            repeteidordeinventario.DataBind();

            tipoproducto_inv.Items.Clear();
            tipoproducto_inv.Items.Add("Seleccionar");
            tipoproducto_inv.DataSource = tipopro.ConsultarTipoProducto();
            tipoproducto_inv.DataValueField = "idtipoproducto";
            tipoproducto_inv.DataTextField = "tipoproducto";
            tipoproducto_inv.DataBind();

            droptipoproduc.Items.Clear();
            droptipoproduc.Items.Add("Seleccionar");
            droptipoproduc.DataSource = tipopro.ConsultarTipoProducto();
            droptipoproduc.DataValueField = "idtipoproducto";
            droptipoproduc.DataTextField = "tipoproducto";
            droptipoproduc.DataBind();

            estado_.SelectedValue = "Disponible";

            CargarTableFabricante();
            CargarTableModelo();
            CargarTableProveedor();
            CargarTabletipoProducto();
        }

        protected void RegistrarProveedor(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel4();", true);
            try
            {
                prov.nit = Validar.validarlleno(nit_.Value);
                prov.razonsocial = Validar.validarlleno(razonsocail_.Value);
                prov.telefono = Validar.validarnumero(telefono_.Value);
                prov.correo = Validar.validarlleno(correo_.Value);
                prov.telefono = Validar.validarlleno(telefono_.Value);
                if (prov.RegistrarProveedor(prov))
                {
                    textError.InnerHtml = "Proveedor Registrado Correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTableProveedor();
                    cargardatosqueseusanentodolado();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar el Proveedor";
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

        private void CargarTableProveedor()
        {
            try
            {
                tablaproveedores.DataSource = Validar.Consulta(prov.ConsultarProveedor());
                tablaproveedores.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }
        private void CargarTabletipoProducto()
        {
            try
            {
                tablatipoproducto.DataSource = Validar.Consulta(tipopro.ConsultarTipoProducto());
                tablatipoproducto.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }

        }
        private void CargarTableFabricante()
        {
            try
            {
                tablafabricantes.DataSource = Validar.Consulta(fab.ConsultarFabricante());
                tablafabricantes.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }

        }
        private void CargarTableModelo()
        {
            try
            {
                tablamodelo.DataSource = Validar.Consulta(mod.ConsultarModelo());
                tablamodelo.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }
        private void CargarTableCompras()
        {
            try
            {
                tablamodelo.DataSource = Validar.Consulta(mod.ConsultarModelo());
                tablamodelo.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarTipoProducto(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                tipopro.tipoproducto = tipoproducto.Value;
                if (tipopro.RegistrarTipoProducto(tipopro))
                {
                    textError.InnerHtml = "Tipo de Producto Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTabletipoProducto();
                    cargardatosqueseusanentodolado();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar el Tipo de Producto";
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

        protected void RegistrarFabricante(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel5();", true);
            try
            {
                fab.fabricante = fabricante_.Value;
                if (fab.RegistrarFabricante(fab))
                {
                    textError.InnerHtml = "Fabricante Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTableFabricante();
                    cargardatosqueseusanentodolado();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar el Fabricante";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarModelo(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel6();", true);
            try
            {
                mod.modelo = modelo_.Value;
                mod.fabricante_idfabricante = listfabricante.SelectedValue;
                if (mod.RegistrarModelo(mod,checkwifi.Checked))
                {
                    textError.InnerHtml = "Modelo Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTableModelo();
                    cargardatosqueseusanentodolado();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar el Modelo";
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

        [WebMethod]
        public static bool eliminardetallecompara(string compra)
        {
            DetalleCompra dtc = new DetalleCompra();
            return dtc.eliminardetalle(compra);
        }

        protected void tablatipoproducto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                if (e.CommandName.ToString() == "Eliminar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    tipopro.idtipoproducto = DeleteRowId;
                    if (tipopro.EliminarTipoProducto(tipopro))
                    {
                        CargarTabletipoProducto();
                    }
                    else
                    {
                        textError.InnerHtml = "No se ha podido Eliminar el Tipo de producto, ya se encuentra socociado";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
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

        protected void tablaproveedores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel4();", true);
            try
            {
                if (e.CommandName.ToString() == "Eliminar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    prov.idproveedor = DeleteRowId;
                    if (prov.EliminarProveedor(prov))
                    {
                        CargarTableProveedor();
                    }
                    else
                    {
                        textError.InnerHtml = "El proveedor que esta eliminando ya tiene productos en la vodega";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
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

        protected void tablafabricantes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel5();", true);
            try
            {
                if (e.CommandName.ToString() == "Eliminar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    fab.idfabricante = DeleteRowId;
                    if (fab.EliminarFabricante(fab))
                    {
                        CargarTableFabricante();
                    }
                    else
                    {
                        textError.InnerHtml = "No se puede eliminar por la asociacion con el Modelo";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
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

        protected void tablamodelo_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel6();", true);
            try
            {
                if (e.CommandName.ToString() == "Eliminar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    mod.idmodelo = DeleteRowId;
                    if (mod.EliminarModelo(mod))
                    {
                        CargarTableModelo();
                    }
                    else
                    {
                        textError.InnerHtml = "No se puede eliminar el modelo, esta siendo usado en productos del inventario";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
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

        protected void RegistrarCompra(object sender, EventArgs e)
        {
            try
            {
                comp.fechapedido = Validar.validarlleno(fechped_.Value);
                comp.numeropedido = Validar.validarlleno(numeropedido_.Value);
                comp.fechallegada = fechped_.Value;
                comp.valor = Validar.validarnumero(valor_.Value);
                comp.proveedor_idproveedor = Validar.validarselected(listProveedor_.SelectedValue);
                comp.personal_idpersonal = "0";// Validar.validarsession("2");
                DataRow dat = Validar.Consulta(comp.RegistrarCompra(comp)).Rows[0];
                valuecontrato = dat[0].ToString();
                datosdeldetalle();

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        private void datosdeldetalle()
        {
            tablacompras.DataSource = dtc.cosultardetalle(valuecontrato);
            tablacompras.DataBind();
        }

        protected void RegistrarInventario(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                invent.serial = Validar.ConvertVarchar(serial_.Value);
                invent.mac = Validar.ConvertVarchar(mac_.Value);
                invent.descripcion = Validar.validarlleno(descripcion_.Value);
                invent.tipoproducto_idtipoproducto = Validar.validarselected(tipoproducto_inv.SelectedValue);
                invent.vidautil = Validar.validarlleno(vidautil_.Value);
                invent.estado = Validar.validarselected(estado_.SelectedValue);
                invent.modelo_idmodelo = Validar.validarselected(modelo_inv.SelectedValue);
                invent.compra_idcompra = valuecontrato;
                if (invent.RegistrarInventario(invent))
                {
                    textError.InnerHtml = "Elemento registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    cargardatosqueseusanentodolado();
                    datosdeldetalle();
                }
                else
                {
                    textError.InnerHtml = "No se pudo registrar el elemento";
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

        protected void dropmarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "pop", "openModal()", true);
            dropmodelo.DataSource = mod.ConsultarModelo(dropmarca.SelectedValue);
            dropmodelo.DataValueField = "idmodelo";
            dropmodelo.DataTextField = "modelo";
            dropmodelo.DataBind();
        }

        protected void dropmodelo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "pop", "openModal()", true);
            if (droptipoproduc.SelectedItem.Text.Equals("RADIO") || droptipoproduc.SelectedItem.Text.Equals("ONU") || droptipoproduc.SelectedItem.Text.Equals("ROUTER"))
            {
                divcaracteristicaequipo.Visible = true;
                divocultoinsumos.Visible = false;
                confimarregistro.Visible = true;
            }
            else
            {
                confimarregistro.Visible = false;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "pop", "openModal()", true);
                divocultoinsumos.Visible = true;
                divcaracteristicaequipo.Visible = false;
                insumos.DataSource = dtc.cosultarequipoararegistro(droptipoproduc.SelectedValue);
                insumos.DataBind();
            }
        }

        protected void confimarregistro_Click(object sender, EventArgs e)
        {
            try { 
            if (droptipoproduc.SelectedItem.Text.Equals("RADIO") || droptipoproduc.SelectedItem.Text.Equals("ONU") || droptipoproduc.SelectedItem.Text.Equals("ROUTER"))
            {
                dtc.registrarproducto(txtserial.Text, txtdescripcion.Text, droptipoproduc.SelectedValue, txtvidautil.Text, dropmodelo.SelectedValue, txtmac.Text, txtcantidad.Text, valuecontrato);
                cargardatosqueseusanentodolado();
                datosdeldetalle();
                divcaracteristicaequipo.Visible = false;
            }

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "swal('ERROR AL REGISTRAR!', 'Fallo en registar ', 'error');", true);
            }
        }

        protected void insumos_SelectedIndexChanging(object sender, EventArgs e)
        {
            GridViewRow gvr = insumos.SelectedRow;
            TextBox textcantidad = (TextBox)gvr.FindControl("gvtxtcantidad");
            dtc.resgistrarinsumo(valuecontrato, gvr.Cells[0].Text,  textcantidad.Text);
            datosdeldetalle();
            cargardatosqueseusanentodolado();
        }

        protected void consltarcompra(object sender, EventArgs e)
        {
            string numeropedido = Validar.validarlleno(numeropedido_.Value);
            DataTable dt = comp.ConsultarCompraByNumero(numeropedido);
            if (dt.Rows.Count >0) {
                rowinsertar.Visible = false;
                valuecontrato = dt.Rows[0][0].ToString();
                formcompra.DataSource = dt;
                formcompra.DataBind();
                datosdeldetalle();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "nodata()", true);
            }
            
        }
    }
}