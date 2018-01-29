using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class DetalleSalida
    {
        IData data = new Data();
        public string idordensalida { get; set; }
        public string cantidad { get; set; }
        public string estado { get; set; }
        public string ordensalida_idordensalida { get; set; }
        public string inventario_idinventario { get; set; }
        public DataTable insertardetallesalida(string cant,string inven, string orden) {
            return data.ConsultarDatos("select * from pr_insertardetallesalida("+cant+",'"+ orden + "',"+ inven + ")"); 
        }
    }
}