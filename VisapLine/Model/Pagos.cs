using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Pagos
    {
        IData data = new Data();
        public string idpago { get; set; }
        public string fechapago { get; set; }
        public string factura_idfactura { get; set; }
        public string personal_idpersonal { get; set; }

        public DataTable ConsultarPago(Pagos fac)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPago(Pagos fac)
        {
            return data.OperarDatos("");
        }
    }
}