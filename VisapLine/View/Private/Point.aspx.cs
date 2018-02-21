using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;

namespace VisapLine.View.Private
{
    public partial class Point : System.Web.UI.Page
    {
        Puntos punto = new Puntos();
        public DataTable punt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                punt = punto.ConsultarPuntosllenos();
            }
            catch (Exception)
            {

            }
            
        }
    }
}