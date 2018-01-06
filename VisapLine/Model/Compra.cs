using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Compra
    {
        IData data = new Data();
        public string idcompra { get; set; }
        public string fechapedido { get; set; }
        public string numeropedido { get; set; }
        public string fechallegada { get; set; }
        public string valor { get; set; }
        public string proveedor_idproveedor { get; set; }
    }
}