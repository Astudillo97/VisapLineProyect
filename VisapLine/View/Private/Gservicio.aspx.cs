using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
namespace VisapLine.View.Private
{
    public partial class Gservicio : System.Web.UI.Page
    {
        OrdenSalida ord = new OrdenSalida();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DataTable consulta = ord.Consultarorden("INS-22412018");
                formordenes.DataSource= consulta;
                formordenes.DataBind();
                Llenargrid(consulta.Rows[0][7].ToString());
                llenardetalle();
            }
        }
        protected void Llenargrid(string dato) {
            gridtelefono.DataSource = ord.cosnutlarlefonosorden(dato);
            gridtelefono.DataBind();
        }
        protected void llenardetalle()
        {
            GridViewdeta.DataSource = ord.Consultardetalleordesali("INS-22412018");
            GridViewdeta.DataBind();
        }
    }
}