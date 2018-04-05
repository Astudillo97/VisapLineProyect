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
    public class Pagos
    {
        IData data = new Data();
        public string idpago { get; set; }
        public string fechapago { get; set; }
        public string factura_idfactura { get; set; }
        public string terceros_idterceros { get; set; }
        public string pagado { get; set; }
        public string contrato_idcontrato { get; set; }
        public string caja_idcaja_ingr { get; set; }
        public string tipopago_idtipopago { get; set; }
        public string banco_idbanco { get; set; }
        public string referencia { get; set; }

        public DataTable ConsultarPago(Pagos fac)
        {
            return data.ConsultarDatos("");
        }

        public DataTable RegistrarPago(Pagos fac, string usuario, string ipregistro,string retencion)
        {
            return data.ConsultarDatos("select * from pr_insertar_pagos('" + usuario + "','" + ipregistro + "','" + fac.factura_idfactura + "','" + fac.terceros_idterceros + "','" + fac.pagado + "','" + obtenercaja() + "','"+retencion+"','"+fac.tipopago_idtipopago+"',"+fac.banco_idbanco+","+fac.referencia+")");
        }

        public DataTable ConsultarPagoByIdFact(Pagos pag)
        {
            return data.ConsultarDatos("select * from pr_consultapagosidfact(" + pag.factura_idfactura + ")");
        }
        public DataTable ConsultarPagosidcontrato(Pagos pag)
        {
            return data.ConsultarDatos(" select * from pr_consultarpagos("+pag.contrato_idcontrato+")");
        }
        public DataTable ConsultarPagoByIdPago(Pagos pag)
        {
            return data.ConsultarDatos("select * from pr_consultapagosidfact(" + pag.factura_idfactura + ")");
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