using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using iText.IO.Image;
using iText.Kernel.Geom;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;

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
            PdfDocument documento = new PdfDocument(new PdfWriter(destino));
            Document doc = new Document(documento, PageSize.LEGAL);
            Image imagen = new Image(ImageDataFactory.Create(dirimagen));
            imagen.SetWidth(150);
            doc.Add(imagen);
            Paragraph empresanombre = new Paragraph("C & C VISION SAS.");
            Paragraph empresanit = new Paragraph("NIT: 846.000.339-0");
            Paragraph empresadireccion = new Paragraph("Carrera 10 N°15-60 Edificio Pioneros");
            Paragraph empresalineanacional = new Paragraph("Linea Nacional 018000952240");
            Paragraph empresatelefonos = new Paragraph("4351949 - 3184903427");
            Paragraph empresaweb = new Paragraph("wwww.visapline.com");
            Rectangle rect = new Rectangle(36, 700, 100, 100);
            
            doc.Close();
        }
    }
}