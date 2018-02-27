using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;


namespace VisapLine.Model
{

    public class Ingreso
    {
        IData data = new Data();

        public string caja_idcaja_egre { get; set; }     


        public   DataTable consultaringresos(Ingreso ig)
        {
            return data.ConsultarDatos("select * from  pr_consultaringresos('" + ig.caja_idcaja_egre + "')");
        }

    }

  



           
}