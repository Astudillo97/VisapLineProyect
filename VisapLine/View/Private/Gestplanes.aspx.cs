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

            try
            {
                if (!IsPostBack)

                {
                    string valor = Convert.ToString(Request.QueryString["key"]);
                    Label1.Text = valor;
                    if (Label1.Text != "")
                    {
                        DataRow dt = Validar.Consulta(pn.ConsultarPlanid(Label1.Text)).Rows[0];
                        TextBox1.Text = dt["valor"].ToString();
                        TextBox4.Text = dt["detalle"].ToString();
                        if (dt["telefonia"].ToString() == "False")
                        {
                            CheckBox1.Checked = false;
                        }
                        else
                        {
                            CheckBox1.Checked = true;
                        }
                        if (dt["television"].ToString() == "False")
                        {
                            CheckBox2.Checked = false;
                        }
                        else
                        {
                            CheckBox2.Checked = true;
                        }
                        if (dt["internet"].ToString() == "False")
                        {
                            CheckBox3.Checked = false;
                        }
                        else
                        {
                            CheckBox3.Checked = true;
                        }


                        DropDownList1.SelectedValue = dt["tipoplan"].ToString();
                        TextBox2.Text = dt["subida"].ToString();
                        TextBox3.Text = dt["bajada"].ToString();
                        DropDownList2.SelectedValue = dt["estado"].ToString();
                    }
                    else
                    {
                        Response.Redirect("pagplan.aspx");
                    }

                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hwa", "error();", true);
            }



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBox1.Enabled = false;
            TextBox4.Enabled = false;
            CheckBox1.Enabled = false;
            CheckBox2.Enabled = false;
            CheckBox3.Enabled = false;
            DropDownList1.Enabled = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;
            DropDownList2.Enabled = false;
            Button3.Visible = true;
            Button1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Validar.validartrue(validarcheck());
                pn.valor = Validar.validarlleno(TextBox1.Text);
                pn.detalle = Validar.validarlleno(TextBox4.Text.ToUpper());
                pn.telefonia = CheckBox2.Checked.ToString();
                pn.televicion = CheckBox3.Checked.ToString();
                pn.internet = CheckBox1.Checked.ToString();
                pn.estado = Validar.validarselected(DropDownList2.SelectedValue);
                pn.tipoplan = Validar.validarselected(DropDownList1.SelectedValue);
                pn.subida = Validar.validarlleno(TextBox2.Text);
                pn.bajada = Validar.validarlleno(TextBox3.Text);
                pn.idplan = Validar.validarlleno(Label1.Text);
                if (pn.updaplan(pn))
                {
                    string guardar = "SI";
                    Response.Redirect("pagplan.aspx?key=" + guardar);
                }
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }



        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Enabled = true;
            TextBox4.Enabled = true;
            CheckBox1.Enabled = true;
            CheckBox2.Enabled = true;
            CheckBox3.Enabled = true;
            DropDownList1.Enabled = true;
            TextBox2.Enabled = true;
            TextBox3.Enabled = true;
            DropDownList2.Enabled = true;
            Button3.Visible = false;
            Button1.Visible = true;
        }
        protected bool validarcheck()
        {

            if (CheckBox1.Checked || CheckBox2.Checked || CheckBox3.Checked)
            {
                return true;
            }
            else
            {
                textError.InnerHtml = "Por favor seleccionar un servicio";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
                return false;
            }

        }
    }
}