using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class OrdenSalida
    {
        IData data = new Data();
        public string idordensalidacabe { get; set; }
        public string codigo { get; set; }
        public string detalle { get; set; }
        public string observacion { get; set; }
        public string personal_idpersonal_registra { get; set; }
        public string personal_idpersonal_atiende { get; set; }
        public string servicios_idservicios { get; set; }
        public DataTable Insertar(string detalle, string observacion, string tipoorden, int tercereg)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_insertarordenldiff('" + detalle + "','" + observacion + "'," + tercereg + ",'" + tipoorden + "')");
        }
        public DataTable Insertarsolicitud(string vardetalle,string varobservacion ,int  varregistra ,int  varservicio ,string   vartipoorden )
        {
            //sirve
            return data.ConsultarDatos("select * from pr_insertarordensolicitud('"+vardetalle+"', '"+varobservacion+"' ,  "+varregistra+" ,  "+varservicio+" ,   '"+vartipoorden+"' )");
        }
        public DataTable Consultarorden(string id)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarcrdenvista('" + id + "')"); ;
        }
        public DataTable megas(string id)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarsordenepresi('" + id + "')"); ;
        }
        public DataTable Consultarordentrab(string id)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarcrdenvistatrab('" + id + "')"); ;
        }
        public DataTable cosnutlarlefonosorden(string id)
        {
            //sirve
            return data.ConsultarDatos("select telefono from telefono where terceros_idterceros=" + id + "");
        }
        public DataTable Consultardetalleordesali(string id)
        {
            //sirve
            return data.ConsultarDatos("SELECT * from public.pr_consultardetalleordensa('" + id + "')");
        }
        public DataTable consultarinventario(int tipoinv)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarinventariotipo(" + tipoinv + ")");
        }
        public DataTable ConsultarFechas(string fhec1, string fech2, bool estado)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarordenfech('" + fhec1 + "','" + fech2 + "'," + estado + ")");
        }

        public DataTable ConsultarEstado(bool estado)
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarordenestado(" + estado + ")");
        }
        public DataTable buscartecnicos()
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultarempleados()");
        }
        public DataTable buscartempleados()
        {
            //sirve
            return data.ConsultarDatos("select * from pr_consultaremple()");
        }
        public bool asignartecnico(string valor, string valor2)
        {
            //sirve
            DataTable dt = data.ConsultarDatos("select * from pr_asignartecnicoaorden('" + valor + "','" + valor2 + "')");
            if (int.Parse(dt.Rows[0][0].ToString()) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool Cerrarorden(string valor)
        {
            //sirve
            DataTable dt = data.ConsultarDatos("select * from pr_cerrarorden('" + valor + "')");
            if (int.Parse(dt.Rows[0][0].ToString()) > 0)
            {
                return true;
            }
            else
            {
                return false;  
            }
        }
        public DataTable Consultarinstalacionesdeldia() {
            return data.ConsultarDatos("select * from pr_consultarsordenesdeldia()");
        }
        public DataTable Consultarviablidadesdeldia()
        {
            return data.ConsultarDatos("select * from pr_consultarsordenesviabilidad()");
        }
        public DataTable Consultartrabajosdeldia()
        {
            return data.ConsultarDatos("select * from pr_consultarsordenesdetrabajo()");
        }
        public DataTable crearsolicitudes(string vartiposolicitud ,string vardetalle ,string varfechainicio ,string varfechafin ,string varmediodesolicitud ,string  vardocumento ,string varnombresolic ,string varapellidosolic ,int varservicio ,string varterceros ,bool  varrestado)
        {
            return data.ConsultarDatos("select * from pr_insertarsolicitud("+ vartiposolicitud + ",'"+ vardetalle + "','"+ varfechainicio + "','"+ varfechafin + "',current_date," + varmediodesolicitud + ",'"+ vardocumento + "','"+ varnombresolic + "','"+ varapellidosolic + "',"+ varservicio + ",'"+ varterceros + "','"+ varrestado + "')");
        }
        public DataTable Consultarordenesencuro()
        {
            return data.ConsultarDatos("select * from pr_consultarsordenesencurso()");
        }
        public DataTable Consultarordenescerradas()
        {
            return data.ConsultarDatos("select * from pr_consultarsordenesfinalizadas()");
        }
        public DataTable ConsultarIdservicio(string dat)
        {
            return data.ConsultarDatos("select * from pr_consultaridservicioorden('"+dat+"')");
        }
        public DataTable ConsultarByservicio(string dat)
        {
            return data.ConsultarDatos("SELECT * FROM pr_consultarordennesidserv("+dat+")");
        }
    }
}