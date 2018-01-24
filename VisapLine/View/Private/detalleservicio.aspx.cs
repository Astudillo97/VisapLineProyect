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
        Barrios dplb = new Barrios();
        Servicios srv = new Servicios();
        static DataTable btr = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                 Valor = Request.QueryString["addds"];
                cargardatos(int.Parse(Valor));
            }
            
        }
        protected void cargardatos(int id) {
            DataTable dtbsrv= srv.consultarserivcioid(id);
            dplb.muninicio_idmunicipio = dtbsrv.Rows[0][17].ToString();
            btr = dplb.ConsultarBarriosIdMunicipio(dplb);
            FormView1.DataSource = dtbsrv;
            FormView1.DataBind();
        }
        protected void llenardropmuni(DropDownList b) {
            DataTable dtbsrv = srv.consultarserivcioid(int.Parse(Valor));
            dplb.muninicio_idmunicipio = dtbsrv.Rows[0][17].ToString();
            btr = dplb.ConsultarBarriosIdMunicipio(dplb);
            b.DataSource = btr;
            b.DataTextField = "barrios";
            b.DataValueField = "idbarrios";
            b.DataBind();
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
            llenardropmuni((DropDownList)FormView1.FindControl("dropbarrio"));
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {

        }
    }
}