using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Connection;
using VisapLine.DataAccess.Data;

namespace VisapLine.Model
{
    public class UsuarioL
    {
        IData data = new Data();
        public string idusuario { get; set; }
        public string usuauser { get; set; }
        public string usuapassw { get; set; }
        public string rol_idrol { get; set; }

        public DataTable ValidarUsuario(UsuarioL usu)
        {
            return data.ConsultarDatos("select * from pr_consultarlogin('" + usu.usuauser+"','"+usu.usuapassw+"'); ");
        }
        public bool CambiarContraseña(UsuarioL usu)
        {
            return data.OperarDatos("SELECT pr_actulizarcontrasenausuario('" + usu.idusuario+"','"+usu.usuapassw+"');");
        }
        public DataTable ConsultarUsuarioId(UsuarioL usu)
        {
            return data.ConsultarDatos("SELECT * from  public.pr_consultaridusuario('"+usu.idusuario+"');");
        }
        public bool RegistrarUsuario(UsuarioL usu)
        {
            return data.OperarDatos("select * from pr_insertarusuario( '"+usu.usuauser+"','"+usu.usuapassw+"','"+usu.rol_idrol+"')");
        }
        public DataTable ConsultarUsuarioByUsuario(UsuarioL usu)
        {
            return data.ConsultarDatos("select * from pr_consultarusuarioName('" + usu.usuauser+"');");
        }
    }
}