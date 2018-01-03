using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Zonas
    {
        IData data = new Data();
        public string idzona { get; set; }
        public string zona { get; set; }
        public string municipio_idmunicipio { get; set; }

        public DataTable ConsultarZonaIdMunicipio(Zonas zon)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarZona(Zonas zon)
        {
            return data.OperarDatos("s");
        }
    }
}