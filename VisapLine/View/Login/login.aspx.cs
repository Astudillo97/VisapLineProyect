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
                ter.correo = Validar.validarlleno( this.correo.Value);
                ter.identificacion = Validar.validarlleno( this.nui.Value);
                DataRow datos = Validar.Consulta(ter.ConsultarRecuperacion(ter)).Rows[0];
                usua.idusuario = datos["usuario_idusuario"].ToString();
                usua.usuapassw = Convert.ToString(rnd1.Next(10000,99999));
                if (usua.CambiarContraseña(usua))
                {
                    DataRow dat = usua.ConsultarUsuarioId(usua).Rows[0];
                    cor.destinatario = datos["correo"].ToString();
                    cor.asunto = "VisapLine Telecomunicaciones";
                    cor.cuerpo = "Credenciales para acceso:\n Usuario:"+dat["usuario"].ToString()+"\n"+usua.usuapassw;
                    cor.archivo = null;

                    if (cor.EnviarMensaje())
                    {
                        textError.InnerHtml = "Credenciales enviadas al correo";
                        Alerta.CssClass = "alert-success";
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
    }
}