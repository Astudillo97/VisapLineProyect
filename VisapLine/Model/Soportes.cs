using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{

    public class Soportes
    {
        IData data = new Data();
        public string idsoporte { get; set; }
        public string soportes { get; set; }
        public string contrato_idcontrato { get; set; }


        public DataTable ConsultarSoportes(Soportes sop)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarSoportes(Soportes sop)
        {
            return data.OperarDatos("");
        }

    }
}