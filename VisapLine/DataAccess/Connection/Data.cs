using System.Data;
using VisapLine.DataAccess.Data;
using Npgsql;
using VisapLine.DataAccess.Connection;
using System;
using VisapLine.Exeption;
using VisapLine.Model;

namespace VisapLine.DataAccess.Connection
{
    public class Data:IData
    {
        conexion_psql conx;
        public bool OperarDatos(string sql)
        {
            DataTable datos = new DataTable();
            Terceros ter=null;
            if (conx==null)
            {
                conx = new conexion_psql();
                if ((Terceros)System.Web.HttpContext.Current.Session["key"]!=null)
                {
                    ter = (Terceros)System.Web.HttpContext.Current.Session["key"];
                }
            }
            try
            {
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conx.OpenConexion());
                da.Fill(datos);
                conx.CloseConexion();
                if (Convert.ToInt32(datos.Rows[0][0].ToString()) > 0)
                {
                    NpgsqlDataAdapter aud = new NpgsqlDataAdapter("select * from pr_insertaraudit('"+sql+"','CORRECTO',"+ter.idterceros+",'"+ter.nombre+" "+ter.apellido+"','"+ter.usuario_idusuario+"')", conx.GetConexion());
                    return true;
                }
                else
                {
                    NpgsqlDataAdapter aud = new NpgsqlDataAdapter("select * from pr_insertaraudit('" + sql + "','CORRECTO'," + ter.idterceros + ",'" + ter.nombre + " " + ter.apellido + "','" + ter.usuario_idusuario + "')", conx.GetConexion());
                    return false;
                }
            }
            catch(Exception ex)
            {
                NpgsqlDataAdapter aud = new NpgsqlDataAdapter("select * from pr_insertaraudit('" + sql + "','CORRECTO'," + ter.idterceros + ",'" + ter.nombre + " " + ter.apellido + "','" + ter.usuario_idusuario + "')", conx.GetConexion());
                conx.CloseConexion();
                throw new ValidarExeption("No se ha realizado la operacion "+ex.Message,ex);
            }
        }

        public DataTable ConsultarDatos(string sql)
        {
            DataTable datos = new DataTable();
            if (conx == null)
            {
                conx = new conexion_psql();
            }
            try
            {
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conx.OpenConexion());
                da.Fill(datos);
                conx.CloseConexion();
                return datos;
            }
            catch(Exception ex)
            {
                conx.CloseConexion();
                throw new ValidarExeption("No se han encontrado registros "+ex.Message,ex);
            }
        }
        
    }
    
}