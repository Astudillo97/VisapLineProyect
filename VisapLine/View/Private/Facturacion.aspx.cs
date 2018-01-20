using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
namespace VisapLine.View.Private
{
    public partial class Facturacion : System.Web.UI.Page
    {
        class_pdf pdf = new class_pdf();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GenerarFactura(object sender, EventArgs e)
        {
            String rootPath = Server.MapPath("~");
            string urlpdf = rootPath + "Archivos\\mipdf.pdf";
            string imagen = rootPath + "Archivos\\imgvisap.png";
            //pdf.CrearPdf(urlpdf);
            pdf.CrearFactura(urlpdf, imagen);

        }
    }
}