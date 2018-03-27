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
            return data.ConsultarDatos("SELECT * FROM pr_consultarcartera("+caso+ "," + fecha1 + " , " + fecha2 + "," + estado + "," + saldo + "," + barrio + "," + planes + ","+tipo+","+medenvio+")");
        }
        public DataTable ConsultarEstadosTercero()
        {
            return data.ConsultarDatos("select estado from terceros group by estado");
        }
        public DataTable ConsultarEstadosContrato()
        {
            return data.ConsultarDatos("select estadoc from contrato group by estadoc");
        }
        public DataTable ConsultarEstadosServicio()
        {
            return data.ConsultarDatos("select estado from servicios group by estado");
        }
        public DataTable ConsultarMethodoEnvio()
        {
            return data.ConsultarDatos("select enviofactura from contrato group by enviofactura");
        }
        public DataTable ConsultarTipoServicio()
        {
            return data.ConsultarDatos("select tipo from puntos group by tipo");
        }
    }
}