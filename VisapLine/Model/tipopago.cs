using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
using VisapLine.Exeption;
namespace VisapLine.Model
{
    public class tipopago
    {

        IData data = new Data();
        public string idtipopago { get; set; }
        public string tipopagos { get; set; }
        public DataTable Consultartipppago(tipopago fac)
        {
            return data.ConsultarDatos("select * from pr_consultartipopago()");
        }

    }

   
}