using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;
using VisapLine.Exeption;

namespace VisapLine.Model
{

    public class Egreso
    {
        IData data = new Data();
        public string idegresos { get; set; }
        public string valoregreso { get; set; }
        public string fechaegreso { get; set; }
        public string tercero_idtercero_reg { get; set; }
        public string tercero_idtercero_egre { get; set; }
        public string motivo_idtercero_egre { get; set; }
        public string observacion { get; set; }
        public string caja_idcaja_egre { get; set; }

        public DataTable Registraregreso(Egreso eg,string usuario, string ipregistro)
        {
            return data.ConsultarDatos("select * from public.pr_insertar_egresos('"+usuario+"','"+ipregistro+"','"+eg.motivo_idtercero_egre+"','"+eg.tercero_idtercero_reg+"','"+eg.tercero_idtercero_egre+"','"+eg.observacion+"','"+eg.valoregreso+"','"+ obtenercaja() + "')");
        }
        public DataTable consultaregresos(Egreso eg)
        {
            return data.ConsultarDatos("select * from pr_consultaregresos('"+eg.caja_idcaja_egre+"')");
        }
        string obtenercaja()
        {
            DataRow dat = data.ConsultarDatos("select * from pr_consultarcaja()").Rows[0];
            if (dat["estado"].ToString() == "True")
            {
                return dat["idcaja"].ToString();
            }
            throw new ValidarExeption("No hay cajas activas");
        }




    }


}
