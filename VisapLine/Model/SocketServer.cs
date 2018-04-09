using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Web;

namespace VisapLine.Model
{
    public class SocketServer
    {
        Socket miPrimerSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
        public bool dat = false;
        public void Iniciar()
        {

            // paso 2 - creamos el socket
            IPEndPoint miDireccion = new IPEndPoint(IPAddress.Any, 1234);
            //paso 3 -IPAddress.Any significa que va a escuchar al cliente en toda la red
            try
            {
                // paso 4
                miPrimerSocket.Bind(miDireccion); // Asociamos el socket a miDireccion
                miPrimerSocket.Listen(1); // Lo ponemos a escucha
                Socket Escuchar = miPrimerSocket.Accept();
                //creamos el nuevo socket, para comenzar a trabajar con él
                //La aplicación queda en reposo hasta que el socket se conecte a el cliente
                //Una vez conectado, la aplicación sigue su camino 
                /*Aca ponemos todo lo que queramos hacer con el socket, osea antes de
                
                cerrarlo je*/
                dat = true;

            }
            catch (Exception error)
            {
                Console.WriteLine("Error: {0}", error.ToString());
            }
        }
        public void cerrar()
        {
            miPrimerSocket.Close(); //Luego lo cerramos
            dat = false;
        }
    }
}