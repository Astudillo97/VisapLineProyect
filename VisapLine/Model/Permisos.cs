using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Permisos
    {
        IData data = new Data();
        public string idpermisos { get; set; }
        public string rol_idrol { get; set; }
        public string permisos{ get; set; }
        public string menu_idmenu { get; set; }

        public DataTable ConsultarPermisos()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPermisos(Permisos per)
        {
            return data.OperarDatos("select * from public.pr_insertarpermiso("+per.rol_idrol+",'"+per.permisos+"',"+per.menu_idmenu+")");
        }
        public DataTable ConsultarRolPermisos(Permisos per)
        {
            return data.ConsultarDatos("select * from pr_consularmenu(" + per.rol_idrol + ")");
        }
    }
}