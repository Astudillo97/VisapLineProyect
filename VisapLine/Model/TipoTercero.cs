using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoTercero
    {
        IData data = new Data();
        public string idtipotercero { get; set; }
        public string tipotercero { get; set; }

        public DataTable ConsultarTipoTercero()
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultartipotercero();");
        }

        public DataTable ConsultarTipoTercerofiltrado()
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultartipotercerofiltrado();");
        }

        
        public bool RegistrarTipoTercero(TipoTercero tpt)
        {
            return data.OperarDatos("");
        }
    }
}