using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Drawing.Printing;
using System.Runtime.InteropServices;
using System.Text;


namespace VisapLine.Model
{
    public class impresorabix
    {
        StringBuilder linea = new StringBuilder();
        int maxCar = 40, cortar;

        public string lineasGuia()
        {
            string lineasGuion = "";
            for (int i = 0; i < maxCar; i++)
            {
                lineasGuion += "-";
            }
            return linea.AppendLine(lineasGuion).ToString();
        }

        public string lineasAsteriscos()
        {
            string lineasAsterisco = "";
            for (int i = 0; i < maxCar; i++)
            {
                lineasAsterisco += "*";
            }
            return linea.AppendLine(lineasAsterisco).ToString();
        }

        public string lineasIgual()
        {
            string lineasIguals = "";
            for (int i = 0; i < maxCar; i++)
            {
                lineasIguals += "=";
            }
            return linea.AppendLine(lineasIguals).ToString();
        }

        public void EncabezadoArticulos()
        {
            linea.AppendLine("INVENTARIO                    | CANT");
        }

        public void EncabezadoFactura()
        {
            linea.AppendLine("DESCRIPCION                    | VALOR");
        }

        public void TextoIzquierdo(string texto)
        {
            if (texto.Length > maxCar)
            {
                int caracterActual = 0;
                for (int longitudTexto = texto.Length; longitudTexto > maxCar; longitudTexto -= maxCar)
                {
                    linea.AppendLine(texto.Substring(caracterActual, maxCar));
                }
                linea.AppendLine(texto.Substring(caracterActual, texto.Length - caracterActual));
            }
            else
            {
                linea.AppendLine(texto);
            }
        }

        public void TextoDerecha(string texto)
        {
            if (texto.Length > maxCar)
            {
                int caracterActual = 0;
                for (int longitudTexto = texto.Length; longitudTexto > maxCar; longitudTexto -= maxCar)
                {
                    linea.AppendLine(texto.Substring(caracterActual, maxCar));
                    caracterActual += maxCar;
                }
                string espacios = "";
                for (int i = 0; i < (maxCar - texto.Substring(caracterActual, texto.Length - caracterActual).Length); i++)
                {
                    espacios += " ";
                }
                linea.AppendLine(espacios + texto.Substring(caracterActual, texto.Length - caracterActual));

            }
            else
            {
                string espacios = "";
                for (int i = 0; i < (maxCar - texto.Length); i++)
                {
                    espacios += " ";
                }
                linea.AppendLine(espacios + texto);
            }
        }

        public void TextoCentro(string texto)
        {
            if (texto.Length > maxCar)
            {
                int caracterActual = 0;
                for (int longitudTexto = texto.Length; longitudTexto > maxCar; longitudTexto -= maxCar)
                {
                    linea.AppendLine(texto.Substring(caracterActual, maxCar));
                    caracterActual += maxCar;
                }
                string espacios = "";
                int centrar = (maxCar - texto.Substring(caracterActual, texto.Length - caracterActual).Length) / 2;
                for (int i = 0; i < centrar; i++)
                {
                    espacios += " ";
                }
                linea.AppendLine(espacios + texto.Substring(caracterActual, texto.Length - caracterActual));

            }
            else
            {
                string espacios = "";
                int centrar = (maxCar - texto.Length) / 2;
                for (int i = 0; i < centrar; i++)
                {
                    espacios += " ";
                }
                linea.AppendLine(espacios + texto);
            }
        }

        public void TextoExtermos(string textoIzquierdo, string textoDerecha)
        {
            string textoizq, textoder, textocompleto = "", espacios = "";
            if (textoIzquierdo.Length > 18)
            {
                cortar = textoIzquierdo.Length - 18;
                textoizq = textoIzquierdo.Remove(18, cortar);
            }
            else
            {
                textoizq = textoIzquierdo;
            }
            textocompleto = textoizq;
            if (textoDerecha.Length > 20)
            {
                cortar = textoDerecha.Length - 20;
                textoder = textoDerecha.Remove(20, cortar);
            }
            else
            {
                textoder = textoDerecha;
            }
            int nroEspacios = maxCar - (textoizq.Length + textoder.Length);
            for (int i = 0; i < nroEspacios; i++)
            {
                espacios += " ";
            }
            textocompleto += espacios + textoDerecha;
            linea.AppendLine(textocompleto);
        }

        public void AgregarTotales(string texto, decimal total)
        {
            string resumen, valor, textocompleto, espacios = "";
            if (texto.Length > 25)
            {
                cortar = texto.Length - 25;
                resumen = texto.Remove(25, cortar);
            }
            else
            {
                resumen = texto;
            }
            textocompleto = resumen;
            valor = total.ToString("#,#.00");
            int nroEspacios = maxCar - (resumen.Length + valor.Length);
            for (int i = 0; i < nroEspacios; i++)
            {
                espacios += " ";
            }
            textocompleto += espacios + valor;
            linea.AppendLine(textocompleto);
        }

        public void AgregarArticulo(string inventario, int cantidad)
        {
            if (cantidad.ToString().Length <= 5)
            {
                string elemento = "", espacios = "";
                bool bandera = false;
                int nroEspacios = 0;
                if (inventario.Length > 25)
                {
                    nroEspacios = (5 - cantidad.ToString().Length);
                    espacios = " ";
                    for (int i = 0; i < nroEspacios; i++)
                    {
                        espacios += " ";
                    }
                    elemento += espacios + cantidad.ToString();
                    int caracterActual = 0;
                    for (int longitudTexto = inventario.Length; longitudTexto > 20; longitudTexto -= 20)
                    {
                        if (bandera == false)
                        {
                            linea.AppendLine(inventario.Substring(caracterActual, 20) + elemento);
                            bandera = true;
                        }
                        else
                        {
                            linea.AppendLine(inventario.Substring(caracterActual, 20));
                            caracterActual += 20;
                        }
                        linea.AppendLine(inventario.Substring(caracterActual, inventario.Length - caracterActual));
                    }
                }
                else
                {
                    for (int i = 0; i < (20 - inventario.Length); i++)
                    {
                        espacios += " ";
                    }
                    elemento = inventario + espacios;
                    nroEspacios = (5 - cantidad.ToString().Length);
                    espacios = "";
                    for (int i = 0; i < nroEspacios; i++)
                    {
                        espacios += " ";
                    }
                    elemento += espacios + cantidad.ToString();
                    linea.AppendLine(elemento);
                }
            }
        }
        public void Cortartiket() {

            linea.AppendLine("\x1B"+ "C");
            linea.AppendLine("\x1B"+"d"+"\x09");
        }
        public void ImprimirTiket(string impresora) {
            RawPrinterHelper.SendStringToPrinter(impresora,linea.ToString());
            linea.Clear();
        }


        // tk.PrintTicket("BIXOLON SRP-350plus"); //Nombre de la impresora de tickets

    }
    public class RawPrinterHelper
    {
        // Structure and API declarions:
        [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Ansi)]
        public class DOCINFOA
        {
            [MarshalAs(UnmanagedType.LPStr)]
            public string pDocName;
            [MarshalAs(UnmanagedType.LPStr)]
            public string pOutputFile;
            [MarshalAs(UnmanagedType.LPStr)]
            public string pDataType;
        }
        [DllImport("winspool.Drv", EntryPoint = "OpenPrinterA", SetLastError = true, CharSet = CharSet.Ansi, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool OpenPrinter([MarshalAs(UnmanagedType.LPStr)] string szPrinter, out IntPtr hPrinter, IntPtr pd);

        [DllImport("winspool.Drv", EntryPoint = "ClosePrinter", SetLastError = true, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool ClosePrinter(IntPtr hPrinter);

        [DllImport("winspool.Drv", EntryPoint = "StartDocPrinterA", SetLastError = true, CharSet = CharSet.Ansi, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool StartDocPrinter(IntPtr hPrinter, Int32 level, [In, MarshalAs(UnmanagedType.LPStruct)] DOCINFOA di);

        [DllImport("winspool.Drv", EntryPoint = "EndDocPrinter", SetLastError = true, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool EndDocPrinter(IntPtr hPrinter);

        [DllImport("winspool.Drv", EntryPoint = "StartPagePrinter", SetLastError = true, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool StartPagePrinter(IntPtr hPrinter);

        [DllImport("winspool.Drv", EntryPoint = "EndPagePrinter", SetLastError = true, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool EndPagePrinter(IntPtr hPrinter);

        [DllImport("winspool.Drv", EntryPoint = "WritePrinter", SetLastError = true, ExactSpelling = true, CallingConvention = CallingConvention.StdCall)]
        public static extern bool WritePrinter(IntPtr hPrinter, IntPtr pBytes, Int32 dwCount, out Int32 dwWritten);

        // SendBytesToPrinter()
        // When the function is given a printer name and an unmanaged array
        // of bytes, the function sends those bytes to the print queue.
        // Returns true on success, false on failure.
        public static bool SendBytesToPrinter(string szPrinterName, IntPtr pBytes, Int32 dwCount)
        {
            Int32 dwError = 0, dwWritten = 0;
            IntPtr hPrinter = new IntPtr(0);
            DOCINFOA di = new DOCINFOA();
            bool bSuccess = false; // Assume failure unless you specifically succeed.

            di.pDocName = "Ticket de Venta";//Este es el nombre con el que guarda el archivo en caso de no imprimir a la impresora fisica.
            di.pDataType = "RAW";//de tipo texto plano

            // Open the printer.
            if (OpenPrinter(szPrinterName.Normalize(), out hPrinter, IntPtr.Zero))
            {
                // Start a document.
                if (StartDocPrinter(hPrinter, 1, di))
                {
                    // Start a page.
                    if (StartPagePrinter(hPrinter))
                    {
                        // Write your bytes.
                        bSuccess = WritePrinter(hPrinter, pBytes, dwCount, out dwWritten);
                        EndPagePrinter(hPrinter);
                    }
                    EndDocPrinter(hPrinter);
                }
                ClosePrinter(hPrinter);
            }
            // If you did not succeed, GetLastError may give more information
            // about why not.
            if (bSuccess == false)
            {
                dwError = Marshal.GetLastWin32Error();
            }
            return bSuccess;
        }

        public static bool SendStringToPrinter(string szPrinterName, string szString)
        {
            IntPtr pBytes;
            Int32 dwCount;
            // How many characters are in the string?
            dwCount = szString.Length;
            // Assume that the printer is expecting ANSI text, and then convert
            // the string to ANSI text.
            pBytes = Marshal.StringToCoTaskMemAnsi(szString);
            // Send the converted ANSI string to the printer.
            SendBytesToPrinter(szPrinterName, pBytes, dwCount);
            Marshal.FreeCoTaskMem(pBytes);
            return true;
        }
    }
}