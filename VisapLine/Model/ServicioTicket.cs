using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class ServicioTicket
    {

        IData data = new Data();
        public string idServicioTicket { get; set; }
        public string codServicioTicket { get; set; }
        public string nombServicioTicket { get; set; }
        public string descServicioTicket { get; set; }
        public string estaServicioTicket { get; set; }


        public DataTable ConsultarServicioTicket()
        {

            return data.ConsultarDatos("Select * from public.ConsultarServicioTicket()");
        }

    }
}