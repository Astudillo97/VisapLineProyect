using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Municipio
    {
        IData data = new Data();
        public string idmunicipio { get; set; }
        public string departamento_iddepartamento { get; set; }
        public string municipio { get; set; }

        public DataTable ConsultarMunicipioIdDepartamento(Municipio mun)
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultarmunicipio('"+mun.departamento_iddepartamento+"');");
        }

    }
}