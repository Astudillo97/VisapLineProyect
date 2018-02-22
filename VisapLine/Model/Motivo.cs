using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
namespace VisapLine.Model
{
    public class Motivo
    {

        IData data = new Data();
        public string idmotivo { get; set; }
        public string motivo { get; set; }

        public DataTable Consultarmotivo()
        {
            return data.ConsultarDatos("SELECT * FROM  public.pr_consultarmotivo()");
        }


    }
}