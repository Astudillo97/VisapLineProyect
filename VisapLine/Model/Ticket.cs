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
        public string TipologiaFK { get; set; }
        public string ServiciosFK { get; set; }
        public string MedioAtencionFK { get; set; }
        public string EmisorTicketFK { get; set; }
        public string RespuestaTicketFK { get; set; }
        public string AreasFK { get; set; }
        public string DescTicket { get; set; }
        public string tipoTicket { get; set; }

        public string TipoReclamo { get; set; }

        public bool RegistrarTicket(EmisorTicket emisor, Ticket tick)
        {
            return data.OperarDatos("select * from public.Insertar_Ticket('"+emisor.NombreEmisorTicket+"','"+emisor.ApellidoEmisorTicket+"','"+emisor.CorreoEmisorticket+"','"+emisor.DocumentoEmisorTicket+"',,'"+emisor.TelefonoEmisorticket+"','"+tick.DescTicket+"','"+tick.tipoTicket+"','"+tick.TipologiaFK+"','"+tick.ServiciosFK+"','"+tick.tipoTicket+"','"+tick.DescTicket+"','"+tick.TipoReclamo+")");
        }

        
    }
}