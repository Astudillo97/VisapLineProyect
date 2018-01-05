using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class PlanServicios
    {
        IData data = new Data();
        public string idplanservicio { get; set; }
        public string tipo { get; set; }

        public DataTable ConsultarPlanServicios(PlanServicios pls)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPlanServicios(PlanServicios pls)
        {
            return data.OperarDatos("");
        }
    }
}