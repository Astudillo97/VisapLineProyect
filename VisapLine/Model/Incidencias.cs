using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Incidencias
    {
        IData data = new Data();
        public string idincidencias { get; set; }
        public string fechainicio { get; set; }
        public string fechafin { get; set; }
        public string estado{ get; set; }
        public string costo { get; set; }
        public string servicios_idservicios { get; set; }
        public string detalle { get; set; }
        public string personal_idpersonal { get; set; }

        public DataTable ConsultarIncidencias(Incidencias ins)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarInsidencias(Incidencias bar)
        {
            return data.OperarDatos("");
        }
    }
}