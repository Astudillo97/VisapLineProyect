using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
namespace VisapLine.Model
{
    public class Plan
    {
        IData data = new Data();
        public string idplan { get; set; }
        public string valor { get; set; }
        public string detalle { get; set; }
        public string telefonia { get; set; }
        public string televicion { get; set; }
        public string internet { get; set; }
        public string estado { get; set; }
        public string tipoplan { get; set; }
        public string subida { get; set; }
        public string bajada { get; set; }
        public string medioconexion { get; set; }
        public string wifi { get; set; }
        public string zona_idzona { get; set; }

        public string idtercero_idtercero { get; set; }



        public DataTable ConsultarPlan()
        {
            return data.ConsultarDatos("select * from pr_consultarpplan()");
        }


        public bool RegistrarPlan(Plan pln)
        {
            return data.OperarDatos("select * from pr_insertarplan('"+pln.valor+"','"+pln.detalle+"','"+pln.telefonia+"','"+pln.televicion+"','"+pln.internet+"','"+pln.estado+"','"+pln.tipoplan+"','"+pln.subida+"','"+pln.bajada+"','"+pln.zona_idzona+ "','" + pln.medioconexion + "','" + pln.wifi + "')");
        }


        public DataTable ConsultarPlantipoterce(Plan pln)
        {
            return data.ConsultarDatos("select * from pr_consultarplanestipoter('"+pln.idtercero_idtercero+"')");
        }

    }


  


}