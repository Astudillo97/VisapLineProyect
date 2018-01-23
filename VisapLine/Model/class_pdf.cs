using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using iText.Barcodes;
using iText.IO.Image;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.Kernel.Pdf;
using iText.Kernel.Pdf.Canvas;
using iText.Layout;
using iText.Layout.Borders;
using iText.Layout.Element;
using iText.Layout.Properties;
using VisapLine.Exeption;

namespace VisapLine.Model
{
    public class class_pdf
    {

        public void CrearPdf(string destino)
        {

            PdfDocument documento = new PdfDocument(new PdfWriter(destino));
            Document doc = new Document(documento, PageSize.LEGAL);
            Table table = new Table(8);


            for (int i = 0; i < 16; i++)
            {
                table.AddCell("hi");
            }
            doc.Add(table);
            doc.Close();
        }

        private static string Descripcion(DataTable data, string key)
        {
            DataRow dat = data.Rows.Find(key);
            return dat["dato1"].ToString();
        }

        public static string GenerarNombrePdf(string dat)
        {
            DateTime dateTime = DateTime.Now;
            return dateTime.Year + "" + dateTime.Month + "" + dateTime.Day + "" + dateTime.Hour + "" + dateTime.Minute + "-" + dat + ".pdf";
        }

        public string CrearFactura(DataTable empresa,DataRow tercero, DataRow facture, DataTable detalle)
        {
            //Redireccion a la carpeta del proyecto
            string path = HttpContext.Current.Server.MapPath("~");
            string FONT = path + "Archivos\\FreeSans.ttf";
            string dir = "Archivos\\";
            string name = GenerarNombrePdf("s");
            //creacion del documento pdf
            PdfDocument documento = new PdfDocument(new PdfWriter(dir+name));
            Document doc = new Document(documento, PageSize.LETTER);


            ////Definicion del encabezado
            Table header = new Table(3).SetWidth(UnitValue.CreatePercentValue(100)).SetBorder(iText.Layout.Borders.Border.NO_BORDER);
            Image imagen = new Image(ImageDataFactory.Create(path+Descripcion(empresa,"logo"))).SetWidth(UnitValue.CreatePercentValue(100));

            ////Celda hizaquierda de la factura
            Cell logo = new Cell().SetBorder(iText.Layout.Borders.Border.NO_BORDER).SetWidth(UnitValue.CreatePercentValue(25));
            logo.Add(imagen);

            ////Celda central de la factura
            Cell descripcion = new Cell().SetWidth(UnitValue.CreatePercentValue(30)).SetBorder(iText.Layout.Borders.Border.NO_BORDER); ;
            PdfFont font = PdfFontFactory.CreateFont(FONT, "Cp1251", true);
            Paragraph empresanombre = new Paragraph(Descripcion(empresa, "nombrejuridico")).SetFont(font).SetFontSize(11f).SetMarginTop(-4);
            Paragraph empresanit = new Paragraph("NIT: "+Descripcion(empresa,"nit")).SetFontSize(8f).SetMarginTop(-4);
            Paragraph empresadireccion = new Paragraph(Descripcion(empresa,"direccion")).SetFontSize(8f).SetMarginTop(-4);
            Paragraph empresalineanacional = new Paragraph("Linea Nacional "+Descripcion(empresa,"lineanacional")).SetFontSize(8f).SetMarginTop(-4);
            Paragraph empresatelefonos = new Paragraph(Descripcion(empresa,"telefono1")+" - "+Descripcion(empresa,"telefono2")).SetFontSize(8f).SetMarginTop(-4);
            Paragraph empresaweb = new Paragraph(Descripcion(empresa,"web")).SetFontSize(8f).SetMarginTop(-4);

            //Adicciones a la cell descripcion
            descripcion.Add(empresanombre);
            descripcion.Add(empresanit);
            descripcion.Add(empresadireccion);
            descripcion.Add(empresalineanacional);
            descripcion.Add(empresatelefonos);
            descripcion.Add(empresaweb);

            ////Celda derecha de facturacion
            Cell factura = new Cell().SetWidth(UnitValue.CreatePercentValue(45));

            Table subfactura = new Table(2).SetWidth(UnitValue.CreatePercentValue(100));

            Cell subfacizq = new Cell().SetWidth(UnitValue.CreatePercentValue(55)).SetTextAlignment(TextAlignment.LEFT).SetBorder(Border.NO_BORDER);
            Paragraph facturadeventa = new Paragraph("FACTURA DE VENTA").SetFontSize(10f);
            Paragraph fechaemision = new Paragraph("FECHA DE EMISIÓN").SetFontSize(10f);
            Paragraph periodo = new Paragraph("PERIODO").SetFontSize(10f);
            subfacizq.Add(facturadeventa);
            subfacizq.Add(fechaemision);
            subfacizq.Add(periodo);
            subfactura.AddCell(subfacizq);

            Cell subfacder = new Cell().SetWidth(UnitValue.CreatePercentValue(45)).SetTextAlignment(TextAlignment.RIGHT).SetBorder(Border.NO_BORDER);
            Paragraph facturadeventavalue = new Paragraph("FS-11478").SetFontSize(10f);
            Paragraph fechaemisionvalue = new Paragraph("01/09/2017").SetFontSize(10f);
            Paragraph periodovalue = new Paragraph("SEPTIEMBRE 2017").SetFontSize(10f);
            subfacder.Add(facturadeventavalue);
            subfacder.Add(fechaemisionvalue);
            subfacder.Add(periodovalue);
            subfactura.AddCell(subfacder);

            factura.Add(subfactura);

            ////Agregando celdas a la tabla
            header.AddCell(logo);
            header.AddCell(descripcion);
            header.AddCell(factura);
            doc.Add(header);

            //Creacion de la tabla encabezado

            Table encabezado = new Table(2).SetWidth(UnitValue.CreatePercentValue(100)).SetBorder(Border.NO_BORDER);
            encabezado.SetMarginTop(10f);

            //creacion de las celdas de la tabla encabezado
            ////Tabla del lado Hizquierdo, codigo de barra y publicidad mensual
            Cell encHiz = new Cell().SetWidth(UnitValue.CreatePercentValue(37)).SetBorder(Border.NO_BORDER);
            Cell codigobarra = new Cell().SetWidth(UnitValue.CreatePercentValue(100)).SetHeight(50);

            String code = "00174-FS-11748";
            Barcode128 code128 = new Barcode128(documento);
            code128.SetCode(code);
            code128.SetTextAlignment(10);
            code128.SetCodeType(Barcode128.CODE128);
            Image code128Image = new Image(code128.CreateFormXObject(documento)).SetWidth(UnitValue.CreatePercentValue(100));
            codigobarra.Add(code128Image);

            encHiz.Add(codigobarra);
            Cell imagenpublic = new Cell().SetWidth(UnitValue.CreatePercentValue(100)).SetBorder(Border.NO_BORDER);
            Image publicidad = new Image(ImageDataFactory.Create(Descripcion(empresa,"publicidad"))).SetWidth(UnitValue.CreatePercentValue(100));
            imagenpublic.Add(publicidad);
            encHiz.Add(imagenpublic);

            ////Tabla de informacion del tercero
            Cell encDer = new Cell().SetWidth(UnitValue.CreatePercentValue(63)).SetFontSize(8f).SetBorder(Border.NO_BORDER);
            Cell informtercero = new Cell().SetWidth(UnitValue.CreatePercentValue(100));
            Paragraph terceronombre = new Paragraph("CENTRAL ADMINISTRATIVA Y CONTABLE CENAC - BRIGADA XII CONTRATO2");
            Paragraph terceroidentficacion = new Paragraph("C.C./NIT: 8080134212-1");
            Paragraph tercerodireccion = new Paragraph("CL 15 CR 16-92 BARRIO EL CENTRO");
            Paragraph tercerotelefono = new Paragraph("TELEFONOS: 32134441232");
            informtercero.Add(terceronombre).Add(terceroidentficacion).Add(tercerodireccion).Add(tercerotelefono);

            Table tableinformacionfactura = new Table(2).SetWidth(UnitValue.CreatePercentValue(100)).SetMarginTop(10).SetBold().SetBorder(new SolidBorder(1));

            Cell informfactura = new Cell().SetWidth(UnitValue.CreatePercentValue(50)).SetBorder(Border.NO_BORDER);
            Paragraph limitepago = new Paragraph("Fecha Limite de pago:");
            Paragraph suspencion = new Paragraph("Fecha de sustencion del servicio:");
            Paragraph referencia = new Paragraph("Referencia de pago:");
            Paragraph codigo = new Paragraph("Codigo:");
            informfactura.Add(limitepago).Add(suspencion).Add(referencia).Add(codigo);

            Cell informfacturavalue = new Cell().SetWidth(UnitValue.CreatePercentValue(50)).SetBorder(Border.NO_BORDER);
            Paragraph limitepagovalue = new Paragraph("Fecha Limite de pago:").SetFontSize(10f);
            Paragraph suspencionvalue = new Paragraph("Fecha de sustencion del servicio:").SetFontSize(10f);
            Paragraph referenciavalue = new Paragraph("Referencia de pago:").SetFontSize(10f);
            Paragraph codigovalue = new Paragraph("Codigo:").SetFontSize(10f);
            informfacturavalue.Add(limitepagovalue).Add(suspencionvalue).Add(referenciavalue).Add(codigovalue);

            tableinformacionfactura.AddCell(informfactura).AddCell(informfacturavalue);

            encDer.Add(informtercero).Add(tableinformacionfactura);
            encabezado.AddCell(encHiz);
            encabezado.AddCell(encDer);
            doc.Add(encabezado);
            //-------------Contenido de la Factura: Descripcion de la facturación------------------------ 
            //-------------------------------------------------------------------------------------------
            Table tableDescripcion = new Table(4).SetMarginTop(8f).SetWidth(UnitValue.CreatePercentValue(100)).SetFontSize(8).SetBorder(new SolidBorder(1));
            Cell descrpcion = new Cell().Add(new Paragraph("DESCRIPCIÓN")).SetWidth(UnitValue.CreatePercentValue(50));
            Cell cantidad = new Cell().Add(new Paragraph("CANTIDAD")).SetWidth(UnitValue.CreatePercentValue(16));
            Cell valorunitario = new Cell().Add(new Paragraph("VALOR UNITARIO")).SetWidth(UnitValue.CreatePercentValue(17));
            Cell total = new Cell().Add(new Paragraph("TOTAL")).SetWidth(UnitValue.CreatePercentValue(17));
            tableDescripcion.AddCell(descrpcion).AddCell(cantidad).AddCell(valorunitario).AddCell(total);

            ////Recorrer una fuente de datos para Cargar
            for (int i = 0; i < 4; i++)
            {
                Cell descrpcionval = new Cell().Add(new Paragraph("DESCRIPCIÓN------")).SetWidth(UnitValue.CreatePercentValue(50)).SetBorder(Border.NO_BORDER);
                Cell cantidadval = new Cell().Add(new Paragraph(i.ToString())).SetWidth(UnitValue.CreatePercentValue(16)).SetBorder(Border.NO_BORDER);
                Cell valorunitarioval = new Cell().Add(new Paragraph("VALOR UNITARIO")).SetWidth(UnitValue.CreatePercentValue(17)).SetBorder(Border.NO_BORDER);
                Cell totalval = new Cell().Add(new Paragraph("TOTAL")).SetWidth(UnitValue.CreatePercentValue(17)).SetBorder(Border.NO_BORDER);
                tableDescripcion.AddCell(descrpcionval).AddCell(cantidadval).AddCell(valorunitarioval).AddCell(totalval);
            }

            doc.Add(tableDescripcion);
            //Generacion de subtotales
            Table totales = new Table(2).SetWidth(UnitValue.CreatePercentValue(100)).SetFontSize(8f).SetBorder(Border.NO_BORDER);

            Cell cel1 = new Cell().SetWidth(UnitValue.CreatePercentValue(66)).SetBorder(Border.NO_BORDER);
            Table totales1 = new Table(2).SetWidth(UnitValue.CreatePercentValue(60)).SetBorder(new SolidBorder(1));
            totales1.AddCell(new Cell().Add(new Paragraph("Total Factura"))).AddCell(new Cell().Add(new Paragraph("0,00")));
            totales1.AddCell(new Cell().Add(new Paragraph("Saldo Anterior"))).AddCell(new Cell().Add(new Paragraph("0,00")));
            totales1.AddCell(new Cell().Add(new Paragraph("SALDO ACTUAL"))).AddCell(new Cell().Add(new Paragraph("0,00")));
            cel1.Add(totales1);
            cel1.Add(new Cell().Add(new Paragraph("SEÑOR USUARIO LE RECORDAMOS QUE LA SUSPENCIÓN DEL SERVICIO POR NO PAGO "+
                "GENERA COBRO DE RECONEXIÓN, PARA EL SERVICIO DE BANDA ANCHA TENDRA UN VALOR DE $11.900 MÁS IVA, "+
                " LO INVITAMOS A REALIZAR EL PAGO OPORTUNO DE SU FACTURA.").SetFontSize(8)).SetWidth(UnitValue.CreatePercentValue(100)));
            Cell cel2 = new Cell().SetWidth(UnitValue.CreatePercentValue(34)).SetBorder(Border.NO_BORDER);
            Table totales2 = new Table(2).SetWidth(UnitValue.CreatePercentValue(100)).SetFontSize(9);
            totales2.AddCell(new Cell().Add(new Paragraph("Exento")).SetWidth(UnitValue.CreatePercentValue(50))).AddCell(new Cell().Add(new Paragraph("0,00")));
            totales2.AddCell(new Cell().Add(new Paragraph("subtotal"))).AddCell(new Cell().Add(new Paragraph("0,00")));
            totales2.AddCell(new Cell().Add(new Paragraph("IVA"))).AddCell(new Cell().Add(new Paragraph("0,00")));
            totales2.AddCell(new Cell().Add(new Paragraph("TOTAL FACTURA").SetFontSize(10))).AddCell(new Cell().Add(new Paragraph("0,00").SetItalic().SetFontSize(10)));
            cel2.Add(totales2);
            cel2.Add(new Paragraph(Validar.enletras("485324")).SetFontSize(10).SetBorder(Border.NO_BORDER).SetFontSize(8));
            totales.AddCell(cel1).AddCell(cel2);
            doc.Add(totales);
            Table normativa = new Table(1).SetWidth(UnitValue.CreatePercentValue(100)).SetFontSize(8);
            Cell norm = new Cell().SetTextAlignment(TextAlignment.CENTER).SetBorder(Border.NO_BORDER).SetBackgroundColor(new iText.Kernel.Colors.DeviceCmyk(1,1,1,1)).Add(new Paragraph("A esta factura de venta aplican las normas relativas" +
                " a la letra de cambio (artículo 5 Ley 1231 de 2008). Con esta el comprador declara haber recibido real y materialmente" +
                " las mercancías o prestación de servicios descritos en este título -Valor.")).Add(new Paragraph("Para información sobre" +
                " las tarifas,reclamos sobre facturación, atención de peticiones, quejas, reclamos, recursos y conocer el estado de los" +
                " mismos en relación a nuestros servicio cominiquese a nuestra linea 098-435-1949--FAVOR GIRAR CHEQUE A NOMBRE DE C & C" +
                " VISION SAS. ---Cuenta Corriente No. 36400496-0 Banco BBVA Florencia. \n\n")).Add(new Paragraph("Número de Resolucion" +
                " Dian 18762001688490 autoriza en 2016-12-28 prefijo FS desde el número 10001 al 20000 Regimen Común - Actividad Económica Tarifa.").SetBold());
            normativa.AddCell(norm);
            doc.Add(normativa);
            doc.SetLineThrough();
            doc.Close();
            return name;
        }
    }
}