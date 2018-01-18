using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Servicios
    {
        IData data = new Data();
        public string idservicios { get; set; }
        public string fechainicio { get; set; }
        public string cantidadmegas { get; set; }
        public string contrato_idcontrato { get; set; }
        public string estado { get; set; }
        public string estrato { get; set; }
        public string referencias { get; set; }
        public string puntos_idpuntos { get; set; }
        public string planservicios_idplanservicios { get; set; }
        public string inventario_idinventarios { get; set; }

        public DataTable crearservicio(string ip,int varcanmeg , int varcontra ,string varestrato ,string varestadp,string varreferenci ,int varpuntos ,int  varinvern )
        {
            return data.ConsultarDatos("select * from pr_insertarservicio('"+ip+"','2017-01-01',"+varcanmeg+","+varcontra+" ,'"+varestrato+"' ,'"+varestadp+"','"+varreferenci+"',"+varpuntos+","+varinvern+")");
        }
    }
   
}