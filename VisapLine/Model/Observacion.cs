using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Observacion
    {
        IData data = new Data();
        public string idobservacion { get; set; }
        public string factura_idfactura_obs { get; set; }
        public string observacion { get; set; }
        public bool RegistrarObservacion(Observacion ob)
        {
            return data.OperarDatos("select * from pr_insertarobservacion("+ob.factura_idfactura_obs+",'"+ob.observacion+"');");
        }
        public bool RegistrarObservaciondos(Observacion ob)
        {
            return data.OperarDatos("select * from pr_insertarobservaciondos(" + ob.factura_idfactura_obs + ",'" + ob.observacion + "');");
        }
    }
}