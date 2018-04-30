
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoDoc
    {
        IData data = new Data();
        public string idtipodoc { get; set; }
        public string tipodoc { get; set; }

        public DataTable ConsultarTipoDoc()
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultartipodocumento();");
        }

        public bool RegistrarTipoDoc(Terceros per)
        {
            return data.OperarDatos("");
        }
    }
}