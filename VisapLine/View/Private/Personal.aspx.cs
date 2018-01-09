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
    public partial class Personal : System.Web.UI.Page
    {
        Model.Personal pers = new Model.Personal();
        UsuarioL usua = new UsuarioL();
        Random rnd1 = new Random();
        class_correo cor = new class_correo();
        Rol rol = new Rol();
        public static bool activacion = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    rol_.DataSource = Validar.Consulta(rol.ConsultarRol());
                    rol_.DataTextField = "rol";
                    rol_.DataValueField = "idrol";
                    rol_.DataBind();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void ConsultarUsuario(object sender, EventArgs e)
        {
            try
            {
                pers.identificacion = Validar.validarlleno(identif_.Value);
                tablausuario.DataSource = Validar.Consulta(pers.ConsultarPersonalIdentf(pers));
                tablausuario.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void tablausuario_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void tablausuario_RowCommand(object sender, GridViewCommandEventArgs e)
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
                    ClientScript.RegisterStartupScript(GetType(), "alerta", "panel2();", true);
                    pers.identificacion= e.CommandArgument.ToString();
                    DataRow dat = pers.ConsultarPersonalIdentf(pers).Rows[0];
                    codigo.InnerHtml = dat["idpersonal"].ToString();
                    identificacion_.Value = dat["identificacion"].ToString();
                    nombre_.Value = dat["nombre"].ToString();
                    apellido_.Value = dat["apellido"].ToString();
                    fecnac_.Value =Convert.ToDateTime( dat["fechanat"].ToString()).ToString("yyyy-MM-dd");
                    rh_.SelectedValue = dat["correo"].ToString();
                    estado_.SelectedValue=dat["correo"].ToString();
                    correo_.Value=dat["correo"].ToString();
                    usua.idusuario= dat["usuario_idusuario"].ToString();
                    DataRow daat = usua.ConsultarUsuarioId(usua).Rows[0];
                    usuario_.Value = daat["usuario"].ToString();
                    textediccion.InnerHtml = "Edicción habilitada para " + dat["nombre"].ToString() + " " + dat["apellido"].ToString();
                    viewedicion.Visible = true;
                    
                }
                if (e.CommandName.ToString() == "Eliminar")
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

        protected void RegistrarRol(object sender, EventArgs e)
        {

        }
        protected void RegistrarPersonal(object sender, EventArgs e)
        {
            try
            {
                if (activacion)
                {
                    pers.identificacion = Validar.validarlleno(identificacion_.Value);
                    pers.nombre = Validar.validarlleno(nombre_.Value);
                    pers.apellido = Validar.validarlleno(apellido_.Value);
                    pers.fechanac = Validar.validarlleno(fecnac_.Value);
                    pers.rh = Validar.validarselected(rh_.SelectedValue);
                    pers.estado = Validar.validarselected(estado_.SelectedValue);
                    pers.correo = Validar.validarlleno(correo_.Value);
                    if (pers.ActualizarPersonal(pers))
                    {

                    }
                }
                usua.usuapassw = Convert.ToString(rnd1.Next(10000, 99999));
                usua.usuauser = Validar.validarlleno(identificacion_.Value);
                usua.rol_idrol = Validar.validarselected(rol_.SelectedValue);

                //Datos del Personal
                pers.identificacion = Validar.validarlleno(identificacion_.Value);
                pers.nombre = Validar.validarlleno(nombre_.Value);
                pers.apellido = Validar.validarlleno(apellido_.Value);
                pers.fechanac = Validar.validarlleno(fecnac_.Value);
                pers.rh = Validar.validarselected(rh_.SelectedValue);
                pers.estado = Validar.validarselected(estado_.SelectedValue);
                pers.correo = Validar.validarlleno(correo_.Value);
                if (usua.RegistrarUsuario(usua))
                {
                    DataRow dat = usua.ConsultarUsuarioByUsuario(usua).Rows[0];
                    pers.usuario_idusuario = dat["idusuario"].ToString();
                    if (pers.RegistrarPersonal(pers))
                    {
                        cor.destinatario = pers.correo;
                        cor.asunto = "Bienvenido a VisapLine";
                        cor.cuerpo = "Ya eres parte de la empresa.\n Inicia sesión con:\n Usuario:" + pers.identificacion + " Contraseña:" + usua.usuapassw + "";
                        cor.EnviarMensaje();
                        textError.InnerHtml = "Registrado correctamente";
                        Alerta.CssClass = "alert alert-success";
                        Alerta.Visible = true;
                    }
                    else
                    {
                        textError.InnerHtml = "No se ha podido conpletar el registro, es posible que ya se encuente registrado";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                    }
                }
                else
                {
                    textError.InnerHtml = "No se ha podido completar el registro, verifique el usuario no se encuentre registrado";
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
        protected void CancelarPersonal(object sender, EventArgs e)
        {

        }
    }
}