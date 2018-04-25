using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Ticket
    {
        IData data = new Data();
        
        public string idTicket { get; set; }
        public string fechaCreacionTicket { get; set; }
        public string empaTicket { get; set; }
        public string estaTicket { get; set; }
        public int TipologiaFK { get; set; }
        public int ServiciosFK { get; set; }
        public int MedioAtencionFK { get; set; }
        public int EmisorTicketFK { get; set; }
        public int RespuestaTicketFK { get; set; }
        public int AreasFK { get; set; }
        public string DescTicket { get; set; }
        public int tipoTicket { get; set; }

        public int TipoReclamo { get; set; }

        public bool RegistrarTicket(EmisorTicket emisor, Ticket tick)
        {
            return data.OperarDatos("select * from public.Insertar_Ticket('"+emisor.NombreEmisorTicket+"','"+emisor.ApellidoEmisorTicket+"','"+emisor.CorreoEmisorticket+"','"+emisor.DocumentoEmisorTicket+"','"+emisor.tipoDocumentoEmisorTicket+"','"+emisor.TelefonoEmisorticket+"','"+tick.DescTicket+"','"+tick.tipoTicket+"','"+tick.ServiciosFK+"','"+tick.tipoTicket+"','"+tick.TipoReclamo+"')");
        }

        
    }
}