using System;
using System.Data;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Net.Mail;
using System.Net.Mime;
using System.Net;
using System.Net.Sockets;

namespace VisapLine.View.Login
{
    public partial class login : System.Web.UI.Page
    {
        UsuarioL usua = new UsuarioL();
        Terceros ter = new Terceros();
        Random rnd1 = new Random();
        class_correo cor = new class_correo();
        Permisos perm = new Permisos();
        AsignacionRol asg = new AsignacionRol();
        
    protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["tercero"]!=null && Session["roles"]!=null)
            {
                Response.Redirect("../Private/index.aspx");
            }
            
        }

        public string GetLocalIPAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            throw new ValidarExeption("No network adapters with an IPv4 address in the system!");
        }

        public string GetRemoteNameDNS()
        {
            return this.Request.UserHostName.ToString();
        }
        public string GetPublicIPAddress()
        {
            return this.Request.UserHostAddress.ToString();
        }

        protected void Login(object sender, EventArgs e)
        {
            usua.usuauser = user_.Value;
            usua.usuapassw = pas_.Value;
            try
            {
                DataRow data = Validar.Login(usua.ValidarUsuario(usua));
                ter.idterceros = data["terceros_idterceros"].ToString();
                DataRow dat=ter.ConsultarTercerosId(ter).Rows[0];
                switch (dat["estado"].ToString())
                {
                    case "ACTIVO":
                        usua.idusuario = data["idusuario"].ToString();
                        
                        DataTable roles=Validar.Consulta(usua.ConsultarUsuarioRol(usua));
                        Session["roles"] = roles;

                        Terceros tercero = new Terceros();
                        tercero.idterceros = dat["idterceros"].ToString();
                        tercero.estrato = dat["estrato"].ToString();
                        tercero.estado = dat["estado"].ToString();
                        tercero.tiporesidencia_idtiporesidencia = dat["tiporesidencia_idtiporesidencia"].ToString();
                        tercero.tipofactura_idtipofactura = dat["tipofactura_idtipofactura"].ToString();
                        tercero.identificacion = dat["identificacion"].ToString();
                        tercero.nombre = dat["nombre"].ToString();
                        tercero.apellido = dat["apellido"].ToString();
                        tercero.correo = dat["correo"].ToString();
                        tercero.direccion = dat["direccion"].ToString();
                        tercero.barrios_idbarrios = dat["barrio_idbarrio"].ToString();
                        tercero.fechanatcimiento = dat["fechexp"].ToString();
                        tercero.tipodoc_idtipodoc = dat["tipodoc_idtipodoc"].ToString();
                        tercero.rh = dat["rh"].ToString();
                        tercero.usuario_idusuario = GetLocalIPAddress() + "-" + GetRemoteNameDNS() + "-" + GetPublicIPAddress();
                        Session["tercero"] = tercero;
                        ClientScript.RegisterStartupScript(GetType(), "alerta", "redirect();", true);
                        break;
                    case "ELIMINADO":
                        textError.InnerHtml = "Actualmente se encuentra inactivo";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                        break;
                    default:
                        textError.InnerHtml = "Estado no controlado";
                        Alerta.CssClass = "alert alert-error";
                        Alerta.Visible = true;
                        break;
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                Session.Abandon();
               
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
                    DataRow dat = usua.ConsultarUsuarioByUsuarioCed(usua).Rows[0];
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
                if (usua.ConsultarUsuarioByUsuarioCed(usua).Rows.Count>0)
                {
                    textError.InnerHtml = "Ya se encuentra registrado, intente recuperar la contraseña";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }
                else
                {
                    ter.identificacion = nui_cre.Value;
                    DataTable cargotercero = Validar.Consulta(ter.ConsultarTerceroCargos(ter));
                    if (usua.RegistrarUsuario(usua))
                    {
                        foreach (DataRow item in cargotercero.Rows)
                        {
                            switch (item["tipoterceros"].ToString())
                            {
                                case "NATURAL":
                                    asg.usuario_idusuario = usua.usuauser;
                                    asg.rol_idrol = "CLIENTE";
                                    if (asg.RegistrarAsignacionRol(asg))
                                    {

                                    }
                                    break;
                                case "CORPORATIVO":
                                    asg.usuario_idusuario = usua.usuauser;
                                    asg.rol_idrol = "CLIENTE";
                                    if (asg.RegistrarAsignacionRol(asg))
                                    {

                                    }
                                    break;
                                case "EMPRESARIAL":
                                    asg.usuario_idusuario = usua.usuauser;
                                    asg.rol_idrol = "CLIENTE";
                                    if (asg.RegistrarAsignacionRol(asg))
                                    {

                                    }
                                    break;
                                case "EMPLEADO":
                                    asg.usuario_idusuario = usua.usuauser;
                                    asg.rol_idrol = "FUNCIONARIO";
                                    if (asg.RegistrarAsignacionRol(asg))
                                    {

                                    }
                                    break;
                                default:
                                    asg.usuario_idusuario = usua.usuauser;
                                    asg.rol_idrol = "INDEFINIDO";
                                    if (asg.RegistrarAsignacionRol(asg))
                                    {

                                    }
                                    break;
                            }
                        }
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