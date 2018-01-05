using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class SoportePago
    {
        IData data = new Data();
        public string idsoportepago { get; set; }
        public string soportepago { get; set; }
        public string factura_idfactura { get; set; }
        public string soporte { get; set; }
        public string valor { get; set; }
        public string fechapago { get; set; }

        public DataTable ConsultarSoportePago(SoportePago sp)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarSoportePago(SoportePago sp)
        {
            return data.OperarDatos("");
        }
    }
}