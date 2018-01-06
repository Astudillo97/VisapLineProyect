using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Historico
    {
        IData data = new Data();
        public string idhistorico { get; set; }
        public string plan { get; set; }
        public string servicios_idservicios { get; set; }
    }
}