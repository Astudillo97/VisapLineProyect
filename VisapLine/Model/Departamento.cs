using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Departamento
    {
        IData data = new Data();
        public string iddepartamento { get; set; }
        public string pais_idpais { get; set; }
        public string departamento { get; set; }

        public DataTable ConsultarDepartamentoIdPais(Departamento dep)
        {
            return data.ConsultarDatos("SELECT public.pr_consultardepartamento('"+dep.pais_idpais+"'); ");
        }
    }
}