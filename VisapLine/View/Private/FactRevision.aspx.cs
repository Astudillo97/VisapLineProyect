using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class FactRevision : System.Web.UI.Page
    {
        Factura fact = new Factura();
        static DataTable data;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                data=fact.ConsultarFacturasRevision();
                listfactRevision.DataSource = data;
                listfactRevision.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void listfactRevision_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Response.Redirect("EditarFactura.aspx?key=" + data.Rows[e.NewSelectedIndex]["idfactura"].ToString());
        }
    }
}