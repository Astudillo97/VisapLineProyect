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

                class_correo correo = new class_correo();
                correo.destinatario = "jab291214@outlook.com";
                correo.asunto = "Cambio de Contraseña";
                correo.cuerpo = "Mas mensaje";
                //pr_actulizarcontrasenausuario(id, pass);
                //salida+"data.txt";
                correo.archivo = null;

                Terceros ter = new Terceros();
                UsuarioL usu = new UsuarioL();
                ter.correo = this.correo.Value;
                ter.identificacion = this.nui.Value;
                DataRow dat = Validar.Consulta(ter.ConsultarTerceros(ter)).Rows[0];
                usu.idusuario = dat["usuario_idusuario"].ToString();
                usu.usuapassw = dat["identificacion"].ToString();
                correo.cuerpo = "Contraseña: "+ dat["identificacion"].ToString();
                if (usu.CambiarContraseña(usu))
                {
                    textError.InnerHtml = "Cambiada";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;

                    if (correo.EnviarMensaje())
                    {
                        textError.InnerHtml = "Enviado!";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                    }
                    else
                    {
                        textError.InnerHtml = "ya no envia!";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                    }
                }
                else
                {
                    textError.InnerHtml = "Error Contraseña";
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