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

        public DataTable ConsultaSiigo(string fecha1, string fecha2)
        {
            return data.ConsultarDatos("select t.identificacion, (SELECT extract(YEAR FROM f.fechaemision)) as anioinicio,(SELECT extract(MONTH FROM f.fechaemision)) as mesinicio,(SELECT extract(DAY FROM f.fechaemision)) as diainicio, (SELECT extract(YEAR FROM f.fechavencimiento)) as aniovence,(SELECT extract(MONTH FROM f.fechavencimiento)) as mesvence,(SELECT extract(day FROM f.fechavencimiento)) as diavence, concat(t.nombre,' ',t.apellido) as nombre, p.detalle as plan, f.facturaventa, (f.totalfac-ivafac- case when  ca.valor is null then 0 else (CASE WHEN ca.ESTADOCA='EFECTUADO' THEN CA.VALOR ELSE 0 END) end) as valor,  CA.ESTADOCA AS APLICA, ca.valor as saldo, c.iva,f.ivafac as ivavalor,f.totalfac as total  from factura f inner join contrato c on f.contrato_idcontrato=c.idcontrato inner join plan p on c.plan_idplan=p.idplan inner join terceros t on c.terceros_idterceros_cont=t.idterceros left join cargoadicional ca on ca.contrato_idcontrato_cargo=c.idcontrato where f.fechaemision between '" + fecha1+"' and '"+fecha2+ "' order by f.facturaventa asc");
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
            return data.OperarDatos("select * from pr_actualizarfactura('" + fac.fechaemision+"', '"+fac.fechavencimiento+"', '"+fac.fechacorte+"', '"+fac.estado+"', '"+fac.cuotas+"', '"+fac.facturaventa+"', '"+fac.valor+"', '"+fac.saldo+"', '"+fac.iva+"', '"+fac.total+"','"+fac.idfactura+"')");
        }
        public DataTable ListadoFacturaByEstado(string datainput, string fecha1, string fecha2)
        {
            string input = "where";
            string datafecha = " f.fechaemision between (SELECT DATE (EXTRACT(YEAR FROM current_date)||'-'||EXTRACT(MONTH FROM current_date)||'-'||(select extract (day from (select date_trunc('month', current_date) - interval '1 month'))))) and (SELECT DATE (EXTRACT(YEAR FROM current_date)||'-'||EXTRACT(MONTH FROM current_date)||'-'||(select extract (day from (select date_trunc('month', current_date) + interval '1 month') - interval '1 day'))))";
            if (datainput!="Seleccione")
            {
                input = input+ " f.estado ='"+ datainput+"' and ";
            }
            else
            {

            }
            if (fecha1!=""  && fecha2!="")
            {
                datafecha = " f.fechaemision between '" + fecha1 + "' and '" + fecha2 + "'";
            }
            else
            {
                datafecha = " f.fechaemision between (SELECT DATE (EXTRACT(YEAR FROM current_date)||'-'||EXTRACT(MONTH FROM current_date)||'-'||(select extract (day from (select date_trunc('month', current_date) - interval '1 month'))))) and (SELECT DATE (EXTRACT(YEAR FROM current_date)||'-'||EXTRACT(MONTH FROM current_date)||'-'||(select extract (day from (select date_trunc('month', current_date) + interval '1 month') - interval '1 day'))))";
            }
            return data.ConsultarDatos("SELECT f.facturaventa as FS, t.identificacion as identificacion, concat(t.nombre,' ',t.apellido) as nombre, CONCAT(T.direccion,'/',b.barrios) as direccion, tl.telefono as telefono, tt.tipoterceros AS tipoterceros FROM factura f inner join contrato c on f.contrato_idcontrato=c.idcontrato inner join plan p on c.plan_idplan=p.idplan inner join terceros t on c.terceros_idterceros_cont=t.idterceros inner join barrios b on b.idbarrios=t.barrio_idbarrio left join telefono tl on tl.terceros_idterceros=t.idterceros left join cargotercero ca on ca.terceros_idterceros=t.idterceros left join tipotercero tt on tt.idtipotercero=ca.tipotercero_idtipotercero "+input+" "+datafecha);
        }

        public DataTable listEstado()
        {
            return data.ConsultarDatos("select estado as estado1,estado as estado2 from factura group by estado");
        }
    }
}