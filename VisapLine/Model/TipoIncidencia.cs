using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;


namespace VisapLine.Model
{
    public class TipoIncidencia
    {
        IData data = new Data();

        public string idbarrios { get; set; }
        public string tipoincidencia { get; set; }
        public string categoriaincidencia_idcategoriaindencia { get; set; }



        public DataTable Consultartipoincidencia(TipoIncidencia tpin)
        {
            return data.ConsultarDatos("");
        }
        public bool RegistrarBarrios(Barrios bar)
        {
            return data.OperarDatos("");
        }   
    }
}