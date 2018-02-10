using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;

namespace VisapLine.View.Private
{
    public partial class GestIncidencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!IsPostBack)
            {

            }



        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void cargartabla(string idusuario)
        {
           
            DataTable dt = pn.ConsultarPlantipoterce(idusuario);
            GridView2.DataSource = dt;
            GridView2.DataBind();
        }
    }
}