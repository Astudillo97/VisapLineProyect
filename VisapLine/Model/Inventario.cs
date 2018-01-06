using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Inventario
    {
        IData data = new Data();
        public string idinventario { get; set; }
        public string serial { get; set; }
        public string descripcion { get; set; }
        public string tipoproducto_idtipoproducto { get; set; }
        public string vidautil { get; set; }
        public string estado { get; set; }
        public string modelo_idmodelo { get; set; }
        public string mac { get; set; }
        public string detallecompra_iddetallecompra { get; set; }
    }
}