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
        public string estado { get; set; }
        public string correo { get; set; }

        public bool RegistrarPersonal(Personal pers)
        {
            return data.OperarDatos(" select * from public.pr_insertarpersonal('"+pers.identificacion+ "','"+pers.nombre+ "','" + pers.apellido + "', '" + pers.fechanac + "', '" + pers.rh + "', '" + pers.usuario_idusuario + "','" + pers.estado + "','" + pers.correo + "')");
        }
        public bool ActualizarPersonal( Personal pers)
        {
            return data.OperarDatos("select * from public.pr_actulizarpersonal('" + pers.idpersonal + "','" + pers.identificacion + "','" + pers.nombre + "','" + pers.apellido + "','" + pers.fechanac + "','" + pers.rh + "', '" + pers.estado + "', '" + pers.correo + "')");
        }
        public DataTable ConsultarPersonalIdentf(Personal pers)
        {
            return data.ConsultarDatos("SELECT * from public.pr_consultarppersona('"+pers.identificacion+"');");
        }
    }
}