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
    }
}