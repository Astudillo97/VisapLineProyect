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
    public partial class pagsoporteclien : System.Web.UI.Page
    {

        Permisos per = new Permisos();
        Soportes sp = new Soportes();

        protected void Page_Load(object sender, EventArgs e)
        {
            string url = Request.Url.Segments[Request.Url.Segments.Length - 1];//Obtiene GestioanrCooperativa.aspx
            if (per.ValidarPermisos(url, (DataTable)Session["roles"]))
            {
                if (!IsPostBack)
                {
                    cargartabla();

                }
            }
            else
            {
                Response.Redirect("Error.aspx?error=Acceso denegado: No tiene permisos");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridViewRow gridw = GridView1.SelectedRow;
                Label3.Text = gridw.Cells[4].Text;
                Label4.Text = gridw.Cells[5].Text;
                TextBox1.Text = gridw.Cells[7].Text;
                Label5.Text = gridw.Cells[3].Text;
                Label6.Text = gridw.Cells[1].Text;
                soporteformulario.Visible = true;
            }
            catch (Exception)
            {
                throw;
            }


        }
        protected void cargartabla()
        {
            DataTable dt = sp.ConsultarSoportes();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            contarcontratosopor.Text = dt.Rows.Count.ToString();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            cargartabla();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {
                if (FileUploadControl.HasFile == true)
                {
                    try
                    {
                        string filename = Path.GetFileName(FileUploadControl.FileName);
                        sp.soportes = Validar.validarlleno(filename);
                        sp.contrato_idcontrato = Validar.validarlleno(Label6.Text);
                        sp.tiposoporte_idtiposoporte = Validar.validarlleno("1");
                        sp.RegistrarSoportes(sp);
                        FileUploadControl.SaveAs(Server.MapPath("../../soportes/") + filename);

                        if (FileUpload1.HasFile == true)
                        {
                            try
                            {
                                string filename1 = Path.GetFileName(FileUpload1.FileName);
                                sp.soportes = Validar.validarlleno(filename1);
                                sp.contrato_idcontrato = Validar.validarlleno(Label6.Text);
                                sp.tiposoporte_idtiposoporte = Validar.validarlleno("3");
                                sp.RegistrarSoportes(sp);
                                FileUpload1.SaveAs(Server.MapPath("../../soportes/") + filename1);

                                if (FileUpload2.HasFile == true)
                                {
                                    try
                                    {
                                        string filename2 = Path.GetFileName(FileUpload2.FileName);
                                        sp.soportes = Validar.validarlleno(filename2);
                                        sp.contrato_idcontrato = Validar.validarlleno(Label6.Text);
                                        sp.tiposoporte_idtiposoporte = Validar.validarlleno("2");
                                        sp.RegistrarSoportes(sp);
                                        FileUpload2.SaveAs(Server.MapPath("../../soportes/") + filename2);

                                        cargartabla();
                                        soporteformulario.Visible = false;
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "deletealert();", true);

                                    }
                                    catch (Exception)
                                    {
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                                }
                            }
                            catch (Exception)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

                        }
                    }
                    catch (Exception)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

                }

            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

            }


        }
    }
}