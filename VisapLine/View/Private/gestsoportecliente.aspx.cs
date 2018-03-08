using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;
using System.Data;
using System.IO;
namespace VisapLine.View.Private
{

    public partial class gestsoportecliente : System.Web.UI.Page
    {
        Permisos per = new Permisos();
        Soportes sp = new Soportes();
        DataRow dat;
        protected void Page_Load(object sender, EventArgs e)
        {
            string valor = Convert.ToString(Request.QueryString["key"]);
            if (valor != null)
            {
                sp.contrato_idcontrato = valor;
                dat = sp.ConsultarSoportescargadosidcontrato(sp).Rows[0];
                Label6.Text = dat["idcontrato"].ToString();
                Label5.Text = dat["identificacion"].ToString();
                Label3.Text = dat["nombre"].ToString();
                Label4.Text = dat["apellido"].ToString();
                TextBox1.Text = dat["direnviofactura"].ToString();
                cargardocumento();
            }
            else
            {
                Response.Redirect("pagsoporteclien.aspx");
            }
        }
        protected void cargardocumento()
        {
            sp.contrato_idcontrato = Label6.Text;
            DataTable sopor = sp.ConsultarSoportescargadosidcontrato(sp);
            alldocumento.DataSource = sopor;
            alldocumento.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (FileUploadControl.HasFile == true)
                {

                    string filename = Path.GetFileName(FileUploadControl.FileName);
                    sp.soportes = Validar.validarlleno(filename);
                    sp.contrato_idcontrato = Validar.validarlleno(Label6.Text);
                    sp.tiposoporte_idtiposoporte = Validar.validarlleno("4");
                    sp.RegistrarSoportes(sp);
                    FileUploadControl.SaveAs(Server.MapPath("../../soportes/") + filename);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                }
            }
            catch (Exception)
            {
                throw;
            }


        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Div2.Visible = false;
            editar.Visible = true;
        }

        protected void alldocumento_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName.ToString() == "verdocumento")
            {
                string paramet = e.CommandArgument.ToString();
                Response.Redirect("http://191.102.85.252:30000/soportes/" + paramet);
                //Response.Redirect("../../soportes/soporte_Contratos" + paramet);
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Div2.Visible = true;
            editar.Visible = false;
        }
    }
}
