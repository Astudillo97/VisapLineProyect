using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class DetalleCompra
    {
        IData data = new Data();
        public string iddetallecompra { get; set; }
        public string compra_idocompra { get; set; }
        public string personal_idepersonal { get; set; }
    }
}