using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;


namespace VisapLine.Model
{

    public class Egreso
    {
        IData data = new Data();

        public string idegresos { get; set; }
        public string valoregreso { get; set; }
        public string fechaegreso { get; set; }
        public string tercero_idtercero_reg { get; set; }
        public string motivo_idtercero_egre { get; set; }
        public string observacion { get; set; }
        public string caja_idcaja_egre { get; set; }

        public DataTable Registraregreso(Compra comp)
        {
            return data.ConsultarDatos("");
        }
    }


}
