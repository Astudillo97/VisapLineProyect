using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Tipologia
    {

        IData data = new Data();
        public string idTipologia { get; set; }
        public string codTipologia { get; set; }
        public string descTipologia { get; set; }
        public string estaTipologia { get; set; }
        public string NombreTipologia { get; set; }


        public DataTable ConsultarTipologia()
        {
            return data.ConsultarDatos("select * from public.Consultar_Tipologia");
        }

    }
}