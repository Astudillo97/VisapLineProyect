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
    public partial class servicio : System.Web.UI.Page
    {
        Servicios srv = new Servicios();
        Inventario invt = new Inventario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DataTable dt =invt.selecionarinventarioparaservicio();
                listequipo.DataSource = dt;
                listequipo.DataBind();
            }
        }
    }
}