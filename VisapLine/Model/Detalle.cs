using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Detalle
    {
        IData data = new Data();
        public string iddetalle { get; set; }
        public string cantidad { get; set; }
        public string valor { get; set; }
        public string factura_idfactura { get; set; }
        public string servicios_idservicios { get; set; }
        public string incidencias_idincidencias { get; set; }
        public string cargoadicional_idcargoadicional { get; set; }
    }
}