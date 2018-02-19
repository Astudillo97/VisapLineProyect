using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using VisapLine.DataAccess.Data;
using VisapLine.DataAccess.Connection;
using System.Data;

namespace VisapLine.Model
{
    public class Permisos
    {
        IData data = new Data();
        public string idpermisos { get; set; }
        public string rol_idrol { get; set; }
        public string permisos { get; set; }
        public string menu_idmenu { get; set; }
        Menu men = new Menu();
        public DataTable ConsultarPermisos()
        {
            return data.ConsultarDatos("");
        }

        public bool RegistrarPermisos(Permisos per)
        {
            return data.OperarDatos("select * from public.pr_insertarpermiso(" + per.rol_idrol + ",'" + per.permisos + "'," + per.menu_idmenu + ")");
        }
        public DataTable ConsultarRolPermisos(string rol)
        {
            return data.ConsultarDatos("select * from pr_consularmenu(" + rol + ")");
        }

        public bool ValidarPermisos(string url, DataTable entrada)
        {
            bool ret = false;
            DataTable dat = ConsultarRolPermisos(entrada.Rows[0]["idrol"].ToString());


            for (int i = 0; i < dat.Rows.Count && ret == false; i++)
            {
                men.menu_idmenusub = dat.Rows[i]["idmenu"].ToString();
                DataTable sub = men.ConsultarMenuSubmenu(men);
                for (int j = 0; j < sub.Rows.Count && ret == false; j++)
                {
                    if (dat.Rows[i]["href"].ToString().Equals(url))
                    {
                        ret = true;
                        break;
                    }
                }
            }
            return ret;
        }
    }
}