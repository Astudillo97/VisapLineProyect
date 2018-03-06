using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{

    public class Soportes
    {
        IData data = new Data();
        public string idsoporte { get; set; }
        public string soportes { get; set; }
        public string contrato_idcontrato { get; set; }
        public string tiposoporte_idtiposoporte { get; set; }


        public DataTable ConsultarSoportes()
        {
            return data.ConsultarDatos("select * from pr_consultarsoportescont()");
        }

        public bool RegistrarSoportes(Soportes sop)
        {
            return data.OperarDatos("select * from public.pr_insertarsoporte('"+sop.soportes+"','"+sop.contrato_idcontrato+"','"+sop.tiposoporte_idtiposoporte+"')");
        }
        public DataTable ConsultarSoportesidcontrato(Soportes sop)
        {
            return data.ConsultarDatos("select* from pr_consultarsoportescontload('"+sop.contrato_idcontrato+"')");
        }

        public DataTable ConsultarSoportescargados()
        {
            return data.ConsultarDatos("select* from pr_consultarsoportescontcargado()");
        }

       

    }
}