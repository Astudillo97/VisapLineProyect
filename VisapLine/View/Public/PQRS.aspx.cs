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
            try
            {
                Ticket ticket = new Ticket();
                EmisorTicket emisor = new EmisorTicket();

                emisor.NombreEmisorTicket = Validar.validarlleno(NombreEmisor.Text);
                emisor.ApellidoEmisorTicket = Validar.validarlleno(ApellidoEmisor.Text);
                emisor.DocumentoEmisorTicket = Validar.validarnumero(documentoEmisor.Text);
                emisor.tipoDocumentoEmisorTicket = Int32.Parse(TIPODOC.SelectedValue);
                emisor.CorreoEmisorticket = Validar.validarlleno(CorreoEmisor.Text);
                emisor.TelefonoEmisorticket = Validar.validarlleno(telefonoEmisor.Text);

                ticket.ServiciosFK = Int32.Parse(TipoServicio.SelectedValue);
                ticket.DescTicket = Validar.validarlleno(Descripcion.InnerText);
                ticket.tipoTicket = Int32.Parse(REQUERIMIENTO.SelectedValue);
                ticket.TipoReclamo = Int32.Parse(TIPORECLAMO.SelectedValue);
                ticket.RegistrarTicket(emisor, ticket);
            }
            catch (Exception)
            {

                throw;
            }
            


        }

        protected void CargarTipoTicket()
        {
            TipoTicket tipoTicket = new TipoTicket();
         
            DataTable dat = tipoTicket.ConsultarTipoticket();
            REQUERIMIENTO.DataSource = dat;
            REQUERIMIENTO.DataTextField = "nombretipoticket";
            REQUERIMIENTO.DataValueField = "idtipoticket";
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
            TIPORECLAMO.DataTextField = "nombretiporeclamo";
            TIPORECLAMO.DataValueField = "idtiporeclamo";
            TIPORECLAMO.DataBind();
        }
    }
}