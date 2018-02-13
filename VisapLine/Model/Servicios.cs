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

        public DataTable consultaequipoasigando(string idequipo)
        {
            return data.ConsultarDatos("select * from pr_consultarinventarioid(" + idequipo + ")");
        }
        public DataTable crearservicio(string ip, int varcanmeg, int varcontra, string varestrato, string varestadp, string varreferenci, int varinvern, string vardireccion, int barrio)
        {
            string idpunto = data.ConsultarDatos("select * from pr_insertarpunto('" + vardireccion + "'," + barrio + ")").Rows[0][0].ToString();
            return data.ConsultarDatos("select * from pr_insertarservicio('" + ip + "','2017-01-01'," + varcanmeg + "," + varcontra + " ,'" + varestrato + "' ,'" + varestadp + "','" + varreferenci + "'," + idpunto + "," + varinvern + ")");
        }
        public DataTable crearsertv(string ip, int varcontra, string varestrato, string varestadp, string varreferenci, string vardireccion, int barrio) {
            string idpunto = data.ConsultarDatos("select * from pr_insertarpunto('" + vardireccion + "'," + barrio + ")").Rows[0][0].ToString();
            return data.ConsultarDatos("select * from pr_insertarserviciootro('" + ip + "','2017-01-01'," + varcontra + " ,'" + varestrato + "' ,'" + varestadp + "','" + varreferenci + "'," + idpunto + ")");
        }
        public DataTable consultaservicioscont(int contrato) {
            return data.ConsultarDatos("select * from pr_consultarservicios(" + contrato + ")");
        }
        public DataTable consultaservicioscont1(string contrato)
        {
            return data.ConsultarDatos("select * from pr_consultarservicios(" + contrato + ")");
        }
        public DataTable consultarserivcioid(int i) {
            return data.ConsultarDatos("select * from pr_consultartodoservicio(" + i + ")");
        }

        public bool actualizarservicio(int id, string ip, int varcanmeg, string varestrato, string varestadp, string varreferenci, string vardireccion, int barrio)
        {
            string idpunto = data.ConsultarDatos("select * from pr_insertarpunto('" + vardireccion + "'," + barrio + ")").Rows[0][0].ToString();
            return data.OperarDatos("select * from pr_actualizarservicio(" + id + "," + varcanmeg + ",'" + varestrato + "','" + varestadp + "','" + varreferenci + "'," + idpunto + ",'" + ip + "')");
        }
        public bool cambiarequipo(string valorservi, string valorequipo) {
            return data.OperarDatos("select * from pr_cambiarequiposervicio(" + valorservi + "," + valorequipo + ")");
        }


        public DataTable consultaserviciosid(string id)
        {
            return data.ConsultarDatos("select * from pr_consultarservicioid('"+id+"')");

        }


    }

}