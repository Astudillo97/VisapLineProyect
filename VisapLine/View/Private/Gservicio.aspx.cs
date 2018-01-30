using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using System.Data;
namespace VisapLine.View.Private
{
    public partial class Gservicio : System.Web.UI.Page
    {
        OrdenSalida ord = new OrdenSalida();
        DetalleSalida dsord = new DetalleSalida();
        TipoProducto tp = new TipoProducto();
        public static string valosal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                
            }
        }
        protected void Llenargrid(string dato) {
            gridtelefono.DataSource = ord.cosnutlarlefonosorden(dato);
            gridtelefono.DataBind();
        }
        protected void llenardetalle()
        {
            GridViewdeta.DataSource = ord.Consultardetalleordesali(valosal);
            GridViewdeta.DataBind();
        }
        protected void Llenardrop(){
            droptiporduc.DataSource =tp.ConsultarTipoProducto();
            droptiporduc.DataTextField = "tipoproducto";
            droptiporduc.DataValueField = "idtipoproducto";
            droptiporduc.DataBind();
}

        protected void droptiporduc_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            inventariogrid.DataSource = ord.consultarinventario(droptiporduc.SelectedIndex);
            inventariogrid.DataBind();
        }

        protected void addinvent_Click(object sender, EventArgs e)
        {
            TextBox tcant = (TextBox)inventariogrid.Rows[0].Cells[2].FindControl("txbcanti");     
            dsord.insertardetallesalida(tcant.Text, inventariogrid.Rows[0].Cells[0].Text, valosal);
            llenardetalle();
        }

        protected void btnconsultar_Click(object sender, EventArgs e)
        {
            valosal = Borden.Text;
            DataTable consulta = ord.Consultarorden(valosal);
            formordenes.DataSource = consulta;
            formordenes.DataBind();
            Llenargrid(consulta.Rows[0][7].ToString());
            llenardetalle();
            Llenardrop();
        }
    }
}