using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class RevisionCartera : System.Web.UI.Page
    {
        public static double factua = 0;
        public static double factuaiva=0;
        public static double saldo=0;
        public static double iva=0;
        Class1 consulta = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            llenardato();
        }

        private void llenardato()
        {
            repetidors.DataSource = consulta.cartera();
            repetidors.DataBind();
            DataTable dttotales = consulta.totalescartera();
            totalsuscripto.Text= Convert.ToString(dttotales.Rows[0][0].ToString()).Replace(',', '.');
            totalfacturado.Text= Convert.ToString(dttotales.Rows[0][1].ToString()).Replace(',', '.');
            totaliva.Text= Convert.ToString(dttotales.Rows[0][2].ToString()).Replace(',', '.');
            totalsaldo.Text = Convert.ToString(dttotales.Rows[0][3].ToString()).Replace(',','.');
            totalconiva.Text= Convert.ToString(dttotales.Rows[0][4].ToString()).Replace(',', '.');
            totaltotal.Text= Convert.ToString(dttotales.Rows[0][5].ToString()).Replace(',', '.');
            totalfactura.Text= Convert.ToString(dttotales.Rows[0][6].ToString()).Replace(',', '.').ToString();
            totalpagado.Text = Convert.ToString(dttotales.Rows[0][7].ToString()).Replace(',', '.').ToString();
        }

        protected void repetidors_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
       
    }
}