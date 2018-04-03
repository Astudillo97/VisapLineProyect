using System;
using System.Data;

namespace VisapLine.Model
{
    public partial class VistadeExporte : System.Web.UI.Page
    {
        Factura fact = new Factura();
        public static DataTable tablefactura=new DataTable();
        public static DataTable exportsiigo = new DataTable();
        excel drexcel = new excel();
        protected void Page_Load(object sender, EventArgs e)
        {
            exportsiigo.Rows.Clear();
            exportsiigo.Dispose();
            exportsiigo.Columns.Clear();
            exportsiigo.Columns.Add("numerodoc");
            exportsiigo.Columns.Add("cuentacontable");
            exportsiigo.Columns.Add("devitocredito");
            exportsiigo.Columns.Add("valorsecuencia");
            exportsiigo.Columns.Add("aniodoc");
            exportsiigo.Columns.Add("mesdoc");
            exportsiigo.Columns.Add("diadoc");
            exportsiigo.Columns.Add("secuencia");
            exportsiigo.Columns.Add("nit");
            exportsiigo.Columns.Add("descripcion");
            exportsiigo.Columns.Add("fromadepago");
            exportsiigo.Columns.Add("gravada");
            exportsiigo.Columns.Add("porcentageiva");
            exportsiigo.Columns.Add("valoriva");
            exportsiigo.Columns.Add("tipoconprobante");
            exportsiigo.Columns.Add("numerodocumentocruce");
            exportsiigo.Columns.Add("numerovencimiento");
            exportsiigo.Columns.Add("aniovencimiento");
            exportsiigo.Columns.Add("mesvencimeinto");
            exportsiigo.Columns.Add("diavenciemiento");

            llenarTabla();
        }
        public void llenarTabla()
        {

            tablefactura = fact.ConsultaSiigo("01-04-2018","31-05-2018");
            for (int i = 0; i < tablefactura.Rows.Count; i++)
            {
                DataRow cel1 = exportsiigo.NewRow();
                DataRow cel2 = exportsiigo.NewRow();
                DataRow cel3 = exportsiigo.NewRow();

                cel2["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                cel2["cuentacontable"] = "4145702500";
                cel2["devitocredito"] = "C";
                cel2["valorsecuencia"] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["valor"].ToString()));
                cel2["aniodoc"] = tablefactura.Rows[i]["anioinicio"].ToString();
                cel2["mesdoc"] = tablefactura.Rows[i]["mesinicio"].ToString();
                cel2["diadoc"] = tablefactura.Rows[i]["diainicio"].ToString();
                cel2["secuencia"] = "1";
                cel2["nit"] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                cel2["descripcion"] = tablefactura.Rows[i]["plan"].ToString();
                cel2["fromadepago"] = "0";
                cel2["gravada"] = "N";
                cel2["porcentageiva"] = "0";
                cel2["valoriva"] = "0";
                cel2["tipoconprobante"] = "F-11";
                cel2["numerodocumentocruce"] = "0";
                cel2["numerovencimiento"] = "0";
                cel2["aniovencimiento"] = tablefactura.Rows[i]["aniovence"].ToString();
                cel2["mesvencimeinto"] = tablefactura.Rows[i]["mesvence"].ToString();
                cel2["diavenciemiento"] = tablefactura.Rows[i]["diavence"].ToString();
                exportsiigo.Rows.Add(cel2);

                cel1["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                cel1["cuentacontable"] = "1305050100";
                cel1["devitocredito"] = "D";
                cel1["valorsecuencia"] = Math.Round(Convert.ToDouble((Convert.ToDouble(tablefactura.Rows[i]["valor"].ToString()) + Convert.ToDouble(tablefactura.Rows[i]["ivavalor"])).ToString()));
                cel1["aniodoc"] = tablefactura.Rows[i]["anioinicio"].ToString();
                cel1["mesdoc"] = tablefactura.Rows[i]["mesinicio"].ToString();
                cel1["diadoc"] = tablefactura.Rows[i]["diainicio"].ToString();
                cel1["secuencia"] = "2";
                cel1["nit"] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                cel1["descripcion"] = tablefactura.Rows[i]["nombre"].ToString();
                cel1["fromadepago"] = "6";
                cel1["gravada"] = "";
                cel1["porcentageiva"] = "0";
                cel1["valoriva"] = "0";
                cel1["tipoconprobante"] = "F-11";
                cel1["numerodocumentocruce"] = tablefactura.Rows[i]["facturaventa"].ToString();
                cel1["numerovencimiento"] = "1";
                cel1["aniovencimiento"] = tablefactura.Rows[i]["aniovence"].ToString();
                cel1["mesvencimeinto"] = tablefactura.Rows[i]["mesvence"].ToString();
                cel1["diavenciemiento"] = tablefactura.Rows[i]["diavence"].ToString();
                

                if (Convert.ToDouble(tablefactura.Rows[i]["iva"].ToString())>0)
                {
                    cel2["porcentageiva"] = tablefactura.Rows[i]["iva"].ToString();
                    cel2["valoriva"] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["ivavalor"].ToString()));
                    cel2["gravada"] = "S";
                    cel2["cuentacontable"] = "4145701500";

                    cel3["numerodoc"] = tablefactura.Rows[i]["facturaventa"].ToString();
                    cel3["cuentacontable"] = "2408150000";
                    cel3["devitocredito"] = "C";
                    cel3["valorsecuencia"] = Math.Round(Convert.ToDouble(tablefactura.Rows[i]["ivavalor"])).ToString();
                    cel3["aniodoc"] = tablefactura.Rows[i]["anioinicio"].ToString();
                    cel3["mesdoc"] = tablefactura.Rows[i]["mesinicio"].ToString();
                    cel3["diadoc"] = tablefactura.Rows[i]["diainicio"].ToString();
                    cel3["secuencia"] = "2";
                    cel3["nit"] = identificacion(tablefactura.Rows[i]["identificacion"].ToString());
                    cel3["descripcion"] = "IVA POR SERVICIOS";
                    cel3["fromadepago"] = "0";
                    cel3["gravada"] = "";
                    cel3["porcentageiva"] = "0";
                    cel3["valoriva"] = "0";
                    cel3["tipoconprobante"] = "F-11";
                    cel3["numerodocumentocruce"] = "0";
                    cel3["numerovencimiento"] = "0";
                    cel3["aniovencimiento"] = tablefactura.Rows[i]["aniovence"].ToString();
                    cel3["mesvencimeinto"] = tablefactura.Rows[i]["mesvence"].ToString();
                    cel3["diavenciemiento"] = tablefactura.Rows[i]["diavence"].ToString();
                    exportsiigo.Rows.Add(cel3);

                    cel1["secuencia"] = "3";
                    exportsiigo.Rows.Add(cel1);
                }
                else
                {
                    exportsiigo.Rows.Add(cel1);
                }
                repetidor.DataSource = exportsiigo;
                repetidor.DataBind();
            }
        }

        public string identificacion(string dat)
        {
            string result=dat;
            char[] values = dat.ToCharArray();
            for (int i = 0; i < dat.Length; i++)
            {
                if (values[i].Equals('-'))
                {
                    result= dat.Substring(0, i);
                    break;
                }
            }
            return result;
        }
    }
}