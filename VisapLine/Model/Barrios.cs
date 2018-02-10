using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Barrios
    {
        IData data = new Data();
        public string idbarrios { get; set; }
        public string barrios { get; set; }
        public string muninicio_idmunicipio { get; set; }

        public string zona_idzona { get; set; }
        public DataTable ConsultarBarriosIdMunicipio(Barrios bar)
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultarbarrio('"+bar.muninicio_idmunicipio+"');");
        }

        public bool RegistrarBarrios(Barrios bar)

        {
            return data.OperarDatos("select * from pr_insertarbarriozona('"+bar.barrios+"','"+bar.muninicio_idmunicipio+"','"+bar.zona_idzona+"')");
        }

        public DataTable ConsultarTodoporBarrio(Barrios bar)
        {
            return data.ConsultarDatos("select * from pr_consultarttododebarrio('"+bar.idbarrios+"');");
        }
        public DataTable ConsultarBarriosIdMunicipioint(int bar)
        {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultarbarrio('" + bar + "');");
        }

        public DataTable Consultarbarriosidbarrios(Barrios bar)
        {
            return data.ConsultarDatos("Select * from pr_consultarbarrioidbarrio('" + bar.idbarrios + "')");
        }
        
        public DataTable ConsultarbarriosAll()
        {
            return data.ConsultarDatos(" select * from pr_consultarbarrio()");
        }
        public void eliminar(int x)
        {
            data.OperarDatos("select * from pr_borrarbarrios(" + x + ")");
        }
    }

}