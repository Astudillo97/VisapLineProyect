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
    }
}