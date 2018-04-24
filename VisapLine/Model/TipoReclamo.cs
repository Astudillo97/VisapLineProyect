using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoReclamo
    {
        IData data = new Data();
        
        public string idTipoReclamo { get; set; }
        public string nombreTipoReclamo { get; set; }
        public string estadoTipoReclamo { get; set; }

        public DataTable ConsultarTipoReclamo()
        {

            return data.ConsultarDatos("select * from public.Consultar_TipoReclamo()");
        }
        
    }
}