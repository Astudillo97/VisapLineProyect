using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoTicket
    {
        IData data = new Data();
        public string idTipoTicket { get; set; }
        public string NombreTipoTicket { get; set; }
        public string descTipoTicket { get; set; }
        public string EstadoTipoTicket { get; set; }


        public DataTable ConsultarTipoticket()
        {
            return data.ConsultarDatos("select * from public.ConsultarTipoTicket()");
        }
    }
}