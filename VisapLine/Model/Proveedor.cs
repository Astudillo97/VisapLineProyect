using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Proveedor
    {
        IData data = new Data();
        public string idproveedor { get; set; }
        public string nit { get; set; }
        public string razonsocial { get; set; }
        public string telefono { get; set; }
        public string correo { get; set; }

        public bool RegistrarProveedor(Proveedor prov)
        {
            return data.OperarDatos("select * from pr_insertarterceroproveedor( '" + prov.nit + "','" + prov.razonsocial + "','" + prov.correo + "','" + prov.telefono + "')");
        }
        public DataTable ConsultarProveedor()
        {
            return data.ConsultarDatos("select * from pr_consultarterceroproveedor()");
        }
        public bool EliminarProveedor(Proveedor prov)
        {
            return data.OperarDatos("select * from pr_borrarproveedor('"+prov.idproveedor+"')");
        }
    }
}