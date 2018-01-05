using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Puntos
    {
        IData data = new Data();
        public string idpunto { get; set; }
        public string estado { get; set; }
        public string direccion { get; set; }
        public string coordenadas { get; set; }
        public string barrios_idbarrios { get; set; }

        public DataTable ConsultarPuntos(Puntos punt)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPuntos(Puntos punt)
        {
            return data.OperarDatos("");
        }
    }
}