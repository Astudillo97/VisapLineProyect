using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
using VisapLine.Exeption;

namespace VisapLine.Model
{
    public class Indicador
    {
        IData data = new Data();

        public string fecha { get; set; }
        public string anio { get; set; }
        public string trimestre { get; set; }
        public string ruta { get; set; }
        public string nombredoc { get; set; }
        public string tipoindicador { get; set; }
        public string idindicador { get; set; }

    
        public DataTable ConsultarIndicadores()
        {
            return data.ConsultarDatos("select * from public.pr_consultarindicador()");
        }

        public DataTable ConsultarPorAño(int año)
        {
            return data.ConsultarDatos("select * from public.pr_consultarindicadoranio('"+año+"','CALIDAD')");
        }

        public DataTable ConsultarAño()
        {
            return data.ConsultarDatos("select * from public.pr_consultaranioindicador()");
        }


    }
}