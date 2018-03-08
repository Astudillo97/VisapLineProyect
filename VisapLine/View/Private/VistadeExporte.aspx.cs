using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.Model
{
    public partial class VistadeExporte : System.Web.UI.Page
    {
        Factura fact = new Factura();
        public static DataTable tablefactura=new DataTable();
        public static DataTable exportsiigo = new DataTable();
        excel drexcel = new excel();
        protected void Page_Load(object sender, EventArgs e)
        {
            exportsiigo.Rows.Clear();
            exportsiigo.Dispose();
            exportsiigo.Columns.Clear();
            exportsiigo.Columns.Add("numerodoc");
            exportsiigo.Columns.Add("cuentacontable");
            exportsiigo.Columns.Add("devitocredito");
            exportsiigo.Columns.Add("valorsecuencia");
            exportsiigo.Columns.Add("aniodoc");
            exportsiigo.Columns.Add("mesdoc");
            exportsiigo.Columns.Add("diadoc");
            exportsiigo.Columns.Add("secuencia");
            exportsiigo.Columns.Add("nit");
            exportsiigo.Columns.Add("descripcion");
            exportsiigo.Columns.Add("fromadepago");
            exportsiigo.Columns.Add("porcentageiva");
            exportsiigo.Columns.Add("valoriva");
            exportsiigo.Columns.Add("tipoconprobante");
            exportsiigo.Columns.Add("numerodocumentocruce");
            exportsiigo.Columns.Add("numerovencimiento");
            exportsiigo.Columns.Add("aniovencimiento");
            exportsiigo.Columns.Add("mesvencimeinto");
            exportsiigo.Columns.Add("diavenciemiento");

            llenarTabla();
        }
        public void llenarTabla()
        {
            tablefactura = fact.ConsultarFacturas("null::date", "null::date", "null::character varying", "null::integer", "4");
            for (int i = 0; i < tablefactura.Rows.Count; i++)
            {
                DataRow cel1 = exportsiigo.NewRow();
                cel1["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                DataRow cel2 = exportsiigo.NewRow();
                cel1["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                if (true)
                {

                }
                exportsiigo.Rows.Add(cel1);
                exportsiigo.Rows.Add(cel2);
            }
        }
    }
}