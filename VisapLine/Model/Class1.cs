using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Class1
    {
        IData data = new Data();
        public DataTable cartera()
        {
            string sql = "select * from pr_consultarcartera()";

            return data.ConsultarDatos(sql);
        }
        public DataTable totalescartera()
        {
            string sql = "select * from pr_consultartotalcartera()";

            return data.ConsultarDatos(sql);
        }
    }
}