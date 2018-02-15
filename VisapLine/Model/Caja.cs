using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
namespace VisapLine.Model
{
    public class Caja
    {
        IData data = new Data();

        public string idcaja { get; set; }
        public string apertura { get; set; }
        public string cierre { get; set; }
        public string estado { get; set; }
        public string ingresos { get; set; }
        public string egreso { get; set; }
        public string terceros_idterceros_reg_caj { get; set; }

        public DataTable RegistrarCaja(Compra comp)
        {
            return data.ConsultarDatos("");
        }

        public DataTable ConsultarCaja()
        {
            return data.ConsultarDatos("select * from public.pr_consultarcaja()");
        }


        public bool AbrirCaja(Caja cj)
        {
            return data.OperarDatos("select * from  pr_insertarcaja('"+cj.terceros_idterceros_reg_caj+"')");
        }

        public bool CerrarCaja()
        {
            return data.OperarDatos("select * from pr_actualizarcajacerrar()");
        }




    }
}