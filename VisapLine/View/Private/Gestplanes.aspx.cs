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
    public partial class Gestplanes : System.Web.UI.Page
    {
        Permisos per = new Permisos();
        Plan pn = new Plan();
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                if (!IsPostBack)
                {
                    try
                    {
                        if (!IsPostBack)

                        {
                            string valor = Convert.ToString(Request.QueryString["key"]);
                            Label1.Text = valor;
                            DataRow dt=   Validar.Consulta(pn.ConsultarPlanid(Label1.Text)).Rows[0];
                            TextBox1.Text = dt["valor"].ToString();
                            texareadetalle.Value = "";
                            CheckBox1.Checked = false;
                            CheckBox2.Checked = false;
                            CheckBox3.Checked = false;
                            DropDownList1.SelectedValue = "Seleccione";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            DropDownList2.SelectedValue = "Seleccione";
                        }
                    }
                    catch (Exception)
                    {

                        throw;

                    }
                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}