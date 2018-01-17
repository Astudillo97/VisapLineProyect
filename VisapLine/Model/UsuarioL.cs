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
        public string datospersonales_iddatospersonales { get; set; }

        public DataTable ValidarUsuario(UsuarioL usu)
        {
            return data.ConsultarDatos("select * from pr_consultarlogin('" + usu.usuauser+"','"+usu.usuapassw+"'); ");
        }
        public bool CambiarContraseña(UsuarioL usu)
        {
            return data.OperarDatos("SELECT pr_actualizarcontrasenausuario('" + usu.idusuario+"','"+usu.usuapassw+"');");
        }
        public DataTable ConsultarUsuarioId(UsuarioL usu)
        {
            return data.ConsultarDatos("SELECT * from  public.pr_consultaridusuario('"+usu.idusuario+"');");
        }
        public bool RegistrarUsuario(UsuarioL usu)
        {
            return data.OperarDatos("select * from pr_insertarusuario( '"+usu.usuauser+"','"+usu.usuapassw+"','"+usu.rol_idrol+"','"+datospersonales_iddatospersonales+"')");
        }
        public DataTable ConsultarUsuarioByUsuario(UsuarioL usu)//Consulta por fk del usuario asociado a los datos personales
        {
            return data.ConsultarDatos("select * from pr_consultarusuariocedula('" + usu.idusuario+"');");
        }
        public bool ActualizarUsuarioRol(UsuarioL usu)
        {
            return data.OperarDatos("SELECT public.pr_actulizarusuariorol('"+usu.idusuario+"','"+usu.rol_idrol+"'); ");
        }
        public DataTable ConsultarUsuarioRol(UsuarioL usu)
        {
            return data.ConsultarDatos("select * from public.pr_consultarrol(" + usu.idusuario + ")");
        }
    }
}