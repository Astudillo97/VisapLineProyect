using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Pais
    {
        IData data = new Data();
        public string idpais { get; set; }
        public string pais { get; set; }

        public DataTable ConsultarPais()
        {
            return data.ConsultarDatos("");
        }
       
    }
}