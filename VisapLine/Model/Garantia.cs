using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Garantia
    {
        IData data = new Data();
        public string idgarantia { get; set; }
        public string descripcion { get; set; }
        public string soporte { get; set; }
        public string inventario_idiventario { get; set; }
    }
}