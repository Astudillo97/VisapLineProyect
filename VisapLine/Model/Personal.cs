using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Personal
    {
        IData data = new Data();
        public string idpersonal { get; set; }
        public string identificacion { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string fechanac { get; set; }
        public string rh { get; set; }
        public string usuario_idusuario { get; set; }
        
    }
}