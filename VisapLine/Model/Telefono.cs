using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Telefono
    {
        IData data = new Data();
        public string idtelefono { get; set; }
        public string telefono { get; set; }
        public string terceros_idterceros { get; set; }

        public DataTable ConsultarTelefonosIdTerceros(Telefono tel)
        {
            return data.ConsultarDatos("");
        }
        public DataTable Consultar()
        {
            return data.ConsultarDatos("select * from telefonos;");
        }

        public bool RegistrarTelefono(Telefono tpt)
        {
            return data.OperarDatos("");
        }
    }
}