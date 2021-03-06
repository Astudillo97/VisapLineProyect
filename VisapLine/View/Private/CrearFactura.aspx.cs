﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;

namespace VisapLine.View.Private
{
    public partial class CrearFactura : System.Web.UI.Page
    {
        Terceros tercero = new Terceros();
        Telefono tlf = new Telefono();
        Contrato contrato = new Contrato();
        Empresa empresa = new Empresa();
        class_pdf pdf = new class_pdf();
        Factura fact = new Factura();
        Observacion observac = new Observacion();
        Incidencias inci = new Incidencias();
        static DataTable tablefactura = new DataTable();
        static DataTable tercliente = new DataTable();
        static DataTable contcliente = new DataTable();
        Servicios serv = new Servicios();
        Puntos punto = new Puntos();
        CargoAdicional cargo = new CargoAdicional();
        public DataTable punt = new DataTable();
        public static string ident;
        CategoriaIncidencia cinci = new CategoriaIncidencia();
        TipoIncidencia tpin = new TipoIncidencia();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();
        Pagos pg = new Pagos();
        Permisos per = new Permisos();
        CargoAdicional caradi = new CargoAdicional();
        Detalle detallefactura = new Detalle();

        protected void Page_Load(object sender, EventArgs e)
        {


            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                string valor = Convert.ToString(Request.QueryString["key"]);
                if (valor == null)
                {
                    Response.Redirect("gestcliente.aspx");
                }
                else
                {
                    consultardatoscliente(valor);
                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }


        }
        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void ConsultarIdentif(object sender, EventArgs e)
        {
            try
            {
                tercero.identificacion = Validar.validarlleno(identif_.Value);
                tercliente = Validar.Consulta(tercero.ConsultarTerceroAvanzado(tercero));
                consultacliente.DataSource = tercliente;
                consultacliente.DataBind();
                Alerta.Visible = false;
                ClientScript.RegisterStartupScript(GetType(), "alerta", "panelbutton();", true);
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void consultacontrato_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow gridw = consultacontrato.SelectedRow;
            datosfactura.Visible = true;

            Labelidcontrato.Text = Validar.validarlleno(gridw.Cells[0].Text);
            caradi.contrato_idcontrato_cargo = Labelidcontrato.Text;

            DataRow saldo = Validar.Consulta(fact.consultarcuenta(Labelidcontrato.Text)).Rows[0];
            Textbox4.Text = "0";
            Textbox5.Text = "0";
            Textbox7.Text = "0";
            Label3.Text = saldo["saldo"].ToString();
            Textbox6.Text = "0";
            Textbox3.Text = "1293214";
            Textbox2.Text = "0";
            DataRow secuencia = Validar.Consulta(fact.Consultarsecuencia()).Rows[0];
            TextBox1.Text = secuencia["facturaventacol"].ToString();

            try
            {
                DataTable cargoadicional = Validar.Consulta(caradi.ConsultarCargosIdContratoporefect(caradi));
                GridView2.DataSource = cargoadicional;
                GridView2.DataBind();
            }
            catch (Exception)
            {

            }

        }
        private void consultardatoscliente(string identificacion)
        {
            tercero.identificacion = Validar.validarlleno(identificacion);
            DataRow row = Validar.Consulta(tercero.ConsultarTerceroAvanzado(tercero)).Rows[0];
            _tipocliente.Value = row["tipoterceros"].ToString();
            identificacion_.Value = row["identificacion"].ToString();
            ident = row["identificacion"].ToString();
            _nombre_.Value = row["nombre"].ToString() + " " + row["apellido"].ToString();
            _correo_.Value = row["correo"].ToString();
            _estado_.Value = row["estado"].ToString();
            _direccion_.Value = row["direccion"].ToString();
            tlf.terceros_idterceros = row["identificacion"].ToString();
            DataTable listtelefono = tlf.ConsultarTelefonosIdTerceros(tlf);
            string telef = "";
            foreach (DataRow item in listtelefono.Rows)
            {
                telef += item["telefono"].ToString() + " ";
            }
            _telefono_.Value = telef;
            contrato.terceros_idterceros = row["idterceros"].ToString();
            DataTable contclientes = contrato.ConsultarContratoIdTercero(contrato);
            consultacontrato.DataSource = contclientes;
            consultacontrato.DataBind();
            Alerta.Visible = false;
            datos.Visible = true;
        }

        protected void consultacliente_SelectedIndexChanged1(object sender, EventArgs e)
        {
            try
            {
                Alerta.Visible = false;
                datos.Visible = true;
                GridViewRow gridw = consultacliente.SelectedRow;
                consultardatoscliente(Validar.validarlleno(gridw.Cells[0].Text));

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            string valor1 = Textbox4.Text;
            string valor2 = Textbox5.Text;
            string valor3 = Textbox6.Text;
            ulong valor4 = (Convert.ToUInt64(valor1) + Convert.ToUInt64(valor2)) + Convert.ToUInt64(valor3);
            Textbox7.Text = Convert.ToString(valor4);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = GridView2.SelectedRow;
            try
            {
                if (Validar.validartrue(caradi.Actualizarestadocargo(gridw.Cells[0].Text, Label4.Text, gridw.Cells[1].Text, gridw.Cells[2].Text)))
                {
                    caradi.contrato_idcontrato_cargo = Labelidcontrato.Text;
                    DataTable detalle1 = detallefactura.ConsultarDetalleIdFactura1(Label4.Text);
                    GridView3.DataSource = detalle1;
                    GridView3.DataBind();

                    DataTable cargo2 = Validar.Consulta(caradi.ConsultarCargosIdContratoporefect(caradi));
                    GridView2.DataSource = cargo2;
                    GridView2.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                }

            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Textbox6.Text = Label3.Text;
        }

        protected void Button2_Click2(object sender, EventArgs e)
        {
            try
            {
                if (detallefactura.Creardetallefactura(Label4.Text, TextBox9.Text, TextArea1detalle.Value))
                {
                    try
                    {
                        DataTable detalle1 = detallefactura.ConsultarDetalleIdFactura1(Label4.Text);
                        GridView3.DataSource = detalle1;
                        GridView3.DataBind();

                        DataTable cargo2 = caradi.ConsultarCargosIdContratoporefect(caradi);
                        GridView2.DataSource = cargo2;
                        GridView2.DataBind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "creardetallet();", true);
                    }
                    catch (Exception)
                    {
                        throw;
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gridw = GridView2.SelectedRow;
            try
            {
                if (detallefactura.Deletdetalle(gridw.Cells[5].Text))
                {
                    try
                    {
                        DataTable detalle1 = detallefactura.ConsultarDetalleIdFactura1(Label4.Text);
                        GridView3.DataSource = detalle1;
                        GridView3.DataBind();

                        DataTable cargo2 = caradi.ConsultarCargosIdContratoporefect(caradi);
                        GridView2.DataSource = cargo2;
                        GridView2.DataBind();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "creardetallet();", true);
                    }
                    catch (Exception)
                    {
                        throw;
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                fact.contrato_idcontrato = Validar.validarlleno(Labelidcontrato.Text);
                fact.Referenciapago = Validar.validarlleno(Textbox3.Text);
                fact.fechaemision = Validar.validarlleno(Textboxfechafacturacion.Text);
                fact.fechavencimiento = Validar.validarlleno(Textbox8.Text);
                fact.fechacorte = Validar.validarlleno(Textboxfechacorte.Text);
                fact.facturaventa = Validar.validarlleno(TextBox1.Text);
                fact.estado = Validar.validarselected(DropDownList1.Text);
                fact.cuotas = Validar.validarlleno(Textbox2.Text);
                fact.saldo = Validar.validarlleno(Textbox7.Text);

                string numfactura = Validar.Consulta(fact.RegistrarFactura1(fact)).Rows[0][0].ToString();
                if (numfactura != null)
                {
                    datosfactura1.Visible = true;
                    datosfactura.Visible = false;
                    Label4.Text = numfactura;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            try
            {
                string user_siigo = "GESTION";
                string pass_siigo = "Visa67";
                string path = "C:\\inetpub\\wwwroot\\ServicioSiigo\\SiigoServicio\\";
                string datos=Encrypt(user_siigo+pass_siigo, true);
                class_export export = new class_export();
                MovimientoContable.MovContSoapClient movcont = new MovimientoContable.MovContSoapClient();
                DataTable dat = export.llenarTabla("2018-02-20", "2018-02-20", Validar.validarlleno(Label4.Text), "3");
                string retur = movcont.RegistrarMovimiento("C:\\inetpub\\wwwroot\\ServicioSiigo\\SiigoServicio\\plantilla.xls", dat, path);
                ComandCmd.ExecuteCmdSoapClient ComandoCmd = new ComandCmd.ExecuteCmdSoapClient();
                //ExcelSIIGO C:\SIIWI04\ 2018 PUSHMOV L GESTION Visa67 C:\prueba\ExcelSiigopruebaINSERT.log C:\prueba\MovimientoContableprueba.xls
                string SALID= ComandoCmd.ExecuteCommand("C:\\Siigo\\ExcelSIIGO", "C:\\SIIWI04\\", "2018", "PUSHMOV", "L", user_siigo, pass_siigo, path+"DAT.LOG", retur,datos);
                //Response.Redirect("gestcliente.aspx");
                Alerta.Visible = false;
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }


        public static string Encrypt(string toEncrypt, bool useHashing)
        {
            byte[] keyArray;
            byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

            System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
            // Get the key from config file

            string key = (string)settingsReader.GetValue("SecurityKey",
                                                             typeof(String));
            //System.Windows.Forms.MessageBox.Show(key);
            //If hashing use get hashcode regards to your key
            if (useHashing)
            {
                MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
                keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
                //Always release the resources and flush data
                // of the Cryptographic service provide. Best Practice

                hashmd5.Clear();
            }
            else
                keyArray = UTF8Encoding.UTF8.GetBytes(key);

            TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
            //set the secret key for the tripleDES algorithm
            tdes.Key = keyArray;
            //mode of operation. there are other 4 modes.
            //We choose ECB(Electronic code Book)
            tdes.Mode = CipherMode.ECB;
            //padding mode(if any extra byte added)

            tdes.Padding = PaddingMode.PKCS7;

            ICryptoTransform cTransform = tdes.CreateEncryptor();
            //transform the specified region of bytes array to resultArray
            byte[] resultArray =
              cTransform.TransformFinalBlock(toEncryptArray, 0,
              toEncryptArray.Length);
            //Release resources held by TripleDes Encryptor
            tdes.Clear();
            //Return the encrypted data into unreadable string format
            return Convert.ToBase64String(resultArray, 0, resultArray.Length);
        }
    }
}