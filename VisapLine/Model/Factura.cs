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
        public DataTable ConsultarFacturaIdContrato(Factura fac)
        {
            return data.ConsultarDatos("select * from pr_consultarfacturaidcontrato(" + fac.contrato_idcontrato + ")");
        }

        public bool RegistrarFactura(Factura fac)
        {
            return data.OperarDatos("select * from pr_insertarfactura(0001212121283,'"+fac.fechaemision+"','"+fac.fechavencimiento+"','"+fac.fechacorte+"',"+fac.ConsultarsecueniciaContrato()+",'"+fac.estado+"','"+fac.cuotas+"',"+fac.contrato_idcontrato+")");
        }

        public int ConsultarsecueniciaContrato()
        {
            DataRow dat = data.ConsultarDatos("select * from pr_consultarfacturasecuencia()").Rows[0];
            return Convert.ToInt32(dat["facturaventacol"].ToString());
        }
    }
}