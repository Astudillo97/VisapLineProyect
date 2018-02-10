using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class DetalleCompra
    {
        IData data = new Data();
        public string iddetallecompra { get; set; }
        public string compra_idocompra { get; set; }
        public string personal_idepersonal { get; set; }
        public bool registrarproducto(string serial,string descripcion,string tipoproducto,string vidautil,string modeloequipo,string mac,string cantidad,string compra) {
            string producto = data.ConsultarDatos("select * from pr_insertarinventario('"+ serial+"','"+descripcion+"',"+tipoproducto+",'"+vidautil+"','DISPONIBLE',"+ modeloequipo+",'"+ mac+"')").Rows[0][0].ToString();
            return data.OperarDatos("select * from pr_insertardetallecompra("+ producto + ","+ compra + ","+ cantidad + ")");
        }
        public bool resgistrarinsumo(string compra,string producto,string cantidad) {
            return data.OperarDatos("select * from pr_insertardetallecompra("+producto+","+compra+","+cantidad+")");
        }
        public DataTable cosultarequipoararegistro(string idtipo)
        {
            return data.ConsultarDatos("SELECT * from public.pr_consultarinventariotipo("+ idtipo + ")");
        }
        public DataTable cosultardetalle(string idtipo)
        {
            return data.ConsultarDatos("SELECT * from public.pr_consultardetallecomra(" + idtipo + ")");
        }
        public bool eliminardetalle (string idtipo)
        {
            return data.OperarDatos("SELECT * from public.pr_borrardetallecompra(" + idtipo + ")");
        }

    }
}