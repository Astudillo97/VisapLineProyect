using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using VisapLine.Exeption;
using VisapLine.Model;

namespace VisapLine.View.Private
{

    public partial class servicio : System.Web.UI.Page
    {

        Terceros terc = new Terceros();
        TipoTercero ttr = new TipoTercero();
        Pais pais = new Pais();
        Departamento depart = new Departamento();
        Municipio munic = new Municipio();
        Barrios barr = new Barrios();
        TipoFactura tpfact = new TipoFactura();
        TipoResidencia tpres = new TipoResidencia();
        TipoDoc tpdoc = new TipoDoc();
        Telefono tlf = new Telefono();
        CargoTercero ctg = new CargoTercero();
        static Contrato ctt = new Contrato();
        Servicios srv = new Servicios();
        Inventario invt = new Inventario();
        Caracteristicas crts = new Caracteristicas();
        PlanSCaract psc = new PlanSCaract();
        static int idcontrato;
        static int idpedido;
        static int idsrv;
        Puntos punto = new Puntos();
        public DataTable punt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            punt = punto.ConsultarPuntosllenos();

            if (!IsPostBack)
            {
                try
                {
                    DropDownListpais.DataSource = pais.ConsultarPais();
                    DropDownListpais.DataTextField = "pais";
                    DropDownListpais.DataValueField = "idpais";
                    DropDownListpais.DataBind();
                    idcontrato = int.Parse(Request.QueryString["key"]);
                    DataTable dpcdt = ctt.consultadeserciciodeplancontratado(idcontrato);
                    cargardtservicio();
                    DataRow rdt = dpcdt.Rows[0];
                    bool telefoo = bool.Parse(rdt["telef"].ToString());
                    if (telefoo)
                    {
                        divtelefono.Visible = true;
                    }
                    bool tv = bool.Parse(rdt["tv"].ToString());
                    if (tv)
                    {
                        divtv.Visible = true;
                    }
                    bool internet = bool.Parse(rdt["inter"].ToString());
                    if (internet)
                    {
                        divinternet.Visible = true;
                        DataTable crtsdt = crts.ConsultarCaracteristicas();
                        gridcaract.DataSource = crtsdt;
                        gridcaract.DataBind();

                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "pop", "swal({title: 'UUUUPSSS!!!!', text: 'Algo ha ocurrido estamos trabajando para solucionarlo',imageUrl: '../../Contenido/images/monkeyprogramer.jpg',imageSize: '400x250'}, function() { window.location.href = 'index.aspx'; })", true);}
            }
            else
            {
                cargardtservicio();
            }

        }

        protected void DropDownListpais_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                DropDownListdepartamento.Items.Clear();
                DropDownListdepartamento.Items.Add(new ListItem("Seleccione", "Seleccione"));
                depart.pais_idpais = Validar.validarselected(DropDownListpais.SelectedValue);
                DropDownListdepartamento.DataSource = Validar.Consulta(depart.ConsultarDepartamentoIdPais(depart));
                DropDownListdepartamento.DataTextField = "departamento";
                DropDownListdepartamento.DataValueField = "iddepartamento";
                DropDownListdepartamento.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;

            }

        }
        protected void DropDownListdepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {

                DropDownListmunicipio.Items.Clear();
                DropDownListmunicipio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                munic.departamento_iddepartamento = Validar.validarselected(DropDownListdepartamento.SelectedValue);
                DropDownListmunicipio.DataSource = Validar.Consulta(munic.ConsultarMunicipioIdDepartamento(munic));
                DropDownListmunicipio.DataTextField = "municipio";
                DropDownListmunicipio.DataValueField = "idmunicipio";
                DropDownListmunicipio.DataBind();


            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }
        protected void DropDownListmunicipio_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DropDownListbarrio.Items.Clear();
                DropDownListbarrio.Items.Add(new ListItem("Seleccione", "Seleccione"));
                barr.muninicio_idmunicipio = Validar.validarselected(DropDownListmunicipio.SelectedValue);
                DropDownListbarrio.DataSource = Validar.Consulta(barr.ConsultarBarriosIdMunicipio(barr));
                DropDownListbarrio.DataTextField = "barrios";
                DropDownListbarrio.DataValueField = "idbarrios";
                DropDownListbarrio.DataBind();
            }
            catch (Exception ex)
            {
                textError.InnerHtml = ex.Message;
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }


        }

        private void cargardtservicio()
        {
            gridservicios.DataSource = srv.consultaservicioscont(idcontrato);
            gridservicios.DataBind();
        }

        private DataTable GetIvserdt()
        {
            return invt.selecionarinventarioparaservicio();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Visible = false;
            invt.cancelarselecioninventarion(idpedido);
            listequipo.Visible = false;
            gridcaract.Visible = false;
            //btninser.Visible = false;
        }

        //protected void btninser_Click(object sender, EventArgs e)
        //{
        //    bool ctrl = true;
        //    if (ip.Text.Equals("")){
        //        ctrl = false;
        //    }
        //    for (int i = 0; i < gridcaract.Rows.Count && ctrl; i++)
        //    {
        //        TextBox texto = (TextBox)gridcaract.Rows[i].Cells[2].FindControl("cantida");
        //        if (texto.Text.Equals("")) {
        //            ctrl = false;
        //        }
        //    }
        //    if (ctrl)
        //    {
        //        DataRow dtrs = ctt.estratoymegas(idcontrato).Rows[0];
        //        DataTable dtid = srv.crearservicio(ip.Text, int.Parse(dtrs[0].ToString()), idcontrato, dtrs[1].ToString(), "POR INSTALAR", "INTERNET", idpedido ,TextBoxdireccion.Text, int.Parse(DropDownListbarrio.SelectedValue));
        //        int idservi = int.Parse(dtid.Rows[0][0].ToString());
        //        for (int i = 0; i < gridcaract.Rows.Count; i++)
        //        {
        //            TextBox texto = (TextBox)gridcaract.Rows[i].Cells[2].FindControl("cantida");
        //            psc.RegistrarPlanSCatact(idservi, int.Parse(gridcaract.Rows[i].Cells[0].Text), int.Parse(texto.Text));
        //        }
        //    }
        //    else {
        //        textError.InnerHtml = "POR FAVOR DIGITE TODOS LOS CAMPOS";
        //        Alerta.CssClass = "alert alert-error";
        //        Alerta.Visible = true;
        //    }
        //}

        protected void creartev_Click(object sender, EventArgs e)
        {
            if (!txbdiptv.Text.Equals(""))
            {
                if (!txbptv.Text.Equals(""))
                {
                    DataRow dtrs = ctt.estratoymegas(idcontrato).Rows[0];
                    DataTable dtid = srv.crearsertv(txbdiptv.Text, idcontrato, dtrs[1].ToString(), "POR INSTALAR", "TELEVISION", TextBoxdireccion.Text, int.Parse(DropDownListbarrio.SelectedValue));
                    int idservi = int.Parse(dtid.Rows[0][0].ToString());
                    psc.registrarpuertos(idservi, int.Parse(txbptv.Text));
                    divtv.Visible = false;
                }
                else
                {
                    textError.InnerHtml = "POR FAVOR DIGITE TODOS LOS PUERTOS";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }

            }
            else
            {
                textError.InnerHtml = "POR FAVOR DIGITE LA DIRECCION IP";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void ceartl_Click(object sender, EventArgs e)
        {
            if (!TextBox1.Text.Equals(""))
            {
                if (!TextBox2.Text.Equals(""))
                {
                    DataRow dtrs = ctt.estratoymegas(idcontrato).Rows[0];
                    DataTable dtid = srv.crearsertv(TextBox1.Text, idcontrato, dtrs[1].ToString(), "POR INSTALAR", "TELEFONIA", TextBoxdireccion.Text, int.Parse(DropDownListbarrio.SelectedValue));
                    int idservi = int.Parse(dtid.Rows[0][0].ToString());
                    psc.registrarpuertos(idservi, int.Parse(TextBox2.Text));
                    divtelefono.Visible = false;
                }
                else
                {
                    textError.InnerHtml = "POR FAVOR DIGITE TODOS LOS PUERTOS";
                    Alerta.CssClass = "alert alert-error";
                    Alerta.Visible = true;
                }

            }
            else
            {
                textError.InnerHtml = "POR FAVOR DIGITE LA DIRECCION IP";
                Alerta.CssClass = "alert alert-error";
                Alerta.Visible = true;
            }

        }

        protected void gridservicios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridservicios.PageIndex = e.NewPageIndex;
            cargardtservicio();
        }

        protected void gridservicios_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "POR INSTALAR")
                {
                    e.Row.BackColor = System.Drawing.Color.FromName("#ffc7ce");
                }
                if (e.Row.Cells[3].Text == "INACTIVO")
                {
                    e.Row.BackColor = System.Drawing.Color.FromName("#ffeb9c");
                }
                if (e.Row.Cells[3].Text == "ACTIVO")
                {
                    e.Row.BackColor = System.Drawing.Color.FromName("#c6efce");
                }
            }
        }

        protected void asignarequipo(object sender, EventArgs e)
        {
            Servicios serve = new Servicios();
            if (serve.vaalidarmegas(txtmegasasignar.Text, idcontrato))
            {
                DataRow dtrs = ctt.estratoymegas(idcontrato).Rows[0];
                DataTable dtid = serve.crearservicio(ip.Text, int.Parse(txtmegasasignar.Text), idcontrato, dtrs[1].ToString(), "POR INSTALAR", "INTERNET", txtseralasignar.Text, TextBoxdireccion.Text, int.Parse(DropDownListbarrio.SelectedValue));
                if (dtid.Rows.Count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "successasignation()", true);
                    cargardtservicio();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "errorasignation()", true);
                    cargardtservicio();
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", "errorasignation()", true);
                cargardtservicio();
            }
        }
        protected void gridservicios_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow grvr = gridservicios.SelectedRow;
            idsrv = int.Parse(grvr.Cells[0].Text);
            Response.Redirect("detalleservicio.aspx?addds=" + idsrv);
        }

        protected void txtseralasignar_TextChanged(object sender, EventArgs e)
        {
            string dato = txtseralasignar.Text;
            DataTable dt = invt.consultarinventario(dato);
            if (dt.Rows[0][1].ToString().Equals("MAC")) {
                identificacion.Text = dt.Rows[0][0].ToString();
            }
            else {
                txtseralasignar.Text= dt.Rows[0][0].ToString(); 
                identificacion.Text = dato;
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(),"pop", "openmodal()",true);
            
        }
    }
}