using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Inventario
    {
        IData data = new Data();
        public string idinventario { get; set; }
        public string serial { get; set; }
        public string descripcion { get; set; }
        public string tipoproducto_idtipoproducto { get; set; }
        public string vidautil { get; set; }
        public string estado { get; set; }
        public string modelo_idmodelo { get; set; }
        public string mac { get; set; }
        public string compra_idcompra { get; set; }

        public bool RegistrarInventario(Inventario inv)
        {
            return data.OperarDatos("select * from pr_insertarinventario('"+inv.serial+ "','" + inv.descripcion + "','" + inv.tipoproducto_idtipoproducto + "','" + inv.vidautil + "','" + inv.estado + "','" + inv.modelo_idmodelo + "','" + inv.mac + "','" + inv.compra_idcompra + "')");
        }

        public DataTable selecionarinventarioparaservicio() {
            return data.ConsultarDatos("SELECT * FROM public.pr_consultarinventarioPROCE()");
        }

        public DataTable consultarinventario() {
            return data.ConsultarDatos("select * from pr_consultarinventario()");
        }

        public bool cancelarselecioninventarion(int datoacancelar) {
            return data.OperarDatos("select * from pr_calcelarinventarioproce("+ datoacancelar + ")");
        }
    }
}