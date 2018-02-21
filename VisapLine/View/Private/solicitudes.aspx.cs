using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class solicitudes : System.Web.UI.Page
    {
        Servicios serv = new Servicios();
        static int idsrv;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    idsrv = int.Parse(Request.QueryString["key"]);
                    cargar();
                    repetidorsolicitudes.DataSource = serv.consultarsolicitudes();
                    repetidorsolicitudes.DataBind();
                }
            }
            catch (Exception ex)
            {
                nocargar();
            }
        }

        private void cargar()
        {
            repetidorsolicitudes.DataSource = serv.consultarsolicitudes();
            repetidorsolicitudes.DataBind();
        }
        private void nocargar()
        {
            pan1.Visible = false;
            Creacion.Attributes.Add("clas", "tab-pane");
            repetidorsolicitudes.DataSource = serv.consultarsolicitudes();
            repetidorsolicitudes.DataBind();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {

        }
    }
}