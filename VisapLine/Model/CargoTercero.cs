using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class CargoTercero
    {
        IData data = new Data();

        public string idargotercero { get; set; }
        public string tercero_idtercero { get; set; }
        public string identificacion { get; set; }
        public string tipotercero_idtipotercero { get; set; }

        public bool Registrarcargotercero(CargoTercero cgt)
        {
            return data.OperarDatos("select * from pr_insertarcargotercero('" + cgt.tipotercero_idtipotercero + "','" + cgt.identificacion+ "')");
        }
        public DataTable ConsultarCargoIdentifi(CargoTercero ct)
        {
            return data.ConsultarDatos("select * from pr_consultarcargotercero('"+ct.identificacion+"')");
        }
        public bool EliminarCargoTercero( CargoTercero ct)
        {
            return data.OperarDatos("select * from pr_borrarcargotercero('"+ct.identificacion+"')");
        }
    }
}