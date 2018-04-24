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
            
            Ticket ticket = new Ticket();
            EmisorTicket emisor = new EmisorTicket();

            emisor.NombreEmisorTicket = NombreEmisor.Text;
            emisor.ApellidoEmisorTicket = ApellidoEmisor.Text;
            emisor.DocumentoEmisorTicket = documentoEmisor.Text;
            emisor.tipoDocumentoEmisorTicket = TIPODOC.SelectedValue;
            emisor.CorreoEmisorticket = CorreoEmisor.Text;
            emisor.TelefonoEmisorticket = telefonoEmisor.Text;

            ticket.ServiciosFK = TipoServicio.SelectedValue;
            ticket.DescTicket = Descripcion.InnerText;
            ticket.tipoTicket = REQUERIMIENTO.SelectedValue;
            ticket.TipoReclamo = TIPORECLAMO.SelectedValue;
            ticket.RegistrarTicket(emisor, ticket);


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