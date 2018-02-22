using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Model;
using VisapLine.Exeption;

namespace VisapLine.View.Private
{
    public partial class Tipofact : System.Web.UI.Page
    {

        TipoFactura tf = new TipoFactura();
        Permisos per = new Permisos();
        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
                if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
                {
                    if (!IsPostBack)
                    {
                        texboxtipofactura.Text = "";
                        tablatipofactura();
                    }
                }
                else
                {
                    Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                tf.tipofactura = Validar.validarlleno(texboxtipofactura.Text.ToUpper());


                if (tf.RegistrarTipoFactura(tf))
                {
                    texboxtipofactura.Text = "";
                    tablatipofactura();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);

                
                }
                else
                {
                    tablatipofactura();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);


                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;


            }

            



        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "borrar")
                {
                    string DeleteRowId = e.CommandArgument.ToString();
                    tf.eliminar(int.Parse(DeleteRowId));
                    //Call Procedure here to delete row
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "elimalert();", true);
                    tablatipofactura();
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
          
        }


        protected void tablatipofactura()
        {
            try
            {
                DataTable dt = tf.ConsultarTipoFactura();
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }
            
        }
    }
}