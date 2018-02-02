using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{

    public class CategoriaIncidencia
    {
        IData data = new Data();
        public string idcategoriaincidencia { get; set; }
        public string categoriaincidencia { get; set; }

        public DataTable Consultarcategoriaincidencia(CategoriaIncidencia cateinci)
        {
            return data.ConsultarDatos("");
        }
        


    }
}