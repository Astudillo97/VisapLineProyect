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
        PlanSCaract psc = new PlanSCaract();
        public static DataTable dataeuipo;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Valor = Request.QueryString["addds"];
                cargardatos(int.Parse(Valor));
                DataTable caracteristicas = psc.ConsultarPlanSCatact(int.Parse(Valor));
                if (caracteristicas.Rows.Count>0) {
                    divcaracteristicas.Visible = true;
                    GridViewcaracter.DataSource = caracteristicas;
                    GridViewcaracter.DataBind();
                }
                ConsultarEquipo();
            }
        }

        protected void ConsultarEquipo() {
            repetidordecolumnar.DataSource = psc.ConsultarEquiposParaintalar();
            repetidordecolumnar.DataBind();
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
            if (e.CancelingEdit) {
                FormView1.ChangeMode(FormViewMode.ReadOnly);
                cargardatos(int.Parse(Valor));
            }
            else {
                FormView1.ChangeMode(e.NewMode);
                cargardatos(int.Parse(Valor));
                llenardropmuni((DropDownList)FormView1.FindControl("dropbarrio")); }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            Label idser =(Label)FormView1.FindControl("lblidup");
            TextBox referencia =(TextBox)FormView1.FindControl("txbrefup");
            TextBox direcip=(TextBox)FormView1.FindControl("txbipup");
            TextBox canmega=(TextBox)FormView1.FindControl("txbcmegup");
            DropDownList barrio=(DropDownList)FormView1.FindControl("dropbarrio");
            TextBox direcc=(TextBox)FormView1.FindControl("txbdirecup");
            TextBox estrato=(TextBox)FormView1.FindControl("txbestratoup");
            TextBox stado=(TextBox)FormView1.FindControl("txbestadoup");
            srv.actualizarservicio(int.Parse(idser.Text),direcip.Text,int.Parse(canmega.Text),estrato.Text,stado.Text,referencia.Text,direcc.Text,int.Parse(barrio.SelectedValue));
            FormView1.ChangeMode(FormViewMode.ReadOnly);
            cargardatos(int.Parse(Valor));
        }

        protected void volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("servicio.aspx");
        }
    }
}