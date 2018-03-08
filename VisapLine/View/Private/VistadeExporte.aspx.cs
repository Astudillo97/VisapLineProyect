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
        public static DataTable tablefactura;
        public static DataTable exportsiigo;
        excel drexcel = new excel();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack) {
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("codigocomprobante");
                exportsiigo.Columns.Add("numerodocumento");
                exportsiigo.Columns.Add("cuentacontable");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                exportsiigo.Columns.Add("tipocomprobante");
                
                tablefactura = fact.ConsultarFacturas("null::date", "null::date", "null::character varying", "null::integer", "4");
                for (int i = 0; i < tablefactura.Rows.Count; i++)
                {
                    tablefactura.Rows[i][""].ToString();
                    
                }
            }
        }
    }
}