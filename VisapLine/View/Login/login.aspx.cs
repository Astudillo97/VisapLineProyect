using System;
using System.Data;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Net.Mail;
using System.Net.Mime;

namespace VisapLine.View.Login
{
    public partial class login : System.Web.UI.Page
    {
        UsuarioL usua = new UsuarioL();
        Terceros ter = new Terceros();
        Random rnd1 = new Random();
        class_correo cor = new class_correo();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            usua.usuauser = user_.Value;
            usua.usuapassw = pas_.Value;
            try
            {
                DataRow data = Validar.Login(usua.ValidarUsuario(usua));
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void RecuperarContraseña(object sender, EventArgs e)
        {
            try
            {
                String rootPath = Server.MapPath("~");
                string subcarpeta = "Archivos\\";
                string salida = rootPath + subcarpeta;

                ter.correo = Validar.validarlleno(correo.Value);
                ter.identificacion = Validar.validarlleno(nui.Value);
                DataRow datos = Validar.Consulta(ter.ConsultarRecuperacion(ter)).Rows[0];
                usua.usuapassw = Convert.ToString(rnd1.Next(10000,99999));
                usua.idusuario = ter.identificacion;
                if (usua.CambiarContraseña(usua))
                {
                    DataRow dat = usua.ConsultarUsuarioByUsuario(usua).Rows[0];
                    cor.destinatario = datos["correo"].ToString();
                    cor.asunto = "VisapLine Telecomunicaciones";
                    cor.cuerpo = "Credenciales para acceso:\n Usuario:"+dat["usuario"].ToString()+"\nContraseña:"+usua.usuapassw;
                    cor.archivo = null;

                    if (cor.EnviarMensaje())
                    {
                        textError.InnerHtml = "Credenciales enviadas al correo";
                        Alerta.CssClass = "alert alert-success";
                        Alerta.Visible = true;
                    }
                    else
                    {
                        textError.InnerHtml = "No se pudo enviar el correo";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                    }
                }
                else
                {
                    textError.InnerHtml = "No se pudo restablecer la contraseña";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
                //salida+"nombre.extencion"; para cargar archivos de una carpeta especifica
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void CrearUsuario(object sender, EventArgs e)
        {
            try
            {
                usua.usuauser = Validar.validarlleno(usuario_cre.Value);
                usua.usuapassw = Validar.validarpassword(password_cre.Value, password2_cre.Value);
                usua.datospersonales_iddatospersonales = Validar.validarlleno(nui_cre.Value);
                usua.idusuario = Validar.validarlleno(nui_cre.Value);
                if (usua.ConsultarUsuarioByUsuario(usua).Rows.Count>0)
                {
                    textError.InnerHtml = "Ya se encuentra registrado, intente recuperar la contraseña";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
                else
                {
                    if (usua.RegistrarUsuario(usua))
                    {
                        textError.InnerHtml = "Registrado Correctamente";
                        Alerta.CssClass = "alert alert-success";
                        Alerta.Visible = true;
                    }
                    else
                    {
                        textError.InnerHtml = "Comuniquese con la empresa para rectificar los datos";
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
    }
}