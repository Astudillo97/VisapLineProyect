using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
namespace VisapLine.Model
{
    public class Sucursal
    {
        IData data = new Data();
        public string idsucursal { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public string direccion { get; set; }
        public string terceros_idterceros { get; set; }
        public string barrios_idbarrios { get; set; }

        public DataTable Consultarsucursal(string scsal)
        {
            return data.ConsultarDatos("select * from pr_consultarsucursal('"+scsal+"')  ");
        }
        public bool Registrarsucursal(Sucursal scsal)
        {
            return data.OperarDatos("SELECT public.pr_insertarsucursal('" + scsal.nombre + "','" + scsal.descripcion + "','" + scsal.terceros_idterceros + "','" + scsal.direccion+ "','"+ scsal.barrios_idbarrios+ "');");
        }

    }

   

    

}