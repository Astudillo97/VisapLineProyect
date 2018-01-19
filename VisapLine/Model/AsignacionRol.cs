using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class AsignacionRol
    {
        IData data = new Data();
        public string idasignacionrol { get; set; }
        public string usuario_idusuario { get; set; }
        public string rol_idrol { get; set; }

        public bool RegistrarAsignacionRol(AsignacionRol arol)
        {
            return data.OperarDatos("select * from public.pr_insertarasigncionrol('"+arol.usuario_idusuario+"', '"+arol.rol_idrol+"')");
        }
    }
}