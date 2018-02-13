using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Pagos
    {
        IData data = new Data();
        public string idpago { get; set; }
        public string fechapago { get; set; }
        public string factura_idfactura { get; set; }
        public string terceros_idterceros { get; set; }
        public string pagado { get; set; }

        public DataTable ConsultarPago(Pagos fac)
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPago(Pagos fac,string usuario,string ipregistro)
        {
            return data.OperarDatos("select * from pr_insertar_pagos('"+usuario+"','"+ipregistro+"','"+fac.factura_idfactura+"','"+fac.terceros_idterceros+"','"+fac.pagado+"')");
        }

        public DataTable ConsultarPagoByIdFact(Pagos pag)
        {
            return data.ConsultarDatos("select * from pr_consultapagosidfact("+pag.factura_idfactura+")");
        }
    }
}