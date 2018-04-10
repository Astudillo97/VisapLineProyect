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
                    //GenerateExcelData("C:/Users/Developers_1/Documents/GitHub/VisapLineProyect/VisapLine/Archivos/arch.xlsx");
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
            OleDbConnection oledbConn=null;
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
    }
}