using System.Data;
using VisapLine.DataAccess.Data;
using Npgsql;
using VisapLine.DataAccess.Connection;
using System;
using VisapLine.Exeption;
using VisapLine.Model;
using System.Net;
using System.Net.Sockets;

namespace VisapLine.DataAccess.Connection
{
    public class Data:IData
    {
        conexion_psql conx;
        Terceros ter = null;
        public bool OperarDatos(string sql)
        {
            DataTable datos = new DataTable();
            
            if (conx==null)
            {
                conx = new conexion_psql();
            }
            try
            {
                ter = (Terceros)System.Web.HttpContext.Current.Session["tercero"];
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conx.OpenConexion());
                da.Fill(datos);
                if (Convert.ToInt32(datos.Rows[0][0].ToString()) > 0)
                {
                    string ss="select * from pr_insertaraudit('"+sql.Replace("'", "''") +"', 'CORRECTO', "+ter.idterceros+", '"+ter.nombre+" "+ter.apellido+"', '"+ter.usuario_idusuario+"')";
                    NpgsqlDataAdapter aud = new NpgsqlDataAdapter(ss, conx.GetConexion());
                    aud.Fill(datos);
                    conx.CloseConexion();
                    return true;
                    
                }
                else
                {
                    string ss = "select * from pr_insertaraudit('" + sql.Replace("'", "''") + "', 'FALLIDO', " + ter.idterceros + ", '" + ter.nombre + " " + ter.apellido + "', '" + ter.usuario_idusuario + "')";
                    NpgsqlDataAdapter aud = new NpgsqlDataAdapter(ss, conx.GetConexion());
                    aud.Fill(datos);
                    conx.CloseConexion();
                    return false;
                }
                
            }
            catch(Exception ex)
            {
                string ss = "select * from pr_insertaraudit('" + sql.Replace("'", "''") + "', 'INCORRECTO', " + ter.idterceros + ", '" + ter.nombre + " " + ter.apellido + "', '" + ter.usuario_idusuario + "')";
                NpgsqlDataAdapter aud = new NpgsqlDataAdapter(ss, conx.GetConexion());
                aud.Fill(datos);
                throw new ValidarExeption("No se ha realizado la operacion "+ex.Message,ex);
            }
        }

        public DataTable ConsultarDatosReturn(string sql)
        {
            DataTable datos = new DataTable();
            DataTable sali = new DataTable();
            if (conx == null)
            {
                conx = new conexion_psql();
            }
            try
            {
                ter = (Terceros)System.Web.HttpContext.Current.Session["tercero"];
                if (ter==null)
                {
                    ter = new Terceros();
                    ter.idterceros = "-1";
                    ter.nombre = "SISTEMA";
                    ter.usuario_idusuario = "";
                }
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, conx.OpenConexion());
                da.Fill(datos);
                string ss = "select * from pr_insertaraudit('" + sql.Replace("'", "''") + "', 'CORRECTO', " + ter.idterceros + ", '" + ter.nombre + " " + ter.apellido + "', '" + ter.usuario_idusuario + "')";
                NpgsqlDataAdapter aud = new NpgsqlDataAdapter(ss, conx.GetConexion());
                aud.Fill(sali);
                conx.CloseConexion();
                return datos;
            }
            catch(Exception ex)
            {
                conx.CloseConexion();
                throw new ValidarExeption("No se han encontrado registros "+ex.Message,ex);
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
            catch (Exception ex)
            {
                conx.CloseConexion();
                throw new ValidarExeption("No se han encontrado registros " + ex.Message, ex);
            }
        }
    }
    
}