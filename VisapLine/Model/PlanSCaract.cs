using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class PlanSCaract
    {
        IData data = new Data();
        public string idplanscaract { get; set; }
        public string planservicio_idplanservicio { get; set; }
        public string caracteristicas_idcaracteristicas { get; set; }
        public string cantidad { get; set; }
        public string servicios_idservicios { get; set; }
        public string ordensalida_idordensalida { get; set; }

        public DataTable ConsultarPlanSCatact(PlanSCaract bar)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPlanSCatact(PlanSCaract bar)
        {
            return data.OperarDatos("");
        }
    }
}