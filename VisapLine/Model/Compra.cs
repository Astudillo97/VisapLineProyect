using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Compra
    {
        IData data = new Data();
        public string idcompra { get; set; }
        public string fechapedido { get; set; }
        public string numeropedido { get; set; }
        public string fechallegada { get; set; }
        public string valor { get; set; }
        public string proveedor_idproveedor { get; set; }
        public string personal_idpersonal{get;set; }

        public DataTable RegistrarCompra( Compra comp)
        {
            //funciona
            return data.ConsultarDatos("select * from pr_insertarcompra('" + comp.fechapedido + "' ,'" + comp.numeropedido+"','"+comp.fechallegada+ "','" + comp.valor + "','" + comp.proveedor_idproveedor + "',"+comp.personal_idpersonal+")");
        }
        public bool ActualizarCompra(Compra comp)// cambiar el metodo
        {
            return false;
          //  return data.OperarDatos("select * from pr_actualizarrcompra('" + comp.idcompra + "', '" + comp.fechapedido + "','" + comp.numeropedido + "','" + comp.fechallegada + "','" + comp.valor + "','" + comp.personal_idpersonal + "')");
        }
        public bool EliminarCompra(Compra comp)
        {
            return data.OperarDatos("");
        }
        public DataTable ConsultarCompraByNumero(string comp)
        {
            return data.ConsultarDatos("select * from pr_consultarrcompra('"+ comp + "')");
        }
        public DataTable ConsultarCompraById(Compra comp)
        {
            return data.ConsultarDatos("");
        }
        public DataTable ConsultarCompraByProveedor(Compra comp)
        {
            return data.ConsultarDatos("");
        }
        public DataTable ConsultarComprar()
        {
            // funciona
            return data.ConsultarDatos("select * from pr_consultarrcompra()");
        }
    }
}