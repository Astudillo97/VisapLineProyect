using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class consultadefactura : System.Web.UI.Page
    {
        Factura fac = new Factura();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                select.DataSource = fac.listEstado();
                select.DataValueField = "estado1";
                select.DataTextField = "estado2";
                select.DataBind();
            }
        }

        protected void BuscarByEstado(object sender, EventArgs e)
        {
            repetidor.DataSource= fac.ListadoFacturaByEstado(select.SelectedValue,fecha1_.Text,fecha2_.Text);
            repetidor.DataBind();
        }
    }
}