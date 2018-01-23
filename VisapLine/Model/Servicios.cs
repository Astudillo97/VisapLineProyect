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
        public DataTable crearsertv(string ip, int varcontra, string varestrato, string varestadp, string varreferenci, int varpuntos,string vardireccion,int barrio) {
            DataTable idpunto = data.ConsultarDatos("select * from pr_insertarpunto("+ vardireccion + ","+ barrio + ")").Rows[0].ToString();
            return data.ConsultarDatos("select * from pr_insertarserviciootro('" + ip + "','2017-01-01'," + varcontra + " ,'" + varestrato + "' ,'" + varestadp + "','" + varreferenci + "'," + varpuntos + ")");
        }
        public DataTable consultaservicioscont(int contrato) {
            return data.ConsultarDatos("select * from pr_consultarservicios("+ contrato + ")");
        }
        public DataTable consultarserivcioid( int i) {
            return data.ConsultarDatos("select * from servicios where idservicios="+i+"");
        }
    }
   
}