using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using Npgsql;
using VisapLine.DataAccess.Connection;
namespace VisapLine.DataAccess.Connection
{
    public class Data : conexion_psql,IData
    {
        
        public  bool OperarDatos(string sql)
        {
            try
            {
                NpgsqlCommand comando = new NpgsqlCommand(sql, OpenConexion());
                if (comando.ExecuteNonQuery() > 0)
                {
                    CloseConexion();
                    return true;
                }
                return false;
            }
            catch
            {
                return false;
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
            catch
            {
                return null;
            }
        }
    }
}