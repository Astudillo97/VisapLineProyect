using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Barrios
    {
        IData data = new Data();
        public string idbarrios { get; set; }
        public string barrios { get; set; }
        public string muninicio_idmunicipio { get; set; }

        public DataTable ConsultarBarriosIdMunicipio(Barrios bar)
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultarbarrio('"+bar.muninicio_idmunicipio+"');");
        }

        public bool RegistrarBarrios(Barrios bar)
        {
            return data.OperarDatos("");
        }
    }
}