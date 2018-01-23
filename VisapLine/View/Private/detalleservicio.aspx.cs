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
    public partial class detalleservicio : System.Web.UI.Page
    {
        static String Valor;
        Servicios srv = new Servicios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                 Valor = Request.QueryString["addds"];
                cargardatos(int.Parse(Valor));
            }
            
        }
        protected void cargardatos(int id) {
            DataTable dtbsrv= srv.consultarserivcioid(id);
            FormView1.DataSource = dtbsrv;
            FormView1.DataBind();
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            FormView1.PageIndex = e.NewPageIndex;
            cargardatos(int.Parse(Valor));
        }

        protected void FormView1_ModeChanging(object sender, FormViewModeEventArgs e)
        {
            FormView1.ChangeMode(e.NewMode);
            cargardatos(int.Parse(Valor));
        }
    }
}