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
            catch
            {
                throw new ValidarExeption("No se ha realizado la operacion");
            }
            //try
            //{
            //    NpgsqlCommand comando = new NpgsqlCommand(sql, OpenConexion());
            //    if (comando.ExecuteNonQuery() > 0)
            //    {
            //        CloseConexion();
            //        return true;
            //    }
            //    return false;
            //}
            //catch
            //{
            //    return false;
            //}
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
                throw new ValidarExeption("No se han encontrado registros");
            }
        }
    }
}