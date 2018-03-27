using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.Model;
using System.Data;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;

namespace VisapLine.Model
{
    public class reporte
    {
        IData data = new Data();
        public DataTable ConsultaAvanzada(string caso,string fecha1,string fecha2,string estado, string saldo, string barrio,string planes,string tipo, string medenvio)
        {
            return data.ConsultarDatos("SELECT * FROM pr_consultarcartera("+caso+ "," + fecha1 + " , " + fecha2 + ",'" + estado + "'," + saldo + "," + barrio + "," + planes + ","+tipo+","+medenvio+")");
        }
    }
}