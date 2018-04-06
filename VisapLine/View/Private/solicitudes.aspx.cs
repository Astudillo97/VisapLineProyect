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
    public partial class solicitudes : System.Web.UI.Page
    {
        Servicios serv = new Servicios();
        OrdenSalida ord = new OrdenSalida();
        public static int idsrv;
        public static string empleado;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    gridtecnicos.DataSource = ord.buscartempleados();
                    gridtecnicos.DataBind();
                    idsrv = int.Parse(Request.QueryString["key"]);
                    cargar();
                    repetidorsolicitudes.DataSource = serv.consultarsolicitudes();
                    repetidorsolicitudes.DataBind();
                    DataTable dt = serv.datosdeldueniodelseervicio(idsrv);
                    servicio.Text = dt.Rows[0][0].ToString() + " " + dt.Rows[0][1].ToString() + " " + dt.Rows[0][2].ToString();
                    dropdownTSoli.DataSource = serv.tsolicitud();
                    dropdownTSoli.DataValueField = "idtiposolicitud";
                    dropdownTSoli.DataTextField = "tiposolicitudcol";
                    dropdownTSoli.DataBind();
                    dropdownMSoli.DataSource = serv.mediosolicitud();
                    dropdownMSoli.DataValueField = "idmediodesolicitud";
                    dropdownMSoli.DataTextField = "mediodesolicitudcol";
                    dropdownMSoli.DataBind();
                }
            }
            catch (Exception ex)
            {
                nocargar();
            }
        }

        private void cargar()
        {
            pan1.Attributes.Add("class", "active");
            Creacion.Attributes.Add("class", "active tab-pane");
            repetidorsolicitudes.DataSource = serv.consultarsolicitudes();
            repetidorsolicitudes.DataBind();
        }
        private void nocargar()
        {
            pan1.Visible = false;
            Creacion.Attributes.Add("class", "tab-pane");
            pan2.Attributes.Add("class", "active");
            Solicitudes.Attributes.Add("class", "active tab-pane");
            repetidorsolicitudes.DataSource = serv.consultarsolicitudes();
            repetidorsolicitudes.DataBind();
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {

            int count = ord.crearsolicitudes(dropdownTSoli.SelectedValue, TextBox1.Text, fechIni_.Value, fechFin_.Value, dropdownMSoli.SelectedValue, Solicitanteidenti.Text, Solicitantenombre.Text, Solicitanteapellido.Text, idsrv, empleado, false).Rows.Count;
            if (dropdownTSoli.SelectedItem.Text.Equals("Cancelacion") && count > 0)
            {
                DataTable dt = ord.Insertarsolicitud("RECOJER EQUIPOS POR QUE EL CLIENTE DECIDE RETIRARSE", TextBox1.Text, 0, idsrv, "TRABAJO");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert('" + dt.Rows[0][0].ToString() + "');", true);
            }
            else
            {
                if (dropdownTSoli.SelectedItem.Text.Equals("Traslado") && count > 0)
                {
                    DataTable dt = ord.Insertarsolicitud("RECOJER EQUIPOS Y TRASLADAR EL SERVICIO", TextBox1.Text, 0, idsrv, "TRABAJO");
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert('" + dt.Rows[0][0].ToString() + "');", true);
                }
                else {
                    if (count > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "swal('SOLICITUD CREADA CON EXITO!', 'Su solicitud se creo con extio ', 'success', function () { location.reload() };", true);
                    }
                    else {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "swal('SOLICITUD FALLIDA!', 'No se pudo crear la solicitud ', 'error', function () { location.reload() };", true);
                    }
                }
            }

        }

        protected void dropsolicitante_TextChanged(object sender, EventArgs e)
        {
            DataTable dt = serv.datosdeldueniodelseervicio(idsrv);
            if (dropsolicitante.SelectedIndex == 1)
            {
                Solicitanteidenti.Text = dt.Rows[0][0].ToString();
                Solicitantenombre.Text = dt.Rows[0][1].ToString();
                Solicitanteapellido.Text = dt.Rows[0][2].ToString();
            }
            else
            {
                Solicitanteidenti.Text = "";
                Solicitantenombre.Text = "";
                Solicitanteapellido.Text = "";
            }
        }

        protected void gridtecnicos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            GridViewRow row = gridtecnicos.Rows[e.NewSelectedIndex];
            empleado = row.Cells[1].Text;
            lblatendio.Text = row.Cells[1].Text + " " + row.Cells[2].Text + " " + row.Cells[3].Text + " ";
        }
    }
}