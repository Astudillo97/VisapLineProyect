using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Areas
    {
        IData data = new Data();
        public string idAreas { get; set; }
        public string codAreas { get; set; }
        public string nombreAreas { get; set; }
        public string estaAreas { get; set; }



        public DataTable ConsultarAreas() {
            return data.ConsultarDatos("select * from public.ConsutarAreas()");
        }

    }
}