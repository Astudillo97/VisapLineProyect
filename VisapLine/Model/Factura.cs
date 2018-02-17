using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Factura
    {
        IData data = new Data();
        public string idfactura { get; set; }
        public string Referenciapago { get; set; }
        public string fechaemision { get; set; }
        public string fechavencimiento { get; set; }
        public string fechacorte { get; set; }
        public string facturaventa { get; set; }
        public string estado { get; set; }
        public string cuotas { get; set; }
        public string contrato_idcontrato { get; set; }
        public string valor { get; set; }
        public string iva { get; set; }
        public string saldo { get; set; }
        public string total { get; set; }
        public DataTable ConsultarFacturaIdContrato(Factura fac)
        {
            return data.ConsultarDatos("select * from pr_consultarfacturaidcontrato(" + fac.contrato_idcontrato + ")");
        }

        public bool RegistrarFactura(Factura fac)
        {
            return data.OperarDatos("select * from pr_insertarfactura(0001212121283,'"+fac.fechaemision+"','"+fac.fechavencimiento+"','"+fac.fechacorte+"',"+fac.ConsultarsecueniciaFactura()+",'"+fac.estado+"','"+fac.cuotas+"',"+fac.contrato_idcontrato+")");
        }

        public int ConsultarsecueniciaFactura()
        {
            DataRow dat = data.ConsultarDatos("select * from pr_consultarfacturasecuencia()").Rows[0];
            return Convert.ToInt32(dat["facturaventacol"].ToString());
        }
        public DataTable ConsultarFacturas(string inicio, string fin,string identf,string codigo,string caso)
        {
            return data.ConsultarDatos("select * from pr_consultarfacturabetwenfechas("+inicio+","+fin+","+identf+","+codigo+","+caso+")");
        }

        public DataTable ConsultarFacturaCodigo(Factura fac)
        {
            return data.ConsultarDatos("select * from pr_consultarfacturacodigo(" + fac.facturaventa + ")");
        }

        public DataTable ConsultarFacturabyContrato(Factura fac)
        {
            return data.ConsultarDatos("select * from pr_consultarfacturabycontrato('"+fac.contrato_idcontrato+"')");
        }

        public DataTable ConsultarFacturasRevision()
        {
            return data.ConsultarDatos("select * from factura where estado='Revision'; ");
        }
        public bool ActualizarFactura(Factura fac)
        {
            return data.OperarDatos("UPDATE public.factura SET fechaemision='"+fac.fechaemision+"', fechavencimiento='"+fac.fechavencimiento+"', fechacorte='"+fac.fechacorte+"', estado='"+fac.estado+"', cuotas='"+fac.cuotas+"', facturaventa='"+fac.facturaventa+"', valorfac='"+fac.valor+"', saldofac='"+fac.saldo+"', ivafac='"+fac.iva+"', totalfac='"+fac.total+"' WHERE idfactura='"+fac.idfactura+"'");
        }
    }
}