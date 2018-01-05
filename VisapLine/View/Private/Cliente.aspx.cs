using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class Cliente : System.Web.UI.Page
    {
        TipoTercero tpt = new TipoTercero();
        TipoFactura tpf = new TipoFactura();
        TipoResidencia tpr = new TipoResidencia();
        TipoDoc tpd = new TipoDoc();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}