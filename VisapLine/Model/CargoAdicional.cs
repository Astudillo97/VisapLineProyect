using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
namespace VisapLine.Model
{
    public class CargoAdicional
    {
        IData data = new Data();
        public string idcargoadicional { get; set; }
        public string cantidad { get; set; }
        public string valor { get; set; }
        public string fecha { get; set; }
        public string inventario_idinventario { get; set; }
        public string personal_idpersonal { get; set; }
    }
}