using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoFactura
    {
        IData data = new Data();
        public string idtipofactura { get; set; }
        public string tipofactura { get; set; }

        public DataTable ConsultarTipoFactura()
        {
            return data.ConsultarDatos("SELECT * FROM pr_consultartipofactura()");
        }

        public bool RegistrarTipoFactura(TipoFactura tpt)
        {
            return data.OperarDatos("");
        }
    }
}