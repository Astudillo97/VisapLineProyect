using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Web.Services;

namespace VisapLineWeb
{
    public partial class PQRS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Areas areas = new Areas();
            

            Ticket ticket = new Ticket();
            ServicioTicket servicioTicket = new ServicioTicket();

            if (!IsPostBack)
            {

                CargarTipoTicket();
                CargarTipoDoc();
                CargarTipoReclamo();




            }

        }

        protected void Enviar(object sender, EventArgs e)
        {

        }

        protected void CargarTipoTicket()
        {
            TipoTicket tipoTicket = new TipoTicket();
         
            DataTable dat = tipoTicket.ConsultarTipoticket();
            REQUERIMIENTO.DataSource = dat;
            REQUERIMIENTO.DataTextField = "NombreTipoTicket";
            REQUERIMIENTO.DataValueField = "idTipoTicket";
            REQUERIMIENTO.DataBind();
        }

        protected void CargarTipoDoc()
        {
            TipoDoc tipoDoc = new TipoDoc();
            DataTable dat = tipoDoc.ConsultarTipoDoc();
            TIPODOC.DataSource = dat;
            TIPODOC.DataTextField = "tipodoc";
            TIPODOC.DataValueField = "idtipodoc";
            TIPODOC.DataBind();
        }

        protected void CargarTipologia()
        {
           
        }

        protected void CargarTipoReclamo()
        {
            TipoReclamo tipoReclamo = new TipoReclamo();
            DataTable dat = tipoReclamo.ConsultarTipoReclamo();
            TIPORECLAMO.DataSource = dat;
            TIPORECLAMO.DataTextField = "nombreTipoReclamo";
            TIPORECLAMO.DataValueField = "idTipoReclamo";
            TIPORECLAMO.DataBind();
        }
    }
}