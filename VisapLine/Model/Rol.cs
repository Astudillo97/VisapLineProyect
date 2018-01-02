using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Rol
    {
        IData data = new Data();
        public string idrol { get; set; }
        public string rol { get; set; }

        public DataTable ConsultarRol()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarRol(Rol rol)
        {
            return data.OperarDatos("");
        }
    }
}