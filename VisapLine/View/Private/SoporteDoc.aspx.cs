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
    public partial class SoporteDoc : System.Web.UI.Page
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
                dat = sp.ConsultarSoportesidcontrato(sp).Rows[0];
                Label6.Text = dat["idcontrato"].ToString();
                Label5.Text = dat["identificacion"].ToString();
                Label3.Text = dat["nombre"].ToString();
                Label4.Text = dat["apellido"].ToString();
                TextBox1.Text = dat["direnviofactura"].ToString();
            }
            else
            {
                Response.Redirect("pagsoporteclien.aspx");
            }

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
                                sp.tiposoporte_idtiposoporte = Validar.validarlleno("2");
                                sp.RegistrarSoportes(sp);
                                FileUpload1.SaveAs(Server.MapPath("../../soportes/") + filename1);

                            }
                            catch (Exception)
                            {

                            }
                        }


                        if (FileUpload2.HasFile == true)
                        {
                            try
                            {
                                string filename2 = Path.GetFileName(FileUpload2.FileName);
                                sp.soportes = Validar.validarlleno(filename2);
                                sp.contrato_idcontrato = Validar.validarlleno(Label6.Text);
                                sp.tiposoporte_idtiposoporte = Validar.validarlleno("3");
                                sp.RegistrarSoportes(sp);
                                FileUpload2.SaveAs(Server.MapPath("../../soportes/") + filename2);
                            }
                            catch (Exception)
                            {

                            }
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

                string guardar = "SI";
                Response.Redirect("pagsoporteclien.aspx?key=" + guardar, false);
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "alerterror();", true);

            }


        }
    }

}