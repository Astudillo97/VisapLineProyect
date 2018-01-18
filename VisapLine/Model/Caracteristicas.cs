using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Caracteristicas
    {
        IData data = new Data();
        public string idcaracteristicas { get; set; }
        public string caracteristicas { get; set; }
        public string unidad { get; set; }

        public DataTable ConsultarCaracteristicas()
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultarcaracteristicas()");
        }
    }
}