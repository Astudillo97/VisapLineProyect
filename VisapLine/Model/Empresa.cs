using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Empresa
    {
        IData data = new Data();
        public string idempresa { get; set; }
        public string descipcion { get; set; }
        public string valor1 { get; set; }
        public string valor2 { get; set; }

        public DataTable ConsultarEmpresa()
        {
            return data.ConsultarDatos("select * from pr_consultarempresa()");
        }
        
    }
}