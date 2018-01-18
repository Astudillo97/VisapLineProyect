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
        public string menu_idmenusub { get; set; }
        public string icono { get; set; }

        public DataTable ConsultarMenu()
        {
            return data.ConsultarDatos("");
        }

        public DataTable ConsultarMenuSubmenu(Menu men)
        {
            return data.ConsultarDatos("select * from pr_consularmenusub("+men.menu_idmenusub+")");
        }

        public bool RegistrarMenu(Permisos per)
        {
            return data.OperarDatos("");
        }
    }
}