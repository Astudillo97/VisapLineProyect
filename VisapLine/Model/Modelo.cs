using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Modelo
    {
        IData data = new Data();
        public string idmodelo { get; set; }
        public string modelo { get; set; }
        public string fabricante_idfabricante { get; set; }

        public bool RegistrarModelo(Modelo mod)
        {
            return data.OperarDatos("select * from pr_insertarmodelo('"+mod.modelo+"', '"+mod.fabricante_idfabricante+"')");
        }
        public bool EliminarModelo(Modelo mod)
        {
            return data.OperarDatos("select * from pr_borrarmodelo('" + mod.idmodelo + "')");
        }
        public DataTable ConsultarModelo()
        {
            return data.ConsultarDatos("select * from pr_consultarmodelo()");
        }
    }
}