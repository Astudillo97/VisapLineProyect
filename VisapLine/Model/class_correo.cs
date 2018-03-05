using System;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Threading;
using System.ComponentModel;
using VisapLine.Exeption;
using GoEmail;

namespace VisapLine.Model
{
    public class class_correo
    {
        public bool mailSent = false;
        public string destinatario { get; set; }
        public string asunto { get; set; }
        public string cuerpo { get; set; }
        public string archivo { get; set; }
        public bool html { get; set; }

        public void SendCompletedCallback(object sender, AsyncCompletedEventArgs e)
        {
            // Get the unique identifier for this asynchronous operation.
            String token = (string)e.UserState;

            if (e.Cancelled)
            {
                Console.WriteLine("[{0}] Send canceled.", token);
            }
            if (e.Error != null)
            {
                Console.WriteLine("[{0}] {1}", token, e.Error.ToString());
            }
            else
            {
                Console.WriteLine("Message sent.");
            }
            mailSent = true;
        }
        public bool EnviarMensaje()
        {
            class_correo correo = new class_correo();
            SmtpClient client = new SmtpClient();
            GoEmailv2 x = new GoEmailv2();
            client.Credentials = new System.Net.NetworkCredential("facturacionvisapline2018@gmail.com", "visap2018");
            MailAddress from = new MailAddress("facturacionvisapline2018@gmail.com", "VisapLine Telecomunicaciones", System.Text.Encoding.UTF8);
            MailAddress to = new MailAddress(destinatario);
            MailMessage message = new MailMessage(from, to);
            message.Subject = asunto;
            message.Body = cuerpo;
            string file = archivo;
            if (file!=null)
            {
                Attachment data = new Attachment(file, MediaTypeNames.Application.Octet);
                //Add time stamp information for the file.

               ContentDisposition disposition = data.ContentDisposition;
                disposition.CreationDate = System.IO.File.GetCreationTime(file);
                disposition.ModificationDate = System.IO.File.GetLastWriteTime(file);
                disposition.ReadDate = System.IO.File.GetLastAccessTime(file);
                //Add the file attachment to this e - mail message.
                 message.Attachments.Add(data);
            }

            message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;

            try
            {
                if (html)
                {
                    if (file==null)
                    {
                        x.Enviar(destinatario, asunto, cuerpo, "VisapLine Telecomunicaciones", "facturacionvapline2018@gmail.com", "visap2018", html);
                    }
                    else
                    {
                        string[] arch = new string[1];
                        arch[0] = file;
                        x.EnviarConArchivos(destinatario, asunto, cuerpo, "VisapLine Telecomunicaciones", "facturacionvapline2018@gmail.com", "visap2018", html,arch);
                    }
                }
                else
                {
                    client.Send(message);
                }
                message.Dispose();
                return true;
            }
            catch (Exception ex)
            {
                throw new ValidarExeption("Error al enviar el correo", ex);
            }
        }
    }
}