using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Devoluciones
    {
        IData data = new Data();
        public string iddevoluciones { get; set; }
        public string detalle { get; set; }
        public string obnervacion { get; set; }
        public string incidencias_idincidencias{ get; set; }
        public string detallesalida_idordensalida { get; set; }

        public DataTable ConsultarDevoluciones(Devoluciones dev)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarDevluciones(Devoluciones bar)
        {
            return data.OperarDatos("");
        }
    }
}