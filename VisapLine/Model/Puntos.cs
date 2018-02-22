using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Puntos
    {
        IData data = new Data();
        public string idpunto { get; set; }
        public string estado { get; set; }
        public string direccion { get; set; }
        public string coordenadaslat { get; set; }
        public string coordenadaslong { get; set; }
        public string barrios_idbarrios { get; set; }
        public string tipo { get; set; }

        public DataTable ConsultarPuntosllenos()
        {
            return data.ConsultarDatos("select t.identificacion as id, concat(t.nombre, ' ', t.apellido) as nombre, ST_X(ST_AsTEXT(p.coordenadas)) as CoordenadaX, ST_Y(ST_AsTEXT(p.coordenadas)) as CoordenadaY, t.direccion as direccion, b.barrios, s.estado, p.tipo from puntos p inner join servicios s on s.puntos_idpuntos = p.idpuntos inner join contrato c on c.idcontrato = s.contrato_idcontrato inner join terceros t on c.terceros_idterceros_cont = t.idterceros inner join barrios b on p.barrios_idbarrios = b.idbarrios where coordenadas is not null");
        }
        public DataTable ConsultarPuntosVacios()
        {
            return data.ConsultarDatos("select t.identificacion as identificacion, concat(t.nombre,' ',t.apellido) as nombre, ST_X(ST_AsTEXT(p.coordenadas)) as CoordenadaX, ST_Y(ST_AsTEXT(p.coordenadas)) as CoordenadaY, t.direccion as direccion, b.barrios, s.estado, p.tipo from puntos p inner join servicios s on s.puntos_idpuntos=p.idpuntos inner join contrato c on c.idcontrato=s.contrato_idcontrato inner join terceros t on c.terceros_idterceros_cont=t.idterceros inner join barrios b on p.barrios_idbarrios=b.idbarrios where coordenadas is null");
        }
        public DataTable RegistrarPuntos(Puntos punt)
        {
            return data.ConsultarDatos("select * from pr_insertarpunto('"+punt.estado+"','"+punt.direccion+"', '"+punt.coordenadaslat+"','"+punt.coordenadaslong+"',"+punt.barrios_idbarrios+",'"+punt.tipo+"')");
        }   
        public bool ActualizarPuntos(Puntos punt)
        {
            return data.OperarDatos("select * from pr_actualizarpunto('" + punt.estado + "','" + punt.direccion + "', '" + punt.coordenadaslat + "','" + punt.coordenadaslong + "'," + punt.barrios_idbarrios + ",'" + punt.tipo + "',"+punt.idpunto+")");
        }
    }
}