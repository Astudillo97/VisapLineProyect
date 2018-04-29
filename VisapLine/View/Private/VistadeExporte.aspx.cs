using System;
using System.Data;

namespace VisapLine.Model
{
    public partial class VistadeExporte : System.Web.UI.Page
    {
        Factura fact = new Factura();
        public static DataTable tablefactura = new DataTable();
        public static DataTable exportsiigo = new DataTable();
        excel drexcel = new excel();
        protected void Page_Load(object sender, EventArgs e)
        {
            exportsiigo.Rows.Clear();
            exportsiigo.Dispose();
            exportsiigo.Columns.Clear();
            //exportsiigo.Columns.Add("numerodoc");
            //exportsiigo.Columns.Add("cuentacontable");
            //exportsiigo.Columns.Add("devitocredito");
            //exportsiigo.Columns.Add("valorsecuencia");
            //exportsiigo.Columns.Add("aniodoc");
            //exportsiigo.Columns.Add("mesdoc");
            //exportsiigo.Columns.Add("diadoc");
            //exportsiigo.Columns.Add("secuencia");
            //exportsiigo.Columns.Add("nit");
            //exportsiigo.Columns.Add("descripcion");
            //exportsiigo.Columns.Add("fromadepago");
            //exportsiigo.Columns.Add("gravada");
            //exportsiigo.Columns.Add("porcentageiva");
            //exportsiigo.Columns.Add("valoriva");
            //exportsiigo.Columns.Add("tipoconprobante");
            //exportsiigo.Columns.Add("numerodocumentocruce");
            //exportsiigo.Columns.Add("numerovencimiento");
            //exportsiigo.Columns.Add("aniovencimiento");
            //exportsiigo.Columns.Add("mesvencimeinto");
            //exportsiigo.Columns.Add("diavenciemiento");
            llenarCol();
            llenarcell1();
            llenarTabla();
        }

        public void llenarCol()
        {
            //DataRow cel0 = exportsiigo.NewRow();
            DataColumn[] dat = new DataColumn[62];
            for (int i = 0; i < 62; i++)
            {
                dat[i] = new DataColumn();
            }
            exportsiigo.Columns.AddRange(dat);
        }

        public void llenarcell1()
        {
            DataRow cel0 = exportsiigo.NewRow();
            cel0[0] = "TIPO DE COMPROBANTE (OBLIGATORIO)";
            cel0[1] = "CÓDIGO COMPROBANTE  (OBLIGATORIO)";
            cel0[2] = "NÚMERO DE DOCUMENTO (OBLIGATORIO)";
            cel0[3] = "CUENTA CONTABLE   (OBLIGATORIO)";
            cel0[4] = "DÉBITO O CRÉDITO (OBLIGATORIO)";
            cel0[5] = "VALOR DE LA SECUENCIA   (OBLIGATORIO)";
            cel0[6] = "AÑO DEL DOCUMENTO";
            cel0[7] = "MES DEL DOCUMENTO";
            cel0[8] = "DÍA DEL DOCUMENTO";
            cel0[9] = "CÓDIGO DEL VENDEDOR";
            cel0[10] = "CÓDIGO DE LA CIUDAD";
            cel0[11] = "CÓDIGO DE LA ZONA";
            cel0[12] = "SECUENCIA";
            cel0[13] = "CENTRO DE COSTO";
            cel0[14] = "SUBCENTRO DE COSTO";
            cel0[15] = "NIT";
            cel0[16] = "SUCURSAL";
            cel0[17] = "DESCRIPCIÓN DE LA SECUENCIA";
            cel0[18] = "NÚMERO DE CHEQUE";
            cel0[19] = "COMPROBANTE ANULADO";
            cel0[20] = "CÓDIGO DEL MOTIVO DE DEVOLUCIÓN";
            cel0[21] = "FORMA DE PAGO";
            cel0[22] = "PORCENTAJE DEL IVA DE LA SECUENCIA";
            cel0[23] = "VALOR DE IVA DE LA SECUENCIA";
            cel0[24] = "BASE DE RETENCIÓN";
            cel0[25] = "BASE PARA CUENTAS MARCADAS COMO RETEIVA";
            cel0[26] = "SECUENCIA GRAVADA O EXCENTA";
            cel0[27] = "PORCENTAJE AIU";
            cel0[28] = "BASE IVA AIU";
            cel0[29] = "LÍNEA PRODUCTO";
            cel0[30] = "GRUPO PRODUCTO";
            cel0[31] = "CÓDIGO PRODUCTO";
            cel0[32] = "CANTIDAD";
            cel0[33] = "CANTIDAD DOS";
            cel0[34] = "CÓDIGO DE LA BODEGA";
            cel0[35] = "CÓDIGO DE LA UBICACIÓN";
            cel0[36] = "CANTIDAD DE FACTOR DE CONVERSIÓN";
            cel0[37] = "OPERADOR DE FACTOR DE CONVERSIÓN";
            cel0[38] = "VALOR DEL FACTOR DE CONVERSIÓN";
            cel0[39] = "SERIAL DEL PRODUCTO";
            cel0[40] = "DIAS DE GARANTÍA PARA EL SERIAL";
            cel0[41] = "GRUPO ACTIVOS";
            cel0[42] = "CÓDIGO ACTIVO";
            cel0[43] = "ADICIÓN O MEJORA";
            cel0[44] = "VECES ADICIONALES A DEPRECIAR POR ADICIÓN O MEJORA";
            cel0[45] = "VECES A DEPRECIAR NIIF";
            cel0[46] = "NÚMERO DEL DOCUMENTO DEL PROVEEDOR";
            cel0[47] = "PREFIJO DEL DOCUMENTO DEL PROVEEDOR";
            cel0[48] = "AÑO DOCUMENTO DEL PROVEEDOR";
            cel0[49] = "MES DOCUMENTO DEL PROVEEDOR";
            cel0[50] = "DÍA DOCUMENTO DEL PROVEEDOR";
            cel0[51] = "TIPO DOCUMENTO DE PEDIDO";
            cel0[52] = "CÓDIGO COMPROBANTE DE PEDIDO";
            cel0[53] = "NÚMERO DE COMPROBANTE PEDIDO";
            cel0[54] = "SECUENCIA DE PEDIDO";
            cel0[55] = "TIPO Y COMPROBANTE CRUCE";
            cel0[56] = "NÚMERO DE DOCUMENTO CRUCE";
            cel0[57] = "NÚMERO DE VENCIMIENTO";
            cel0[58] = "AÑO VENCIMIENTO DE DOCUMENTO CRUCE";
            cel0[59] = "MES VENCIMIENTO DE DOCUMENTO CRUCE";
            cel0[60] = "DÍA VENCIMIENTO DE DOCUMENTO CRUCE";
            cel0[61] = "NÚMERO DE CAJA ASOCIADA AL COMPROBANTE";
            exportsiigo.Rows.Add(cel0);
        }
        public void llenarTabla()
        {

            tablefactura = fact.ConsultaSiigo("01-04-2018", "31-05-2018",null,"1");
            for (int i = 0; i < tablefactura.Rows.Count; i++)
            {
                DataRow cel1 = exportsiigo.NewRow();
                DataRow cel2 = exportsiigo.NewRow();
                DataRow cel3 = exportsiigo.NewRow();

                //cel2["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                //cel2["cuentacontable"] = "4145702500";
                //cel2["devitocredito"] = "C";
                //cel2["valorsecuencia"] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["valor"].ToString()));
                //cel2["aniodoc"] = tablefactura.Rows[i]["anioinicio"].ToString();
                //cel2["mesdoc"] = tablefactura.Rows[i]["mesinicio"].ToString();
                //cel2["diadoc"] = tablefactura.Rows[i]["diainicio"].ToString();
                //cel2["secuencia"] = "1";
                //cel2["nit"] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                //cel2["descripcion"] = tablefactura.Rows[i]["plan"].ToString();
                //cel2["fromadepago"] = "0";
                //cel2["gravada"] = "N";
                //cel2["porcentageiva"] = "0";
                //cel2["valoriva"] = "0";
                //cel2["tipoconprobante"] = "F-11";
                //cel2["numerodocumentocruce"] = "0";
                //cel2["numerovencimiento"] = "0";
                //cel2["aniovencimiento"] = tablefactura.Rows[i]["aniovence"].ToString();
                //cel2["mesvencimeinto"] = tablefactura.Rows[i]["mesvence"].ToString();
                //cel2["diavenciemiento"] = tablefactura.Rows[i]["diavence"].ToString();

                cel2[0] = "F";
                cel2[1] = "11";
                cel2[2] = tablefactura.Rows[i]["facturaventa"].ToString();
                cel2[3] = "4145702500";
                cel2[4] = "C";
                cel2[5] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["valor"].ToString()));
                cel2[6] = tablefactura.Rows[i]["anioinicio"].ToString();
                cel2[7] = tablefactura.Rows[i]["mesinicio"].ToString();
                cel2[8] = tablefactura.Rows[i]["diainicio"].ToString();
                cel2[9] = "5";
                cel2[10] = "10";
                cel2[11] = "0";
                cel2[12] = "1";
                cel2[13] = "11";
                cel2[14] = "0";
                cel2[15] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                cel2[16] = "0";
                cel2[17] = tablefactura.Rows[i]["plan"].ToString();
                cel2[18] = "0";
                cel2[19] = "N";
                cel2[20] = "0";
                cel2[21] = "0";
                cel2[22] = "0";
                cel2[23] = "0";
                cel2[24] = "0";
                cel2[25] = "0";
                cel2[26] = "N";
                cel2[27] = "0";
                cel2[28] = "0";
                cel2[29] = "0";
                cel2[30] = "0";
                cel2[31] = "0";
                cel2[32] = "0";
                cel2[33] = "0";
                cel2[34] = "0";
                cel2[35] = "0";
                cel2[36] = "0";
                cel2[37] = "0";
                cel2[38] = "0";
                cel2[39] = "0";
                cel2[40] = "0";
                cel2[41] = "0";
                cel2[42] = "0";
                cel2[43] = "0";
                cel2[44] = "0";
                cel2[45] = "0";
                cel2[46] = "0";
                cel2[47] = "0";
                cel2[48] = "0";
                cel2[49] = "0";
                cel2[50] = "0";
                cel2[51] = "0";
                cel2[52] = "0";
                cel2[53] = "0";
                cel2[54] = "0";
                cel2[55] = "F-11";
                cel2[56] = "0";
                cel2[57] = "0";
                cel2[58] = tablefactura.Rows[i]["aniovence"].ToString();
                cel2[59] = tablefactura.Rows[i]["mesvence"].ToString();
                cel2[60] = tablefactura.Rows[i]["diavence"].ToString();
                cel2[61] = "0";


                exportsiigo.Rows.Add(cel2);

                //cel1["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                //cel1["cuentacontable"] = "1305050100";
                //cel1["devitocredito"] = "D";
                //cel1["valorsecuencia"] = Math.Round(Convert.ToDouble((Convert.ToDouble(tablefactura.Rows[i]["valor"].ToString()) + Convert.ToDouble(tablefactura.Rows[i]["ivavalor"])).ToString()));
                //cel1["aniodoc"] = tablefactura.Rows[i]["anioinicio"].ToString();
                //cel1["mesdoc"] = tablefactura.Rows[i]["mesinicio"].ToString();
                //cel1["diadoc"] = tablefactura.Rows[i]["diainicio"].ToString();
                //cel1["secuencia"] = "2";
                //cel1["nit"] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                //cel1["descripcion"] = tablefactura.Rows[i]["nombre"].ToString();
                //cel1["fromadepago"] = "6";
                //cel1["gravada"] = "";
                //cel1["porcentageiva"] = "0";
                //cel1["valoriva"] = "0";
                //cel1["tipoconprobante"] = "F-11";
                //cel1["numerodocumentocruce"] = tablefactura.Rows[i]["facturaventa"].ToString();
                //cel1["numerovencimiento"] = "1";
                //cel1["aniovencimiento"] = tablefactura.Rows[i]["aniovence"].ToString();
                //cel1["mesvencimeinto"] = tablefactura.Rows[i]["mesvence"].ToString();
                //cel1["diavenciemiento"] = tablefactura.Rows[i]["diavence"].ToString();
                cel1[0] = "F";
                cel1[1] = "11";
                cel1[2] = tablefactura.Rows[i]["facturaventa"].ToString();
                cel1[3] = "1305050100";
                cel1[4] = "D";
                cel1[5] = Math.Round(Convert.ToDouble((Convert.ToDouble(tablefactura.Rows[i]["valor"].ToString()) + Convert.ToDouble(tablefactura.Rows[i]["ivavalor"])).ToString()));
                cel1[6] = tablefactura.Rows[i]["anioinicio"].ToString();
                cel1[7] = tablefactura.Rows[i]["mesinicio"].ToString();
                cel1[8] = tablefactura.Rows[i]["diainicio"].ToString();
                cel1[9] = "5";
                cel1[10] = "10";
                cel1[11] = "0";
                cel1[12] = "2";
                cel1[13] = "11";
                cel1[14] = "0";
                cel1[15] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                cel1[16] = "0";
                cel1[17] = tablefactura.Rows[i]["nombre"].ToString();
                cel1[18] = "6";
                cel1[19] = "";
                cel1[20] = "0";
                cel1[21] = "0";
                cel1[22] = "0";
                cel1[23] = "0";
                cel1[24] = "0";
                cel1[25] = "0";
                cel1[26] = "N";
                cel1[27] = "0";
                cel1[28] = "0";
                cel1[29] = "0";
                cel1[30] = "0";
                cel1[31] = "0";
                cel1[32] = "0";
                cel1[33] = "0";
                cel1[34] = "0";
                cel1[35] = "0";
                cel1[36] = "0";
                cel1[37] = "0";
                cel1[38] = "0";
                cel1[39] = "0";
                cel1[40] = "0";
                cel1[41] = "0";
                cel1[42] = "0";
                cel1[43] = "0";
                cel1[44] = "0";
                cel1[45] = "0";
                cel1[46] = "0";
                cel1[47] = "0";
                cel1[48] = "0";
                cel1[49] = "0";
                cel1[50] = "0";
                cel1[51] = "0";
                cel1[52] = "0";
                cel1[53] = "0";
                cel1[54] = "0";
                cel1[55] = "F-11";
                cel1[56] = "0";
                cel1[57] = "0";
                cel1[58] = tablefactura.Rows[i]["aniovence"].ToString();
                cel1[59] = tablefactura.Rows[i]["mesvence"].ToString();
                cel1[60] = tablefactura.Rows[i]["diavence"].ToString();
                cel1[61] = "0";

                if (Convert.ToDouble(tablefactura.Rows[i]["iva"].ToString()) > 0)
                {
                    //cel2["porcentageiva"] = tablefactura.Rows[i]["iva"].ToString();
                    //cel2["valoriva"] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["ivavalor"].ToString()));
                    //cel2["gravada"] = "S";
                    //cel2["cuentacontable"] = "4145701500";
                    cel2[26] = "S";
                    cel2[22] = tablefactura.Rows[i]["iva"].ToString();
                    cel2[23] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["ivavalor"].ToString()));
                    cel2[3] = "4145701500";

                    //cel3["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                    //cel3["cuentacontable"] = "2408150000";
                    //cel3["devitocredito"] = "C";
                    //cel3["valorsecuencia"] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["ivavalor"])).ToString();
                    //cel3["aniodoc"] = tablefactura.Rows[i]["anioinicio"].ToString();
                    //cel3["mesdoc"] = tablefactura.Rows[i]["mesinicio"].ToString();
                    //cel3["diadoc"] = tablefactura.Rows[i]["diainicio"].ToString();
                    //cel3["secuencia"] = "2";
                    //cel3["nit"] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                    //cel3["descripcion"] = "IVA POR SERVICIOS";
                    //cel3["fromadepago"] = "0";
                    //cel3["gravada"] = "";
                    //cel3["porcentageiva"] = "0";
                    //cel3["valoriva"] = "0";
                    //cel3["tipoconprobante"] = "F-11";
                    //cel3["numerodocumentocruce"] = "0";
                    //cel3["numerovencimiento"] = "0";
                    //cel3["aniovencimiento"] = tablefactura.Rows[i]["aniovence"].ToString();
                    //cel3["mesvencimeinto"] = tablefactura.Rows[i]["mesvence"].ToString();
                    //cel3["diavenciemiento"] = tablefactura.Rows[i]["diavence"].ToString();

                    cel3[0] = "F";
                    cel3[1] = "11";
                    cel3[2] = tablefactura.Rows[i]["facturaventa"].ToString();
                    cel3[3] = "2408150000";
                    cel3[4] = "C";
                    cel3[5] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["ivavalor"])).ToString();
                    cel3[6] = tablefactura.Rows[i]["anioinicio"].ToString();
                    cel3[7] = tablefactura.Rows[i]["mesinicio"].ToString();
                    cel3[8] = tablefactura.Rows[i]["diainicio"].ToString();
                    cel3[9] = "5";
                    cel3[10] = "10";
                    cel3[11] = "0";
                    cel3[12] = "2";
                    cel3[13] = "11";
                    cel3[14] = "0";
                    cel3[15] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                    cel3[16] = "0";
                    cel3[17] = "IVA POR SERVICIOS";
                    cel3[18] = "6";
                    cel3[19] = "";
                    cel3[20] = "0";
                    cel3[21] = "0";
                    cel3[22] = "0";
                    cel3[23] = "0";
                    cel3[24] = "0";
                    cel3[25] = "0";
                    cel3[26] = "";
                    cel3[27] = "0";
                    cel3[28] = "0";
                    cel3[29] = "0";
                    cel3[30] = "0";
                    cel3[31] = "0";
                    cel3[32] = "0";
                    cel3[33] = "0";
                    cel3[34] = "0";
                    cel3[35] = "0";
                    cel3[36] = "0";
                    cel3[37] = "0";
                    cel3[38] = "0";
                    cel3[39] = "0";
                    cel3[40] = "0";
                    cel3[41] = "0";
                    cel3[42] = "0";
                    cel3[43] = "0";
                    cel3[44] = "0";
                    cel3[45] = "0";
                    cel3[46] = "0";
                    cel3[47] = "0";
                    cel3[48] = "0";
                    cel3[49] = "0";
                    cel3[50] = "0";
                    cel3[51] = "0";
                    cel3[52] = "0";
                    cel3[53] = "0";
                    cel3[54] = "0";
                    cel3[55] = "F-11";
                    cel3[56] = "0";
                    cel3[57] = "0";
                    cel3[58] = tablefactura.Rows[i]["aniovence"].ToString();
                    cel3[59] = tablefactura.Rows[i]["mesvence"].ToString();
                    cel3[60] = tablefactura.Rows[i]["diavence"].ToString();
                    cel3[61] = "0";

                    exportsiigo.Rows.Add(cel3);

                    cel1[12] = "3";
                    exportsiigo.Rows.Add(cel1);
                }
                else
                {
                    exportsiigo.Rows.Add(cel1);
                }
                //repetidor.DataSource = exportsiigo;
                //repetidor.DataBind();
            }
        }

        public string identificacion(string dat)
        {
            string result = dat;
            char[] values = dat.ToCharArray();
            for (int i = 0; i < dat.Length; i++)
            {
                if (values[i].Equals('-'))
                {
                    result = dat.Substring(0, i);
                    break;
                }
            }
            return result;
        }
    }
}