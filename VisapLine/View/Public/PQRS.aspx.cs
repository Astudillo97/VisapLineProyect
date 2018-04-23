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

                CargarTipologia();






            }

        }

        protected void Enviar(object sender, EventArgs e)
        {

        }

        protected void CargarTipologia()
        {
            Tipologia tipologia = new Tipologia();
            DataTable inci = tipologia.ConsultarTipologia();
            REQUERIMIENTO.DataSource = inci;
            REQUERIMIENTO.DataTextField = "descTipologia";
            REQUERIMIENTO.DataValueField = "idTipologia";
            REQUERIMIENTO.DataBind();
        }
    }
}