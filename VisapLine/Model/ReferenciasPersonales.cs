using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class ReferenciasPersonales
    {
        IData data = new Data();
        public string idreferenciaspersonales { get; set; }
        public string nombre { get; set; }
        public string parentesco { get; set; }
        public string telefono { get; set; }
        public string municipio_idmunicipio { get; set; }
        public string contrato_idcontrato { get; set; }

        public DataTable ConsultarReferenciasPersonales(ReferenciasPersonales rfp)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarReferenciasPersonales(ReferenciasPersonales rfp)
        {
            return data.OperarDatos("");
        }
    }
}