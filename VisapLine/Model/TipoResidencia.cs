using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoResidencia
    {
        IData data = new Data();
        public string idtiporesidencia { get; set; }
        public string tiporesidencia { get; set; }

        public DataTable ConsultarTipoResidencia()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarTipoResidencia(TipoResidencia tpres)
        {
            return data.OperarDatos("");
        }
    }
}