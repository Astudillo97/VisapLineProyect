using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Detalle
    {
        IData data = new Data();
        public string iddetalle { get; set; }
        public string cantidad { get; set; }
        public string valor { get; set; }
        public string factura_idfactura { get; set; }
        public string servicios_idservicios { get; set; }
        public string contrato_idcontrato { get; set; }
        public string cargoadicional_idcargoadicional { get; set; }

        public DataTable ConsultarDetalleIdFactura(Detalle det)
        {
            return data.ConsultarDatos("select * from pr_consultardetalleidfactura(" + det.factura_idfactura + ")");
        }
        public DataTable ConsultarDetalleIdFactura1(string factura_idfactura)
        {
            return data.ConsultarDatos("select * from pr_consultardetalleidfactura(" + factura_idfactura + ")");
        }

        public bool Creardetallefactura(string valor, string factura, string descripcion)
        {
            return data.OperarDatos("select * from pr_insertardetallefactura('1','" + valor + "','" + factura + "','" + descripcion + "')");

        }
        public bool Deletdetalle(string idcargo)
        {
            return data.OperarDatos("select * from pr_actualizarcargoadicionalestadoporefec('" + idcargo + "')");
        }

    }
}