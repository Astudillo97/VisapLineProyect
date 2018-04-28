using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using System.Data.OleDb;
using System.Net.Sockets;
using System.Net;
using Excel = Microsoft.Office.Interop.Excel;
using System.Runtime.InteropServices;


namespace VisapLine.View.Private
{
    public partial class EditarFactura : System.Web.UI.Page
    {
        Factura fact = new Factura();
        Observacion obser = new Observacion();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string valor = Request.QueryString["key"];
                    if (valor != null)
                    {
                        fact.facturaventa = valor;
                        DataRow dat = fact.ConsultarFacturaCodigo(fact).Rows[0];
                        idfact.Text = dat["idfactura"].ToString();
                        emisio.Text = Convert.ToDateTime(dat["fechaemision"]).ToString("yyyy-MM-dd");
                        cort.Text = Convert.ToDateTime(dat["fechacorte"].ToString()).ToString("yyyy-MM-dd");
                        vencimient.Text = Convert.ToDateTime(dat["fechavencimiento"].ToString()).ToString("yyyy-MM-dd");
                        estado.SelectedValue = dat["estado"].ToString();
                        cuotas.Text = dat["cuotas"].ToString();
                        facturaventa.Text = dat["facturaventa"].ToString();
                        valorfac.Text = dat["valorfac"].ToString();
                        saldofact.Text = dat["saldofac"].ToString();
                        ivafact.Text = dat["ivafac"].ToString();
                        totalfact.Text = dat["totalfac"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    textError.InnerHtml = ex.Message;
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }


            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                fact.idfactura = Validar.validarlleno(idfact.Text);
                fact.fechaemision = Validar.validarlleno(emisio.Text);
                fact.fechacorte = Validar.validarlleno(cort.Text);
                fact.fechavencimiento = Validar.validarlleno(vencimient.Text);
                fact.estado = Validar.validarselected(estado.SelectedValue);
                fact.cuotas = Validar.validarlleno(cuotas.Text);
                fact.facturaventa = Validar.validarlleno(facturaventa.Text);
                fact.valor = Validar.validarlleno(valorfac.Text);
                fact.saldo = Validar.validarlleno(saldofact.Text);
                fact.iva = Validar.validarlleno(ivafact.Text);
                fact.total = Validar.validarlleno(totalfact.Text);
                Validar.validarlleno(observacion.Text);
                if (fact.ActualizarFactura(fact))
                {
                    obser.factura_idfactura_obs = fact.idfactura;
                    obser.observacion = observacion.Text;
                    GenerateExcelData("C:\\SiigoServicio\\Consulta.xls");
                    obser.RegistrarObservaciondos(obser);
                    textError.InnerHtml = "Actualizado Correctamente";
                    Alerta.CssClass = "alert alert-success";
                    Alerta.Visible = true;
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }
        private void GenerateExcelData(string SlnoAbbreviation)
        {
            OleDbConnection oledbConn = null;
            try
            {
                // need to pass relative path after deploying on server
                string path = SlnoAbbreviation;
                oledbConn = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + path + ";Extended Properties = 'Excel 12.0;HDR=YES;IMEX=1;'; ");

                oledbConn.Open();
                OleDbCommand cmd = new OleDbCommand(); ;
                OleDbDataAdapter oleda = new OleDbDataAdapter();
                DataSet ds = new DataSet();

                // passing list to drop-down list

                // selecting distinct list of Slno 
                cmd.Connection = oledbConn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM [Hoja1$]";
                oleda = new OleDbDataAdapter(cmd);
                oleda = new OleDbDataAdapter(cmd);
                oleda.Fill(ds);

                // binding form data with grid view
                GridView1.DataSource = ds.Tables[0].DefaultView;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                oledbConn.Close();
            }
        }// close of method GemerateExceLData

        public static void getExcelFile()
        {

            //Create COM Objects. Create a COM object for everything that is referenced
            Excel.Application xlApp = new Excel.Application();
            Excel.Workbook xlWorkbook = xlApp.Workbooks.Open(@"C:\SiigoServicio\Consulta.xls");
            Excel._Worksheet xlWorksheet = xlWorkbook.Sheets[1];
            Excel.Range xlRange = xlWorksheet.UsedRange;

            int rowCount = xlRange.Rows.Count;
            int colCount = xlRange.Columns.Count;
            DataTable dataTable = new DataTable();
            //dataTable.Columns.AddRange(new DataColumn[16] { new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn(), new DataColumn() });
            
            //iterate over the rows and columns and print to the console as it appears in the file
            //excel is not zero based!!
            for (int i = 1; i <= rowCount; i++)
            {
                DataRow dat= dataTable.NewRow();
                for (int j = 1; j <= colCount; j++)
                {
                    //new line
                    if (i == 1)
                    {
                        dataTable.Columns.Add(xlRange.Cells[i, j].Value2.ToString());
                    }
                    else
                    {
                        dat[j-1] = xlRange.Cells[i, j].Value2.ToString();
                    }
                }
                dataTable.Rows.Add(dat);
            }

            //cleanup
            GC.Collect();
            GC.WaitForPendingFinalizers();

            //rule of thumb for releasing com objects:
            //  never use two dots, all COM objects must be referenced and released individually
            //  ex: [somthing].[something].[something] is bad

            //release com objects to fully kill excel process from running in the background
            Marshal.ReleaseComObject(xlRange);
            Marshal.ReleaseComObject(xlWorksheet);

            //close and release
            xlWorkbook.Close();
            Marshal.ReleaseComObject(xlWorkbook);

            //quit and release
            xlApp.Quit();
            Marshal.ReleaseComObject(xlApp);
        }

        private bool CrearExcel(DataTable dat, string ouput)
        {
            Excel.Application xlApp = new Excel.Application();

            if (xlApp == null)
            {
                //MessageBox.Show("Excel is not properly installed!!");
                return false;
            }


            Excel.Workbook xlWorkBook;
            Excel.Worksheet xlWorkSheet;
            object misValue = System.Reflection.Missing.Value;

            xlWorkBook = xlApp.Workbooks.Add(misValue);
            xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

            for (int i = 0; i < dat.Rows.Count; i++)
            {
                for (int j = 0; j < dat.Rows[i].ItemArray.Length; j++)
                {
                    xlWorkSheet.Cells[i, j] = dat.Rows[i][j];
                }
            }

            //xlWorkSheet.Cells[1, 1] = "ID";
            //xlWorkSheet.Cells[1, 2] = "Name";
            //xlWorkSheet.Cells[2, 1] = "1";
            //xlWorkSheet.Cells[2, 2] = "One";
            //xlWorkSheet.Cells[3, 1] = "2";
            //xlWorkSheet.Cells[3, 2] = "Two";



            xlWorkBook.SaveAs(@"C:\SiigoServicio\"+ouput);
            xlWorkBook.Close(true, misValue, misValue);
            xlApp.Quit();

            Marshal.ReleaseComObject(xlWorkSheet);
            Marshal.ReleaseComObject(xlWorkBook);
            Marshal.ReleaseComObject(xlApp);
            return true;
        }
        public static void Conectar()
        {
            Socket miPrimerSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            // paso 2 - creamos el socket
            IPEndPoint miDireccion = new IPEndPoint(IPAddress.Parse("192.168.0.61"), 1234);
            //paso 3 - Acá debemos poner la Ip del servidor, y el puerto de escucha del servidor
            //Yo puse esa porque corrí las dos aplicaciones en la misma pc
            try
            {
                miPrimerSocket.Connect(miDireccion); // Conectamos               
                Console.WriteLine("Conectado con exito");
                miPrimerSocket.Close();
            }
            catch (Exception error)
            {
                Console.WriteLine("Error: {0}",error.ToString());
            }
            Console.WriteLine("Presione cualquier tecla para terminar");
            Console.ReadLine();
        }

        protected void CargarSiigo(object sender, EventArgs e)
        {
            MovimientoContable.MovContSoapClient movcont = new MovimientoContable.MovContSoapClient();
            //ComandCmd.ExecuteCmdSoapClient comandcmd = new ComandCmd.ExecuteCmdSoapClient();
            //observacion.Text=comandcmd.ExecuteCommand("ipconfig");
            //DataTable dat=movcont.ConsultaMovimiento("Consulta");
            //DataTable dat = movcont.ConsultaMovimiento("C:\\inetpub\\wwwroot\\ServicioSiigo\\SiigoServicio\\Consulta.xls");
            //GridView1.DataSource = dat;
            //GridView1.DataBind();
            class_export exp = new class_export();
            observacion.Text = movcont.RegistrarMovimiento("C:\\inetpub\\wwwroot\\ServicioSiigo\\SiigoServicio\\plantilla.xls", exp.llenarTabla("2-04-2018", "20-04-2018", null, "1"), "C:\\inetpub\\wwwroot\\ServicioSiigo\\SiigoServicio\\");
            //getExcelFile();
            //CrearExcel(new DataTable(),"");
            
            //movcont.CrearExcelModificado(exp.llenarTabla("2-04-2018", "20-04-2018", null, ""), "plantilla", "SIIGO");
        }
    }
}