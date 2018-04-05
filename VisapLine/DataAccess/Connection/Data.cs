using System.Data;
using VisapLine.DataAccess.Data;
using Npgsql;
using VisapLine.DataAccess.Connection;
using System;
using VisapLine.Exeption;

namespace VisapLine.DataAccess.Connection
{
    public class Data : conexion_psql, IData
    {

        public bool OperarDatos(string sql)
        {
            DataTable datos = new DataTable();
            try
            {
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, OpenConexion());
                da.Fill(datos);
                CloseConexion();
                if (Convert.ToInt32(datos.Rows[0][0].ToString()) > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch(Exception ex)
            {
                CloseConexion();
                throw new ValidarExeption("No se ha realizado la operacion "+ex.Message,ex);
            }
        }

        public DataTable ConsultarDatos(string sql)
        {
            DataTable datos = new DataTable();
            try
            {
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sql, OpenConexion());
                da.Fill(datos);
                CloseConexion();
                return datos;
            }
            catch(Exception ex)
            {
                CloseConexion();
                throw new ValidarExeption("No se han encontrado registros "+ex.Message,ex);
            }
        }
        
    }
    
}