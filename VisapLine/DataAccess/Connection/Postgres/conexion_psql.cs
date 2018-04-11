using System;
using Npgsql;
using System.Configuration;
using VisapLine.Exeption;

namespace VisapLine.DataAccess.Connection
{
    public class conexion_psql
    {
        private  NpgsqlConnection conexion1 = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["conexion_psql"].ConnectionString);
        public  NpgsqlConnection OpenConexion()
        {
            try
            {
                conexion1.Open();
            }
            catch (Exception ex)
            {
                conexion1.Close();
                throw new ValidarExeption("Error de conexion:Intentelo de nuevo");
            }
            return conexion1;
        }

        public NpgsqlConnection CloseConexion()
        {
            try
            {
                conexion1.Close();

            }
            catch (Exception)
            {
                conexion1.Close();
                throw new ValidarExeption("Error de conexion:Intentelo de nuevo");
            }
            return conexion1;
        }

    }
}
