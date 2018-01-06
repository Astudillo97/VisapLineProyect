using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Modelo
    {
        IData data = new Data();
        public string idmodelo { get; set; }
        public string modelo { get; set; }
        public string fabricante_idfabricante { get; set; }

    }
}