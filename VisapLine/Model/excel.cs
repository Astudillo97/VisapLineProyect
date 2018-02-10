using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;

namespace VisapLine.Model
{
    public class excel
    {
        IData data = new Data();
        public DataTable ExportToSiigo() {
            return data.ConsultarDatos("select * from pr_tablaparaexcelv1()");
        }
    }
}