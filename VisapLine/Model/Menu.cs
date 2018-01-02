using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Menu
    {
        IData data = new Data();
        public string idmenu { get; set; }
        public string nombre { get; set; }
        public string href { get; set; }

        public DataTable ConsultarMenu()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarMenu(Permisos per)
        {
            return data.OperarDatos("");
        }
    }
}