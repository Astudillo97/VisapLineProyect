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
    public partial class Almacen : System.Web.UI.Page
    {
        Modelo mod = new Modelo();
        Fabricante fab = new Fabricante();
        TipoProducto tipopro = new TipoProducto();
        Proveedor prov = new Proveedor();
        Compra comp = new Compra();
        Inventario invent = new Inventario();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    listfabricante.DataSource = fab.ConsultarFabricante();
                    listfabricante.DataValueField = "idfabricante";
                    listfabricante.DataTextField = "fabricante";
                    listfabricante.DataBind();

                    listProveedor_.DataSource = prov.ConsultarProveedor();
                    listProveedor_.DataValueField = "idproveedor";
                    listProveedor_.DataTextField = "razonsocial";
                    listProveedor_.DataBind();

                    modelo_inv.DataSource = mod.ConsultarModelo();
                    modelo_inv.DataValueField = "idmodelo";
                    modelo_inv.DataTextField = "modelo";
                    modelo_inv.DataBind();

                    fabricante_inv.DataSource = fab.ConsultarFabricante();
                    fabricante_inv.DataValueField = "idfabricante";
                    fabricante_inv.DataTextField = "fabricante";
                    fabricante_inv.DataBind();

                    tipoproducto_inv.DataSource = tipopro.ConsultarTipoProducto();
                    tipoproducto_inv.DataValueField = "idtipoproducto";
                    tipoproducto_inv.DataTextField = "tipoproducto";
                    tipoproducto_inv.DataBind();

                    estado_.SelectedValue = "Disponible";

                    CargarTableFabricante();
                    CargarTableModelo();
                    CargarTableProveedor();
                    CargarTabletipoProducto();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarProveedor(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                prov.nit = Validar.validarlleno(nit_.Value);
                prov.razonsocial =Validar.validarlleno( razonsocail_.Value);
                prov.telefono =Validar.validarnumero(telefono_.Value);
                prov.correo = Validar.validarlleno(correo_.Value);
                if (prov.RegistrarProveedor(prov))
                {
                    textError.InnerHtml = "Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTableProveedor();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar";
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
                    textError.InnerHtml = "Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTabletipoProducto();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar";
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                fab.fabricante = fabricante_.Value;
                if (fab.RegistrarFabricante(fab))
                {
                    textError.InnerHtml = "Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTableFabricante();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar";
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
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel3();", true);
            try
            {
                mod.modelo = modelo_.Value;
                mod.fabricante_idfabricante = listfabricante.SelectedValue;
                if (mod.RegistrarModelo(mod))
                {
                    textError.InnerHtml = "Registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                    CargarTableModelo();
                }
                else
                {
                    textError.InnerHtml = "Error al registrar";
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

        protected void tablatipoproducto_RowCommand(object sender, GridViewCommandEventArgs e)
        {
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
                        textError.InnerHtml = "No se puede eliminar por asociacion";
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
                comp.personal_idpersonal = Validar.validarsession("2");
                DataRow dat = Validar.Consulta(comp.RegistrarCompra(comp)).Rows[0];
                codigoCompra.InnerHtml = dat[0].ToString();
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RegistrarInventario(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
            try
            {
                invent.serial = Validar.validarlleno(serial_.Value);
                invent.descripcion =Validar.validarlleno( descripcion_.Value);
                invent.tipoproducto_idtipoproducto = Validar.validarselected(tipoproducto_inv.SelectedValue);
                invent.vidautil = Validar.validarlleno(vidautil_.Value);
                invent.estado = Validar.validarselected(estado_.SelectedValue);
                invent.modelo_idmodelo = Validar.validarselected(modelo_inv.SelectedValue);
                invent.mac = Validar.validarlleno(mac_.Value);
                invent.compra_idcompra = codigoCompra.InnerHtml;
                if (invent.RegistrarInventario(invent))
                {
                    textError.InnerHtml = "Elemento registrado correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
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
    }
}