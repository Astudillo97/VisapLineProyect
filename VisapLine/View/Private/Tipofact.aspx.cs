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
    public partial class Tipofact : System.Web.UI.Page
    {

        TipoFactura tf = new TipoFactura();
        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                if (!IsPostBack)
                {
                    texboxtipofactura.Text = "";
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            tf.tipofactura = texboxtipofactura.Text.ToUpper();
            

            if (tf.RegistrarTipoFactura(tf))
            {
                textError.InnerHtml = "Se ha Registrado correctamente";
                Alerta.CssClass = "alert alert-success";
                Alerta.Visible = true;
               
                Response.Redirect("Tipofact.aspx");
            }
            else
            {
                textError.InnerHtml = "No se registro";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                texboxtipofactura.Text = "";
                Response.Redirect("Tipofact.aspx");
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
                    Response.Redirect("Tipofact.aspx");
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