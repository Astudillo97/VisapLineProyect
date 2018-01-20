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

        public bool RegistrarPlanSCatact(int servicios_idservicios, int caracteristicas_idcaracteristicas, int cantidad)
        {
            return data.OperarDatos("SELECT * from public.pr_insertarplanserhascarac("+ servicios_idservicios + ","+ caracteristicas_idcaracteristicas + ","+ cantidad + ")");
        }
        public bool registrarpuertos(int servicios_idservicios, int cantidad)
        {
            return data.OperarDatos("INSERT INTO public.planservicios_has_caracteristicas(caracteristicas_idcaracteristicas,cantidad, servicio_idservicio) VALUES((select idcaracteristicas from caracteristicas where caracteristica = 'PUNTOS'),"+ cantidad + ", "+ servicios_idservicios + "); ");
        }
    }
}