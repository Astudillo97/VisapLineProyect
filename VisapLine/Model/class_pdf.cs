using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using iText.IO.Image;
using iText.Kernel.Font;
using iText.Kernel.Geom;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;

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
        public void CrearFactura(string destino,string dirimagen)
        {
            //creacion del documento pdf
            PdfDocument documento = new PdfDocument(new PdfWriter(destino));
            Document doc = new Document(documento, PageSize.LETTER);


            ////Definicion del encabezado
            Table header = new Table(3).SetWidth(UnitValue.CreatePercentValue(100));
            header.SetBorder(iText.Layout.Borders.Border.NO_BORDER);
            Image imagen = new Image(ImageDataFactory.Create(dirimagen));
            imagen.SetWidth(200);

            ////Celda hizaquierda de la factura
            Cell logo = new Cell();
            logo.SetBorder(iText.Layout.Borders.Border.NO_BORDER);
            logo.Add(imagen);
            
            ////Celda central de la factura
            Cell descripcion = new Cell();
            string FONT = "C:\\Users\\Yeferson Astudillo\\Documents\\GitHub\\VisapLineProyect\\VisapLine\\Archivos\\FreeSans.ttf";
            PdfFont font = PdfFontFactory.CreateFont(FONT, "Cp1251", true);
            descripcion.SetBorder(iText.Layout.Borders.Border.NO_BORDER);
            Paragraph empresanombre = new Paragraph("C & C VISION SAS.").SetFont(font);
            empresanombre.SetFontSize(11f);
            Paragraph empresanit = new Paragraph("NIT: 846.000.339-0");
            empresanit.SetFontSize(8f);
            Paragraph empresadireccion = new Paragraph("Carrera 10 N°15-60 Edificio Pioneros");
            empresadireccion.SetFontSize(8f);
            Paragraph empresalineanacional = new Paragraph("Linea Nacional 018000952240");
            empresalineanacional.SetFontSize(8f);
            Paragraph empresatelefonos = new Paragraph("4351949 - 3184903427");
            empresatelefonos.SetFontSize(8f);
            Paragraph empresaweb = new Paragraph("wwww.visapline.com");
            empresaweb.SetFontSize(8f);
            descripcion.Add(empresanombre);
            descripcion.Add(empresanit);
            descripcion.Add(empresadireccion);
            descripcion.Add(empresalineanacional);
            descripcion.Add(empresatelefonos);
            descripcion.Add(empresaweb);

            ////Celda derecha de facturacion
            Cell factura = new Cell();
            factura.SetTextAlignment(iText.Layout.Properties.TextAlignment.RIGHT);
            factura.SetMarginRight(0f);
            Paragraph facturadeventa = new Paragraph("FACTURA DE VENTA \tFS-11478");
            facturadeventa.SetFontSize(11f);
            Paragraph fechaemision = new Paragraph("FECHA DE EMISIÓN \t01/09/2017");
            fechaemision.SetFontSize(11f);
            Paragraph periodo = new Paragraph("PERIODO \tseptiembre 2017");
            periodo.SetFontSize(11f);
            factura.Add(facturadeventa);
            factura.Add(fechaemision);
            factura.Add(periodo);

            ////Agregando celdas a la tabla
            header.AddCell(logo);
            header.AddCell(descripcion);
            header.AddCell(factura);

            //Creacion de la tabla encabezado

            Table encabezado = new Table(2).SetWidth(UnitValue.CreatePercentValue(100));
            encabezado.SetMarginTop(10f);
            encabezado.SetMarginLeft(0f);
            encabezado.SetMarginRight(0f);
            encabezado.GetWidth();
            Cell encHiz = new Cell();
            encHiz.Add(new Paragraph("Este es el texto de donde va el codigo de barras"+ encabezado.GetWidth()));
            encHiz.SetMaxWidth(200f);
            Cell encDer = new Cell();
            encDer.Add(new Paragraph("Este es el texto de donde van las descripciones"));
            encDer.Add(encHiz);
            encabezado.AddCell(encHiz);
            encabezado.AddCell(encDer);

            //Agregando tabla a el documemto
            doc.Add(header);
            doc.Add(encabezado);
            doc.Close();
        }
    }
}