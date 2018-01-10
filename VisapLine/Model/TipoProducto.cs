using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class TipoProducto
    {
        IData data = new Data();
        public string idtipoproducto { get; set; }
        public string tipoproducto { get; set; }
        public bool RegistrarTipoProducto(TipoProducto tpd)
        {
            return data.OperarDatos(" select * from pr_insertartipoproduc('"+tpd.tipoproducto+"')");
        }
        public bool EliminarTipoProducto(TipoProducto tipd)
        {
            return data.OperarDatos(" select * from pr_borrartipoproducto('"+tipd.idtipoproducto+"')");
        }
        public DataTable ConsultarTipoProducto()
        {
            return data.ConsultarDatos("select * from pr_consultartipoproducto()");
        }
    }
}