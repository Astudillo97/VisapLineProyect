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
   
    public partial class servicio : System.Web.UI.Page
    {
       
        Contrato ctt = new Contrato();
        Servicios srv = new Servicios();
        Inventario invt = new Inventario();
        Caracteristicas crts = new Caracteristicas();
        PlanSCaract psc = new PlanSCaract();
        static int idpedido;



        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (!IsPostBack) {
                DataTable dpcdt = ctt.consultadeserciciodeplancontratado(8);
                
                DataRow rdt = dpcdt.Rows[0];
                bool telefoo= bool.Parse(rdt["telef"].ToString());
                if (telefoo) {
                    divtelefono.Visible = true;
                }
                bool tv = bool.Parse(rdt["tv"].ToString());
                if (tv) {
                    divtv.Visible = true;
                }
                bool internet = bool.Parse(rdt["inter"].ToString());
                if (internet) {
                    divinternet.Visible = true;
                    DataTable crtsdt=crts.ConsultarCaracteristicas();
                    gridcaract.DataSource = crtsdt;
                    gridcaract.DataBind();

                }
                
            }

        }

        protected void btnequipo_Click(object sender, EventArgs e)
        {
            
            btnequipo.Visible=false;
            DataTable ivserdt = GetIvserdt();
            idpedido=int.Parse(ivserdt.Rows[0]["idinventario"].ToString());
            listequipo.DataSource = ivserdt;
            listequipo.DataBind();
            listequipo.Visible = true;
            Button1.Visible = true;
            gridcaract.Visible = true;
            btninser.Visible = true;
        }

        private DataTable GetIvserdt()
        {
            return invt.selecionarinventarioparaservicio();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button1.Visible = false;
            invt.cancelarselecioninventarion(idpedido);
            listequipo.Visible=false;
            btnequipo.Visible = true;
            gridcaract.Visible = false;
            btninser.Visible = false;
        }

        protected void btninser_Click(object sender, EventArgs e)
        {
            DataRow dtrs=ctt.estratoymegas(8).Rows[0];
            DataTable dtid = srv.crearservicio(ip.Text,int.Parse(dtrs[0].ToString()), 8, dtrs[1].ToString(), "POR INSTALAR", "LA CASA DE AZUL", 1, idpedido);
            int idservi = int.Parse(dtid.Rows[0][0].ToString());
            for (int i = 0; i < gridcaract.Rows.Count; i++)
            {
                TextBox texto = (TextBox)gridcaract.Rows[i].Cells[2].FindControl("cantida");
                psc.RegistrarPlanSCatact(idservi,int.Parse(gridcaract.Rows[i].Cells[0].Text),int.Parse(texto.Text));             
            }
        }
    }
}