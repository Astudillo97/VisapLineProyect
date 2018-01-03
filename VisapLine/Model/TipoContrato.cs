using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{

    public class TipoContrato
    {
        IData data = new Data();
        public string idtipocontrato { get; set; }
        public string tipocontrato { get; set; }

        public DataTable ConsultarTipoContrato(TipoContrato tc)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarTipoContrato(TipoContrato rfp)
        {
            return data.OperarDatos("");
        }
    }
}