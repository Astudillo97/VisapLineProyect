using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Terceros
    {
        IData data = new Data();
        public string idterceros { get; set; }
        public string identificacion { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string direccion { get; set; }
        public string correo { get; set; }
        public string estrato { get; set; }
        public string estado { get; set; }
        public string tipotercero_idtipotercero { get; set; }
        public string tipodoc_idtipodoc { get; set; }
        public string fechanatcimiento { get; set; }
        public string tiporesidencia_idtiporesidencia { get; set; }
        public string tipofactura_idtipofactura { get; set; }
        public string barrios_idbarrios { get; set; }
        public string usuario_idusuario { get; set; }

        public DataTable ConsultarTerceros()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarTerceros(Terceros per)
        {
            return data.OperarDatos("");
        }
    }
}