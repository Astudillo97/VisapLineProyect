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
    public class banco
    {
        IData data = new Data();


        public string idbancos { get; set; }
        public string bancos { get; set; }

        public DataTable Consultarbancos(banco bn)
        {
            return data.ConsultarDatos("select * from pr_consultarbanco()");
        }       

    }
}